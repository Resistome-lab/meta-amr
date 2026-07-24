# meta-amr

> An automated CLI pipeline for downloading SRA metagenomic datasets, performing host-filtering/reference alignments, and quantifying AMR gene abundances using CARD and DIAMOND.

---

## One-Line Installation

Install `meta-amr` globally on any Linux machine or WSL instance:

```bash
curl -fsSL https://raw.githubusercontent.com/Resistome-lab/meta-amr/main/install.sh | bash
```

---

## Prerequisites & Dependencies

`meta-amr` relies on standard bioinformatics toolkits. Ensure the following tools are available in your system `$PATH`:

| Tool | Purpose |
| :--- | :--- |
| **SRA Toolkit** (`prefetch`, `fastq-dump`) | SRA dataset retrieval |
| **BBMap** (`reformat.sh`) | Fast read interleaving |
| **Bowtie2** (`bowtie2`) | Host/Reference alignment |
| **Samtools** (`samtools`) | SAM/BAM manipulation and sorting |
| **Bedtools** (`bedtools`) | Converting filtered BAM back to FASTQ |
| **DIAMOND** (`diamond`) | Fast translated protein alignment against CARD |

---

## Usage & Options

Run `meta-amr` from **any directory** on your machine:

```bash
 meta-amr -s SRR39779725 -d ~/CARD_indexed.dmnd -t 8
```
"SRR39779725" was picked as a real SRA for validation.

### CLI Options

```text
  -s  SRA accession number (Required, e.g., SRR39779725)
  -d  Path to DIAMOND CARD database (Default: ~/CARD)
  -t  Number of CPU threads (Default: 8)
  -o  Output directory path (Default: meta_amr_output)
  -h  Display help message
```

---

## Outputs

The pipeline creates a target folder containing:
* `awk_diamond_<SRR_ID>.tsv` - Complete alignment tabular output annotated with ARO gene counts.
* `unique_gene_sums.txt` - Summary list of unique resistance genes and their absolute hit counts.
* `gene_counts.txt` - Aggregated total resistance hits in the sample.
