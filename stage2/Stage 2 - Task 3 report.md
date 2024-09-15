**Stage 2 Report**

**Authors:** Amaka Madubuike, Nnadiekwe Chigozie, Niguse Kelile Lema, Owolabi Oluwatosin, Raqeebat Rafiu and Rokaya Yasser.

**Overview:**

A glioblastoma gene expression dataset was analyzed using an R script for preprocessing, statistical analysis, and visualization with plots and heatmaps.The dataset and libraries (gplots) were loaded into R Studio to create customized heatmaps, displaying genes and samples with similar expression patterns. Two heatmap versions, using diverging and sequential color palettes, were generated to enhance the visual grouping of genes and samples. Fold change and p-values were calculated after grouping the data, with p-values determined via t-test. The results were visualized using a scatter plot of fold change and -log10(p-value). Up-regulated genes had a cutoff of log2(1.5), and down-regulated genes had a cutoff of log2(0.16), with a p-value of 0.05 indicating statistical significance. The up- and down-regulated genes were then displayed.

**Research findings:**
### **Importance of Color Selection for Data Interpretation:**
A diverging heatmap displays data around a critical midpoint (e.g., zero), showing positive and negative trends, while a sequential heatmap highlights data progressing in one direction, from minimum to maximum. Proper color choices enhance clarity: diverging heatmaps use contrasting colors (like blue-red) to show opposing trends, while sequential heatmaps use gradual color scales (e.g., white-blue) for continuous data interpretation.

**1-Top 3 Down-Regulated Gene:**

The Top 3 Down-Regulated Gene Functions are anion Binding, arylamine N-acetyltransferase activity with p-values of 6.11E-07, 7.97E-06 and 7.97E-06 respectively. The top down-regulated gene functions suggest critical effects on ion balance, xenobiotic metabolism, and fatty acid oxidation. This down-regulation could have implications in various biological processes, including cellular signaling, detoxification, and energy metabolism.

<a name="_dyuw9vq7ypv7"></a>**2- Analysis of the Top 3 Enriched Pathways:**

1. **Propanoate metabolism (hsa00640)**

   **Fold Enrichment**: ~45

   **Number of Genes**: 5

   **FDR Significance (-log10(FDR))**: ~2.5

   **Details**: This pathway involves the metabolism of propanoate, an important intermediate in the breakdown of amino acids and fatty acids. The high fold enrichment suggests that this pathway plays a crucial role in the studied condition, possibly indicating altered energy or lipid metabolism.

1. **Butanoate metabolism (hsa00650)**

**Fold Enrichment**: ~40

**Number of Genes**: 5

**FDR Significance (-log10(FDR))**: ~2.5

**Details**: Butanoate (butyrate) metabolism is vital for cellular energy production, especially in the colon, where it serves as a major energy source for colonocytes. The strong enrichment may suggest an alteration in gut health or energy production.

1. **Fatty acid degradation (hsa00071)**

   **Fold Enrichment**:** ~35

   **Number of Genes**: 4

   **FDR Significance (-log10(FDR))**: ~2.5

   **Details**: This pathway deals with the breakdown of fatty acids for energy. Dysregulation in this pathway may indicate metabolic disorders or changes in lipid homeostasis, contributing to disease conditions such as diabetes or obesity.


**Conclusion** 

In conclusion, the analysis of glioblastoma gene expression data using R scripts effectively identified significant gene expression patterns. Customized heatmaps and scatter plots highlighted up- and down-regulated genes based on fold change and statistical significance, providing valuable insights into the gene expression profiles relevant to the condition.


