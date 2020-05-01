Project for Getting and Cleaning Data (Coursera)
Chris Thoburn 05-01-20
README.md

Purpose:
*********************************************************************
This is a project the demonstartes the ability to collect, work with, and clean a data set.  It is a programming assignment for the Getting and Cleaning Data course (Coursrea).


Files provided:
*********************************************************************
README.md               Explains the purpose and function
CodeBook.md             Explains the variables, data, transformations
run_analysis.R          Collects and transforms source data to output


Files generated:
*********************************************************************
Data_subject_activity   Average measurements (by subject, activity) 


run_analysis.R 
*********************************************************************
Executing this script download the data from a fixed source for the assignment, perform the required transformations and generate the required output file.  This script takes no parameters.


Intermediate files
*********************************************************************
This script will create a ./data directory to use for intermediate files if it does not already exist.  These files will remain after the script is executed.  