Peer Assignment ReadMe File
========================================================

The script to combine, clean and tidy the data can be downloaded as run_analysis.R.  There are a few requirements in order for this to work properly:

* Download the desired data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the contents.
* Start an R session
* Set your working directory to the directory where you unzipped the contents (where the .zip file resides)
* Save run_analysis.R into this directory
* Source run_analysis.R

The result will be the generation of the tidyData.txt file with the desired results.

Assumptions:

* The X_test.txt and X_train.txt data files were used, not the data located in the Inertial Signals directories.
* The desire to only have mean and standard deviation measurements mean any variables that contain the text "mean" or "std"

Contact Mark Morscher at markmorscher@gmail.com if you have any questions.