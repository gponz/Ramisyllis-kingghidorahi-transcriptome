##################### Differentially_expressed_transcripts_in_annotation_results_file.R#####################

#This script uses a list of diferentially expressed transcripts to extract their annotation from a Trinotate annotation report and creates a new tab delimited text file containing the annotation results of only those transcripts with differential expression.
#The inputted list of differentially expressed transcripts must consist of a tab delimited file with only one column with a line for the ID of each transcript.
#Trinotate creates its output file in .xlsx format. Before running this script save it as a tab delimited file in .txt format.
#Details about Trinotate can be found at https://github.com/Trinotate/Trinotate.github.io/wiki


#Set your working directory to the folder where your input files are located with setwd()
setwd("change/to/path/to/your/working/directory")

#Read your input list of differentially expressed transcripts.
diff <- read.table("List_of_differentially_expressed_transcripts.txt", header = FALSE)

#Read your input Trinotate annotation report.
annot <- read.table("Trinotate_annotation_report.txt", quote = "", sep = "\t", fill = TRUE, header = TRUE)

#Create a new annotation report with the differentially expressed transcripts only.
diffannot <- annot[annot$transcript_id %in% diff$V1,]

#Write the new annotation report in a tab delimited .txt file.This file can latter be saved as a .xlsx if needed.
write.table(diffannot, "annotation_of_differentially_expressed_transcripts.txt", sep="\t")