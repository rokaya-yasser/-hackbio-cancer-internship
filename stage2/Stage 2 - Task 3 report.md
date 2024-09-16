**Stage 2 Report**

**Authors:** Amaka Madubuike, Nnadiekwe Chigozie, Niguse Kelile Lema, Owolabi Oluwatosin, Raqeebat Rafiu and Rokaya Yasser.

**Overview:**

A glioblastoma gene expression dataset was analyzed using an R script for preprocessing, statistical analysis, and visualization with plots and heatmaps.The dataset and libraries (gplots) were loaded into R Studio to create customized heatmaps, displaying genes and samples with similar expression patterns. Two heatmap versions, using diverging and sequential color palettes, were generated to enhance the visual grouping of genes and samples. Fold change and p-values were calculated after grouping the data, with p-values determined via t-test. The results were visualized using a scatter plot of fold change and -log10(p-value). Up-regulated genes had a cutoff of log2(1.5), and down-regulated genes had a cutoff of log2(0.16), with a p-value of 0.05 indicating statistical significance. The up- and down-regulated genes were then displayed.

**Research findings:**
### **Importance of Color Selection for Data Interpretation:**
A diverging heatmap displays data around a critical midpoint (e.g., zero), showing positive and negative trends, while a sequential heatmap highlights data progressing in one direction, from minimum to maximum. Proper color choices enhance clarity: diverging heatmaps use contrasting colors (like blue-red) to show opposing trends, while sequential heatmaps use gradual color scales (e.g., white-blue) for continuous data interpretation.
![Sequential Heatmpa](https://github.com/user-attachments/assets/427d3354-14e8-4fc3-98a5-53dcbdf410a2)

Fig 1 Sequential Heatmap

![Diverging Heatmap](https://github.com/user-attachments/assets/1dbb6e36-d1b6-48dd-8cd8-9879766abeac)

Fig 2 Diverging heatmap

![Genes Only](https://github.com/user-attachments/assets/3e50abc1-dda8-4fbb-adff-e051f951398a)

Fig 3 Cluster of genes 

![Samples Only](https://github.com/user-attachments/assets/d1c711c5-4a27-497d-8507-f8c50a5b9e50)

Fig 4 Cluster of samples

![Genes and Samples](https://github.com/user-attachments/assets/c9457584-e401-4dc6-9b14-88fe0395db43)

Fig 5 Clusters of Genes and samples 



**1-Top 3 Down-Regulated Gene:**

The Top 3 Down-Regulated Gene Functions are anion Binding, arylamine N-acetyltransferase activity with p-values of 6.11E-07, 7.97E-06 and 7.97E-06 respectively. The top down-regulated gene functions suggest critical effects on ion balance, xenobiotic metabolism, and fatty acid oxidation. This down-regulation could have implications in various biological processes, including cellular signaling, detoxification, and energy metabolism.


![Aspose Words 9227c33d-5700-4d0c-8026-8540b867fd27 004](https://github.com/user-attachments/assets/842e9f21-e550-4a04-97d9-29dcfb1c258a)

Fig , Subset of genes using volcano plot

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
   
![Enrichment analysis](https://github.com/user-attachments/assets/b12fc8b7-5308-4b25-b0c1-9692dfedd6d3)
Fig , enrichment analysis 

**Conclusion** 

In conclusion, the analysis of glioblastoma gene expression data using R scripts effectively identified significant gene expression patterns. Customized heatmaps and scatter plots highlighted up- and down-regulated genes based on fold change and statistical significance, providing valuable insights into the gene expression profiles relevant to the condition.

**References:**

Chen, HH., Tseng, Y., Wang, SY. et al. The metabolome profiling and pathway analysis in metabolic healthy and abnormal obesity. Int J Obes 39, 1241–1248 (2015). <https://doi.org/10.1038/ijo.2015.65>

Wang, D., Guo, S., He, H., Gong, L., & Cui, H. (2020). Gut microbiome and serum metabolome analyses identify unsaturated fatty acids and butanoate metabolism induced by gut microbiota in patients with chronic spontaneous urticaria. *Frontiers in Cellular and Infection Microbiology*, *10*. <https://doi.org/10.3389/fcimb.2020.00024>

Goepfert, S., & Poirier, Y. (2007). Β-oxidation in fatty acid degradation and beyond. *Current Opinion in Plant Biology*, *10*(3), 245–251. <https://doi.org/10.1016/j.pbi.2007.04.007>


