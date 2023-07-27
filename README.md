### Extract texts from the [International Environmental Agreements (IEA) Database](https://iea.uoregon.edu/)

James M. Thornton, Mountain Research Initiative
25/07/2023

Prerequisites: lynx, perl

Steps:

1. Create a simple text file ("list.txt") containing the IDs of the treaties whose text you want to download. 
2. If necessary, run does2unix over "list.txt" and "extract.sh" to ensure they are in Unix format.
3. Run: sh extract.sh (Use the prefix sudo if necessary). This script first downloads the html files using wget. The "log.txt" reveals which (if any) have failed. The html files are converted to plain text. Finally, the URLs of those that failed are reported in "texts_missing.txt" by using perl to search "log.txt" for "ERROR 404" are writing out the corresponding URL. Files which fail due to a different error ("Unable to establish SSL connection") are written into a second file "texts_missing2.txt".  

Note that it is recommended to rename / move the log file before each run; otherwise the outputs are appended.  
 
