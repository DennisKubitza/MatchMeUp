# Match Me Up Before I Go-Go!—Estimating Matching Functions for VET Students in Spatially Connected Labor Markets

This repository contains the R scripts and data necessary to reproduce the analysis and results presented in the paper: **"Match Me Up Before I Go-Go!—Estimating Matching Functions for VET Students in Spatially Connected Labor Markets"** by Dennis Oliver Kubitza.


## ⚠️ Disclaimer

Please note that this paper is currently **under review** for publication. The code and methods presented in this repository should be considered preliminary and may be subject to change in the final version.


## 📝 About The Project

This paper explores the spatial factors that affect the matching process for Vocational Education and Training (VET) students in Germany. Local labor markets are interconnected, and job-matching is influenced by spillovers from neighboring markets. Using a Matching Model with spatially lagged stocks of unemployment and vacancies, the study analyzes efficiency, elasticities, and spatial spillovers across five professional groups.

The findings highlight the importance of accurate spatial modeling, showing that only indices based on realistic travel times or commuting data produce measurable spillovers. The results reveal professional heterogeneity in regional impacts on matching efficiency and find that better-connected regions exhibit a more balanced matching process.

---

## 📂 Repository Structure

The project is organized into the following main directories:

* `./config/`: Contains a list of all locally installed packages, providing detailed control over the R environment.
* `./renv/`: Contains the output of the `renv` package. This folder allows other users to restore and replicate the exact package environment used for this analysis, ensuring full reproducibility.
* `./DataPreparation/`: Contains the initial data preparation script (`1_DataPreparation.Rmd`), raw input data (under `Tables`, `Shapes`, `Wikidata`), and the Google API script.
* `./DataBackups/`: Stores pre-processed `.Rdata` files, including the crucial distance matrix data, to avoid re-running time-consuming scripts.
* `./Outputs/`: The destination for all final outputs relevant to the paper, including figures, LaTeX tables, and regression results.
* `./`: The root directory contains the four main analysis scripts (`1_Analysis_AAB_based.Rmd` to `4_Analysis_Profession_based.Rmd`).

---

Of course. Here is the corrected and improved version of your markdown text.

The main changes include fixing typos, improving sentence flow, and converting the raw link into a viewable HTML link that will render correctly in a browser.

-----

## 📜 Viewing the Protocols

To keep the repository size manageable, not every file generated during the analysis (e.g., intermediate tables, all regression outputs) is included here. However, the complete HTML protocol, which shows the full process and all outputs, is available for viewing online. 

You can view the main analysis protocol using the following links:
  * [**Analysis Protocol (1\_Analysis\_AAB\_based.html)**](https://htmlpreview.github.io/?https://raw.githubusercontent.com/DennisKubitza/MatchMeUp/refs/heads/main/1_Analysis_AAB_based.html)

Regression tables are published under Output/Regressions.


## 🚀 Instructions for Replication

To reproduce the results, please follow the steps below. The analysis scripts are designed to be run sequentially.

### Step 1: Data Preparation

First, you must initialize the data by running the main data preparation script.

* Navigate to the `DataPreparation` folder and execute `1_DataPreparation.Rmd`.

All necessary input data for this script is provided within the `DataPreparation/Tables`, `DataPreparation/Shapes`, and `DataPreparation/Wikidata` subfolders.

> **Note**: It is **not necessary** to re-run the `2_Collect_from_google.R` script. The required travel time and distance data has been pre-fetched and is available in the `DataBackups` folder.

### Step 2: Running the Analysis

The main analysis is split into four R Markdown scripts located in the root directory. They should be executed consecutively. A critical preliminary step involves preparing the data for each professional group using the `1_Analysis_AAB_based.Rmd` script.

I recommend the following order of execution:

1.  **Run `1_Analysis_AAB_based.Rmd` multiple times.** This script must be configured and run for **each of the six professional groups** (including "all professions").
    * Before each run, open `1_Analysis_AAB_based.Rmd` and change the selected profession group in the configuration section (around line 6).
    * You must run this for the **"all professions"** category before proceeding to scripts 2 and 3.
    * To run script 4, you must first execute script 1 for **all five specific profession groups**.

2.  **Run `2_Analysis_Spillover_based.Rmd`.** This script uses the output generated for "all professions."

3.  **Run `3_Anaylsis_Best_combination.Rmd`.** This also uses the output generated for "all professions."

4.  **Run `4_Analysis_Profession_based.Rmd`.** This script requires the outputs from all five specific profession groups generated in step 1.

### Step 3: Locating the Outputs

All outputs that are relevant for the paper (figures, tables, regression summaries) will be saved to the `./Outputs` directory. Intermediate results and protocols can be viewed in the HTML files generated by knitting the R Markdown scripts.

---

## 📜 Citation

If you use this code or the findings from the paper, please cite:

```bibtex
@article{kubitza2025matchmeup,
  title   = {Match Me Up Before I Go-Go!---Estimating Matching Functions for VET Students in Spatially Connected Labor Markets},
  author  = {Kubitza, Dennis Oliver},
  year    = {2025},
  journal = {Journal Title}
}
```
---

---

## 📧 Contact

For any questions regarding the code or the paper, please contact:

* **Dennis Oliver Kubitza** - [d.kubitza@maastrichtuniversity.nl](mailto:d.kubitza@maastrichtuniversity.nl)
