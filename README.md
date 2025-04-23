**LIFE4136 Rotation 1 Group 2**
This Repo contains the scripts used by Group 2 in completion of Rotation1 of the LIFE4136 Group Projects Module. Examples are given for Barcode 6 as this sample was analysed after Barcode 2 (so the names of the scripts are a bit clearer due to knowing a bit more about what we we were doing!). The equivalent (slightly more confusingly) named scripts used for Barcode 2 are found at the end of this README but the relation to Barcode 6 should make it clear what they are doing. 

Note: Please update all directory paths as appropriate to ensure code can run smoothly.

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [Overview & Usage](#overview-usage)
- [Merging Files](#merging-files)
- [QCing Long Read Files](#qcing-long-read-files)
- [Assemblies](#assemblies)
- [Reviewing Assembly Quality](#reviewing-assembly-quality)
- [Annotating the Hybrid Assembly](#annotating-the-hybrid-assembly)
- [Visualising Hybrid Assembly](#visualising-hybrid-assembly)
- [IGV Preperation](#igv-preperation)
- [Equivalent Scripts For Barcode02](#equivalent-scripts-for-barcode02)
- [Contributors](#contributors)
- [References](#references)

<!-- TOC end --> 

<!-- TOC --><a name="overview-usage"></a>
## Overview & Usage

The aim of this project was to identify genetic modifications made by a group of scientists to the genome of an unknown microorganism. The following code represents the order in which steps were followed to achieve this. Please note that packages are required for most steps. I recomend using seperate Conda environments to use these packages, details of how to create and install each are described below. A single Conda environment with all tools may well work, however, I can not be sure as we did not do this and it's possible conflicts may arise through having multiple packages in the same Conda environment.

<!-- TOC --><a name="merging-files"></a>
## Merging Files

Data was provided in the form of Illumina Short Reads (Forward - R1 and Reverse - R2) and Fastq Long Read data (Pass and Fail). Data was merged to make downstream data processing easier using the scripts listed below:

|Data Merged|Script Used|Notes|
|---|---|---|
|Long Read Pass|[pass06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/pass06_slurm.sh)|
|Long Read Fail|[fail06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/fail06_slurm.sh)|
|Long Read All|[all06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/all06_slurm.sh)|*Long Read Pass* and *Long Read Fail* merge scripts must be executed prior to executing the *Long Read All* script. Ensure the files produced from the first 2 scripts are located in whichever directory is specified in the *Long Read All* script (or change cd command to use full file pathway).
|Short Read Forward|[short06_forward_merged.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/short06_forward_merged.sh)|
|Short Read Reverse|[short06_reverse_merged.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/short06_reverse_merged.sh)|


<!-- TOC --><a name="qcing-long-read-files"></a>
## QCing Long Read Files
Short Read Data already had QC reports available and all samples were deemed suitable for analysis. For Long Read data, NanoPlot was used for QC checking read quality. Install into a Conda environment using:

```bash
conda create -n NanoPlot
conda activate NanoPlot
conda install bioconda::nanoplot
```

Long Read Data was QC checked using the scripts listed below: 

|Data QC Checked|Script Used|Notes|
|---|---|---|
|Pass|[pass06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/pass06qc_slurm.sh)|Only Pass Data was used further in Data Processing|
|Fail|[fail06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/fail06qc_slurm.sh)|
|All|[all06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/all06qc_slurm.sh)|

<!-- TOC --><a name="assemblies"></a>
## Assemblies
The Short Read and Long Read data was assembled, with the resulting assemblies used to build a Hybrid assembly. Assemblies were performed using the Unicylcer package. Install into a Conda environment using:

```bash
conda create -n Unicycler
conda activate Unicycler
conda install bioconda::unicycler
```

Long Read, Short Read and Hybrid data was assembled using the scripts below: 

|Data Assembled|Script Used|Notes
|---|---|---|
|Long Read|[long06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/long06_assembly.sh)|   |
|Short Read|[short06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/short06_assembly.sh)|   |
|Hybrid|[hybrid06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/hybrid06_assembly.sh)|The Hybrid Assembly was used going forward in Data Processing|

<!-- TOC --><a name="reviewing-assembly-quality"></a>
## Reviewing Assembly Quality
All Assemblies were reviewed for quality against a reference genome. The [reference genome](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Ref_Genomes/refcombined1.fasta) was formed of 4 samples taken from BLAST after running DNA searches taken from the assembled genome. Review of the assembly was performed using the Quast package. Install into a Conda environment using:

```bash
conda create -n Quast
conda activate Quast
conda install bioconda::quast
```

Script used: [quast06_2.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Quast_Scripts/quast06_2.sh)

<!-- TOC --><a name="annotating-the-hybrid-assembly"></a>
## Annotating the Hybrid Assembly

The Hybrid Asembly was annotated using the Prokka package. The Reference Genome was also annotated for use during IGV analysis (mentioned in IGV Preperation). Install into a Conda environment using:

```bash
conda create -n Prokka
conda activate Prokka
conda install bioconda::prokka
```

Genomes were annotated using the scripts below:

|Data Annotated|Script Used|
|---|---|
|Hybrid Assembly|[prokka06_hybrid1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Prokka_Scripts/prokka06_hybrid1.sh)|
|Reference Genome|[ref1_prokka.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Ref_Genomes/Ref_Prokka/ref1_prokka.sh)|


<!-- TOC --><a name="visualising-hybrid-assembly"></a>
## Visualising Hybrid Assembly
It was deemed from the Quast Report that there were 3 distinct genetic assemblies present in the Hybrid Assembly. This was visualised using the Genovi package. Install into a Conda environment using:

```bash
conda create -n Genovi
conda activate Genovi
conda install bioconda::genovi
```

Script Used: [genovi06_1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Genovi_Scripts/genovi06_1.sh)

<!-- TOC --><a name="igv-preperation"></a>
## IGV Preperation
The Long and Short Read assemblies and subsequent alignement was visualised using IGV, available to download [here](https://igv.org/doc/desktop/#DownloadPage/). This software requires sorted .BAM files alongside respective index files. The files were visualised against the reference genome and respective index and .gff files created using the [ref1_prokka.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Ref_Genomes/Ref_Prokka/ref1_prokka.sh) script. 

Short Read Preperation used bwa and samtools packages. Long Read Preperation used minimap2 and samtools. Install each into a sepearate Conda environment using:

```bash
conda create -n BWA
conda activate BWA
conda install bioconda::bwa
```

```bash
conda create -n Minimap2
conda activate Minimap2
conda install bioconda::minimap2
```

```bash
conda create -n Samtools
conda activate Samtools
conda install bioconda::samtools
```

Short Read data was prepared for viewing in IGV using the scripts below:

|Stage|Package Used|Script Used   |
|---|---|---|
|Creating .SAM file|bwa|[short06sam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06sam.sh)|
|Creating .BAM file|samtools|[short06bam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bam.sh)|
|Creating Sorted .BAM file|samtools|[short06bamsorted.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bamsorted.sh)|
|Creating Sorted .BAM.bai file|samtools|[short06bamsortedindex.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bamsortedindex.sh)|

Long Read data was prepared for viewing in IGV using the scripts below:

|Stage|Package Used|Script Used|
|---|---|---|
|Creating .SAM file|minimap2|[minimap2_06sam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06sam.sh)|
|Creating .BAM file|samtools|[minimap2_06bam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bam.sh)|
|Creating Sorted .BAM file|samtools|[minimap2_06bamsorted.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bamsorted.sh)|
|Creating Sorted .BAM.bai file|samtools|[minimap2_06bamsortedindex.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bamsortedindex.sh)|

<!-- TOC --><a name="equivalent-scripts-for-barcode02"></a>
## Equivalent Scripts For Barcode02

|Stage|Barcode06 Script|Barcode02 Script|
|---|---|---|
|Merging Files|[pass06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/pass06_slurm.sh)|[pass_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Merge_Scripts/pass_slurm.sh)|
|Merging Files|[fail06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/fail06_slurm.sh)|[slurm_fail.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Merge_Scripts/slurm_fail.sh)|
|Merging Files|[all06_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/all06_slurm.sh)|[all_slurm_jy.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Merge_Scripts/all_slurm_jy.sh)|
|Merging Files|[short06_forward_merged.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/short06_forward_merged.sh)|[short_forward_merge.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Merge_Scripts/short_forward_merge.sh)|
|Merging Files|[short06_reverse_merged.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Merge_Scripts/short06_reverse_merged.sh)|[short_reverse_merge.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Merge_Scripts/short_reverse_merge.sh)|
|QCing Long Read Files|[pass06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/pass06qc_slurm.sh)|[passqc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Long_Read_QC_Scripts/passqc_slurm.sh)|
|QCing Long Read Files|[fail06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/fail06qc_slurm.sh)|[failqc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Long_Read_QC_Scripts/failqc_slurm.sh)|
|QCing Long Read Files|[all06qc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Long_Read_QC_Scripts/all06qc_slurm.sh)|[allqc_slurm.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Long_Read_QC_Scripts/allqc_slurm.sh)|
|Assemblies|[long06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/long06_assembly.sh)|[long_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Assembly_Scripts/long_assembly.sh)|
|Assemblies|[short06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/short06_assembly.sh)|[short_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Assembly_Scripts/short_assembly.sh)|
|Assemblies|[hybrid06_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Assembly_Scripts/hybrid06_assembly.sh)|[hybrid_assembly.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Assembly_Scripts/hybrid_assembly.sh)|
|Reviewing Assembly Quality|[quast06_2.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Quast_Scripts/quast06_2.sh)|[quast_7.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Quast_Scripts/quast_7.sh)|
|Annotating the Hybrid Assembly|[prokka06_hybrid1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Prokka_Scripts/prokka06_hybrid1.sh)|[prokka_hybrid1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Prokka_Scripts/prokka_hybrid1.sh)|
|Visualising Hybrid Assembly|[genovi06_1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/Genovi_Scripts/genovi06_1.sh)|[genovi02_2.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/Genovi_Scripts/genovi02_2.sh)|
|IGV Preperation|[short06sam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06sam.sh)|[bwa_bar02_4.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Shortread/bwa_bar02_4.sh)|
|IGV Preperation|[short06bam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bam.sh)|[shortread02_bam_2.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Shortread/shortread02_bam_2.sh)|
|IGV Preperation|[short06bamsorted.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bamsorted.sh)|[shortread02_sortedbam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Shortread/shortread02_sortedbam.sh)|
|IGV Preperation|[short06bamsortedindex.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Shortread/short06bamsortedindex.sh)|[shortread02_indexsortedbam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Shortread/shortread02_indexsortedbam.sh)|
|IGV Preperation|[minimap2_06sam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06sam.sh)|[minimap2.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Longread/minimap2.sh)|
|IGV Preperation|[minimap2_06bam.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bam.sh)|[minimap2bam1.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Longread/minimap2bam1.sh)|
|IGV Preperation|[minimap2_06bamsorted.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bamsorted.sh)|[minimap2bam1sorted.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Longread/minimap2bam1sorted.sh)|
|IGV Preperation|[minimap2_06bamsortedindex.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar06/IGV_Preparation_Scripts/Longread/minimap2_06bamsortedindex.sh)|[minimap2bam1sortedindex.sh](https://github.com/mbxjy4/LIFE4136-Rot1-Gp2/blob/main/Bar02/IGV_Preparation_Scripts/Longread/minimap2bam1sortedindex.sh)|

<!-- TOC --><a name="contributors"></a>
## Contributors
All scripts and analysis were completed jointly with Areeba Salman and Shixuan Liu, with additional contributions from Matt Loose and Laura Dean. Thanks all for your efforts, support and insight!

<!-- TOC --><a name="references"></a>
## References

**BWA**

Li, H., & Durbin, R. (2009). Fast and accurate short read alignment with Burrows–Wheeler transform. Bioinformatics, 25(14), 1754–1760.
https://doi.org/10.1093/bioinformatics/btp324

**Genovi**

Laing, C., Buchanan, C., Taboada, E.N., Zhang, Y., Kropinski, A., Villegas, A., & Thomas, J.E. (2021). GENOVI: Rapid quality-controlled prokaryotic genome assembly and annotation pipeline. Microbial Genomics, 7(10).
https://doi.org/10.1099/mgen.0.000640

**IGV**

Robinson, J.T., Thorvaldsdóttir, H., Winckler, W., Guttman, M., Lander, E.S., Getz, G., & Mesirov, J.P. (2011). Integrative Genomics Viewer. Nature Biotechnology, 29(1), 24–26. 
https://doi.org/10.1038/nbt.1754

**Minimap2**

Li, H. (2018). Minimap2: pairwise alignment for nucleotide sequences. Bioinformatics, 34(18), 3094–3100.
https://doi.org/10.1093/bioinformatics/bty191

**Nanoplot**

De Coster, W., D’Hert, S., Schultz, D.T., Cruts, M., & Van Broeckhoven, C. (2018). NanoPack: visualizing and processing long-read sequencing data. Bioinformatics, 34(15), 2666–2669.
https://doi.org/10.1093/bioinformatics/bty149

**Prokka**

Seemann, T. (2014). Prokka: rapid prokaryotic genome annotation. Bioinformatics, 30(14), 2068–2069.
https://doi.org/10.1093/bioinformatics/btu153

**Quast**

Gurevich, A., Saveliev, V., Vyahhi, N., & Tesler, G. (2013). QUAST: quality assessment tool for genome assemblies. Bioinformatics, 29(8), 1072–1075.
https://doi.org/10.1093/bioinformatics/btt086

**Samtools**

Li, H., Handsaker, B., Wysoker, A., et al. (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25(16), 2078–2079.
https://doi.org/10.1093/bioinformatics/btp352

**Unicycler**

Wick, R.R., Judd, L.M., Gorrie, C.L., & Holt, K.E. (2017). Unicycler: Resolving bacterial genome assemblies from short and long sequencing reads. PLOS Computational Biology, 13(6), e1005595.
https://doi.org/10.1371/journal.pcbi.1005595

