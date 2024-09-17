# **Differential Gene Expression Analysis of a Glioblastoma dataset.** #

**Authors (@slack):** Amaka Madubuike (@Ace_well), Nnadiekwe Chigozie (@Chigozie), Niguse Kelile Lema (@King), Owolabi Oluwatosin (@Oluwatosin), Raqeebat Rafiu (@Raqeebahh) and Rokaya Yasser (@Rokaya).

**Link to code:** https://github.com/rokaya-yasser/-hackbio-cancer-internship/blob/main/stage2/Task%203%20(Stage%202)_Coding_and_Visualization.R

**Link to dataset:** https://raw.githubusercontent.com/HackBio-Internship/public_datasets/main/Cancer2024/glioblastoma.csv

**Overview:**

A glioblastoma gene expression dataset was analyzed using an R script for preprocessing, statistical analysis, and visualization with plots and heatmaps.The dataset and libraries (gplots) were loaded into R Studio to create customized heatmaps, displaying genes and samples with similar expression patterns. Two heatmap versions, using diverging and sequential color palettes, were generated to enhance the visual grouping of genes and samples. Fold change and p-values were calculated after grouping the data, with p-values determined via t-test. The results were visualized using a scatter plot of fold change and -log10(p-value). Up-regulated genes had a cutoff of log2(1.5), and down-regulated genes had a cutoff of log2(0.16), with a p-value of 0.05 indicating statistical significance. The up- and down-regulated genes were then displayed.

## **Research findings:**

**Task 1 (a):** Generation of heatmap for the entire dataset using a diverging and sequential colour palette.

![Diverging Heatmap](https://github.com/user-attachments/assets/1dbb6e36-d1b6-48dd-8cd8-9879766abeac)
Fig. 1: Heatmap with diverging colour palette


![Sequential Heatmpa](https://github.com/user-attachments/assets/427d3354-14e8-4fc3-98a5-53dcbdf410a2)
Fig. 2: Heatmap with sequential colour palette

**Task 1 (b):**
**Importance of Color Selection for Data Interpretation:**
A diverging heatmap displays data around a critical midpoint (e.g., zero), showing positive and negative trends, while a sequential heatmap highlights data progressing in one direction, from minimum to maximum. Proper color choices enhance clarity: diverging heatmaps use contrasting colors (like blue-red) to show opposing trends, while sequential heatmaps use gradual color scales (e.g., white-blue) for continuous data interpretation.

**Task 2:** Using the same heatmap, generation of a variant of the heatmap where,
a. Genes (rows) alone are clustered

![Genes Only](https://github.com/user-attachments/assets/3e50abc1-dda8-4fbb-adff-e051f951398a)
Fig. 3: Cluster of genes.

b. Samples (col) alone are clustered

![Samples Only](https://github.com/user-attachments/assets/d1c711c5-4a27-497d-8507-f8c50a5b9e50)
Fig. 4: Cluster of samples.

c. Both genes and samples are clustered
![Genes and Samples](https://github.com/user-attachments/assets/c9457584-e401-4dc6-9b14-88fe0395db43)
Fig. 5: Clusters of genes and samples.

**Task 3:** Subset of significantly upregulated and downregulated genes

![Aspose Words 9227c33d-5700-4d0c-8026-8540b867fd27 004](https://github.com/user-attachments/assets/842e9f21-e550-4a04-97d9-29dcfb1c258a)

Fig. 6: Volcano plot of glioblastoma dataset

**Task 4:** Functional enrichment analysis was carried out using ShinyGO, to identify biological pathways that are significantly overrepresented in the gene expression dataset.

![enrichment_biological_processes](https://github.com/user-attachments/assets/ee7f2312-6a11-410b-8684-1ad297fdbc29)
Fig. 7: Result of functional enrichment analysis.

**Task 5:** A straightforward visualization (bubble plot) which displays the number of genes associated with each pathway was created using the downregulated genes. The top 5 enriched pathways were then identified.

![top_5_enriched_pathways_720](https://github.com/user-attachments/assets/78eeb257-d4d2-4a36-acc1-3ca49c82de68)
Fig. 8: Bubble plot of top 5 enriched pathways.

**Task 6:** Description of the top 3 enriched pathways according to biological process.

1. **Regulation of Biosynthetic and Cellular Biosynthetic Process** (GO:0031326) controls the synthesis of macromolecules crucial for cell growth. In glioblastoma, dysregulation of this process promotes rapid tumor proliferation and survival by enhancing lipid, protein, and nucleotide biosynthesis, driven by pathways like mTOR and MYC ( Masui _et al._, 2019).

2. **Transcription by RNA Polymerase II (GO:0006366):** This pathway focuses on the process by which RNA Polymerase II transcribes DNA into messenger RNA (mRNA), a crucial step in gene expression. RNA Polymerase II-mediated transcription is critical for regulating genes involved in cell cycle control, apoptosis, and DNA repair. Aberrant transcriptional control in glioblastoma is often driven by genetic and epigenetic changes, such as mutations in transcription factors or histone modifications, leading to the unchecked growth of tumor cells.
   
## **Conclusion** ## 

In conclusion, this analysis reveals significant dysregulation in key biological processes that underpin glioblastoma's aggressive nature. These insights provide a foundation for future studies aimed at targeting these pathways to improve therapeutic outcomes for patients with glioblastoma.

## **References:** ##

Masui K, Harachi M, Ikegami S, Yang H, Onizuka H, Yong WH, Cloughesy TF, Muragaki Y, Kawamata T, Arai N, Komori T, Cavenee WK, Mischel PS, Shibata N. mTORC2 links growth factor signaling with epigenetic regulation of iron metabolism in glioblastoma. Journal of Biological Chemistry, 2019 Dec 20; 294(51): 19740-19751. doi: 10.1074/jbc.RA119.011519. PMCID: PMC6926466.

