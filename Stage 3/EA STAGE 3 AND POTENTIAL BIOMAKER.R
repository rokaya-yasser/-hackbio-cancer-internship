library(readr)
library(biomaRt)
library("TCGAbiolinks")
library(SummarizedExperiment)
library(biomaRt)
library(ggplot2)
library(EDASeq)
library(dplyr)
library(tidyr)
# Load the CSV files

upregulated <- read_csv("EM_stringent_overregulated.csv")
downregulated <- read_csv("EM_stringent_underregulated.csv")

# Initialize the Ensembl database
mart <- useMart("ensembl", dataset = "hsapiens_gene_ensembl")

# Extract the Ensembl IDs from your data
upregulated_ids <- upregulated$X
downregulated_ids <- downregulated$X

# Get gene symbols for upregulated genes
upregulated_gene_info <- getBM(
  attributes = c('ensembl_gene_id', 'hgnc_symbol'),
  filters = 'ensembl_gene_id',
  values = upregulated_ids,
  mart = mart
)
# Get gene symbols for downregulated genes
downregulated_gene_info <- getBM(
  attributes = c('ensembl_gene_id', 'hgnc_symbol'),
  filters = 'ensembl_gene_id',
  values = downregulated_ids,
  mart = mart
)
# Merge the gene symbols with your original datasets
upregulated_with_symbols <- merge(upregulated, upregulated_gene_info, by.x = "X", by.y = "ensembl_gene_id")
downregulated_with_symbols <- merge(downregulated, downregulated_gene_info, by.x = "X", by.y = "ensembl_gene_id")

# Sort by logFC to get the top 5
top_5_upregulated <- upregulated_with_symbols[order(-upregulated_with_symbols$logFC), ][1:5, ]
top_5_downregulated <- downregulated_with_symbols[order(downregulated_with_symbols$logFC), ][1:5, ]

#save in CSV 

write.csv(top_5_upregulated, "top 5 upreggene.csv", row.names = FALSE)
write.csv(top_5_downregulated, "top 5 down reggene.csv", row.names = FALSE)


# Enrichment Analysis

# Prepare gene lists for enrichment analysis
upregulated_genes <- na.omit(top_5_upregulated$hgnc_symbol)
downregulated_genes <- na.omit(top_5_downregulated$hgnc_symbol)

# Perform enrichment analysis using TCGAAnalyse_EAcomplete

upreggeneEA <- TCGAanalyze_EAcomplete(TFname="UPREGULATEDGENE_EA", upregulated_genes)
downreggeneEA <- TCGAanalyze_EAcomplete(TFname="DOWNREGULATEDGENE_EA", downregulated_genes)

# Save enrichment results in csv

write.csv(upreggeneEA, "upreggeneEA.csv", row.names = FALSE)
write.csv(downreggeneEA, "downreggeneEA.csv", row.names = FALSE)

#Read Your CSV: Read the enrichment results CSV file.

upregEA <- read.csv("upreggeneEA.csv")
downregEA <- read.csv("downreggeneEA.csv")

#Use the separate function from tidyr to split the enrichment results into separate columns.

upregEAplot <- upregEA %>%
  pivot_longer(cols = everything(), 
               names_to = "Enrichment_Type", 
               values_to = "Results") %>%
  separate(Results, into = c("GO_Term", "FDR", "ng", "ncommon"), sep = "; ", extra = "merge") %>%
  mutate(
    FDR = as.numeric(gsub("FDR= ", "", FDR)),
    ng = as.numeric(gsub("\\(ng=|\\)", "", ng)),
    ncommon = as.numeric(gsub("\\(ncommon=|\\)", "", ncommon))
  )

downregEAplot <- downregEA %>%
  pivot_longer(cols = everything(), 
               names_to = "Enrichment_Type", 
               values_to = "Results") %>%
  separate(Results, into = c("GO_Term", "FDR", "ng", "ncommon"), sep = "; ", extra = "merge") %>%
  mutate(
    FDR = as.numeric(gsub("FDR= ", "", FDR)),
    ng = as.numeric(gsub("\\(ng=|\\)", "", ng)),
    ncommon = as.numeric(gsub("\\(ncommon=|\\)", "", ncommon))
  )

# Save EA results in csv

write.csv(upregEAplot, "upreggeneplot.csv", row.names = FALSE)
write.csv(downregEAplot, "downreggeneplot.csv", row.names = FALSE)

# Read the EA CSV data

upregdata <- read.csv("upreggeneplot.csv")
downregdata <- read.csv("downreggeneplot.csv")

# Select the top 5 pathways based on FDR

upregtop_5 <- upregdata[1:5, ]
downregtop_5 <- downregdata[1:5, ]

# Create a new column for -log10(FDR) to use for coloring

upregtop_5$logFDR <- -log10(upregtop_5$FDR)
downregtop_5$logFDR <- -log10(downregtop_5$FDR)

# Extract the Pathway names from the GO_Term

upregtop_5$Pathway <- gsub("GO:\\d+~", "", upregtop_5$GO_Term)
downregtop_5$Pathway <- gsub("GO:\\d+~", "", downregtop_5$GO_Term)

# Create the lollipop plot

ggplot(upregtop_5, aes(x = FDR, y = reorder(Pathway, FDR))) +
  geom_segment(aes(xend = 0, yend = Pathway), color = "grey") +
  geom_point(aes(size = ng, color = logFDR), shape = 16) +  # Use ng for size
  scale_color_gradient(low = "blue", high = "red") +  # Color gradient from blue to red
  scale_size_continuous(range = c(3, 8)) +  # Adjusting the circle size range
  theme_minimal() +
  labs(title = "Top 5 Upregulated Genes Enriched Pathways",
       x = "-log10(FDR)",
       y = "Pathways",
       color = "-log10(FDR)",
       size = "Number of Genes") +
  theme(axis.text.y = element_text(size = 12),
        axis.text.x = element_text(size = 12),
        plot.title = element_text(size = 14, hjust = 0.5),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10))

# Save the plot

ggsave("upreggenepathway_plot.png", width = 12, height = 6, dpi = 300, bg = "white")

ggplot(downregtop_5, aes(x = FDR, y = reorder(Pathway, FDR))) +
  geom_segment(aes(xend = 0, yend = Pathway), color = "grey") +
  geom_point(aes(size = ng, color = logFDR), shape = 16) +  # Use ng for size
  scale_color_gradient(low = "blue", high = "red") +  # Color gradient from blue to red
  scale_size_continuous(range = c(3, 8)) +  # Adjusting the circle size range
  theme_minimal() +
  labs(title = "Top 5 Downregulated Genes Enriched Pathways",
       x = "-log10(FDR)",
       y = "Pathways",
       color = "-log10(FDR)",
       size = "Number of Genes") +
  theme(axis.text.y = element_text(size = 12),
        axis.text.x = element_text(size = 12),
        plot.title = element_text(size = 14, hjust = 0.5),
        legend.title = element_text(size = 12),
        legend.text = element_text(size = 10))

# Save the plot

ggsave("downreggenepathway_plot.png", width = 12, height = 6, dpi = 300, bg = "white")