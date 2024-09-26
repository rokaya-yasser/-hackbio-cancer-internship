# this is stage 2 HackBio Cancer Bioinformatics task

# setting up working directories 
# getwd()
# setwd("C:/Users/nigus/Documents/HackBio")
# getwd()

# enable libraries
library(gplots)
library(pheatmap)
library(ggplot2)
library(enrichR)

# downloadin the dataset
url <- "https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv"
data <- read.csv(url, row.names = 1)

# data preprocessing
data_log <- log2(data + 1)

# Diverging color palette (red to blue)
heatmap.2(as.matrix(data_log), 
          col = bluered(100), 
          trace = "none", 
          scale = "row", 
          margins = c(5, 10), 
          main = "Diverging Heatmap")

# Sequential color palette (white to blue)
heatmap.2(as.matrix(data_log), 
          col = colorRampPalette(c("white", "blue"))(100), 
          trace = "none", 
          scale = "row", 
          margins = c(5, 10), 
          main = "Sequential Heatmap")

# Cluster genes (rows) only
heatmap.2(as.matrix(data_log), 
          col = bluered(100), 
          trace = "none", 
          scale = "row", 
          margins = c(5, 10), 
          dendrogram = "row", 
          main = "Genes Only")

# Cluster samples (columns) only
heatmap.2(as.matrix(data_log), 
          col = bluered(100), 
          trace = "none", 
          scale = "row", 
          margins = c(5, 10), 
          dendrogram = "column", 
          main = "Samples Only")

# Cluster both genes and samples
heatmap.2(as.matrix(data_log), 
          col = bluered(100), 
          trace = "none", 
          scale = "row", 
          margins = c(5, 10), 
          dendrogram = "both", 
          main = "Genes and Samples")


# Subset significantly upregulated/downregulated genes
# Define cutoff values for fold change and p-value
fold_change_cutoff <- 1.5   # Log2 Fold Change cutoff
p_value_cutoff <- 0.05      # P-value cutoff

# Simulating fold change and p-values for illustration
set.seed(123)
fold_change <- rnorm(nrow(data), mean = 0, sd = 2)
p_values <- runif(nrow(data))

# Add fold change and p-values to the data
data$fold_change <- fold_change
data$p_value <- p_values

# Subset upregulated genes
upregulated_genes <- subset(data, fold_change > fold_change_cutoff & p_value < p_value_cutoff)

# Subset downregulated genes
downregulated_genes <- subset(data, fold_change < -fold_change_cutoff & p_value < p_value_cutoff)


# Subset data based on upregulated and downregulated genes
# Using previously created subset of upregulated genes
upregulated_data <- data[rownames(upregulated_genes),]

# Using previously created subset of downregulated genes
downregulated_data <- data[rownames(downregulated_genes),]

# Log-transform the data for better visualization
upregulated_data_log <- log2(upregulated_data + 1)
downregulated_data_log <- log2(downregulated_data + 1)

# Define color palette for heatmap
heatmap_colors <- colorRampPalette(c("blue", "white", "red"))(75)

# Generate heatmap for upregulated genes
heatmap.2(as.matrix(upregulated_data_log), 
          col = heatmap_colors, 
          trace = "none", 
          dendrogram = "both", 
          scale = "row", 
          margins = c(10,10),
          main = "Upregulated Genes", 
          xlab = "Samples", 
          ylab = "Genes")

# Generate heatmap for downregulated genes
heatmap.2(as.matrix(downregulated_data_log), 
          col = heatmap_colors, 
          trace = "none", 
          dendrogram = "both", 
          scale = "row", 
          margins = c(10,10),
          main = "Downregulated Genes", 
          xlab = "Samples", 
          ylab = "Genes")

# Load the CSV file
enrichment_data <- read.csv("C:/Users/nigus/Documents/HackBio/data/enrichment_biological_processes.csv")

# View the first few rows
head(enrichment_data)

# Sort the data by the FDR (ascending order)
enrichment_data_sorted <- enrichment_data[order(enrichment_data$Enrichment.FDR), ]

# Select the top 5 pathways
top5_pathways <- enrichment_data_sorted[1:5, ]

# Select the top 3 pathways
top3_pathways <- enrichment_data_sorted[1:3, ]

# Extract the genes from the top 5 pathways
top5_genes <- top5_pathways$Genes

# Extract the genes from the top 3 pathways
top3_genes <- top3_pathways$Genes

# Assuming enrichment_data_sorted has the top pathways already sorted by FDR
top5_pathways <- enrichment_data_sorted[1:5, ]

# Calculate the negative log10 of the FDR for each pathway
top5_pathways$neg_log10_FDR <- -log10(top5_pathways$Enrichment.FDR)


# Create a bubble plot
ggplot(top5_pathways, aes(x=reorder(Pathway, neg_log10_FDR), y=neg_log10_FDR)) +
  geom_point(aes(size=nGenes, color=neg_log10_FDR)) +
  scale_color_gradient(low="blue", high="red") +
  labs(title="Top 5 Enriched Pathways",
       x="Pathway",
       y="-log10(FDR)",
       size="Number of Genes",
       color="-log10(FDR)") +
  theme_minimal() +
  coord_flip()
