Peer Assignment Code Book
========================================================

This file will explain the methods used to create the final tidyData.txt file using run_analysis.R.

### Combining and Restricting Data

The data located in the X_test.txt and X_train.txt files in their associated directories were used to create the combined data set.  The column headings for this combined set was obtained from features.txt

These three files were loaded into their own data frames utilizing read.table and the column names obtained from features.txt, then combined by utilizing rbind (append the train and test data).

In order to restrict the data to only means and standard deviations, I utilized grep to create a list of column names that included only the phrase "mean" or "std", then subset the data frame by only these columns.

### Adding Subject ID and Activity Labels

The next step was to augment the data frame observations with the Subject and Activity ids for each observation.  The Subject Ids were obtained from the subject_test.txt and subject_train.txt files in the associated directories, and combined with rbind.

Activity labels required two steps.  First, obtain the activity ids for each observation from the y_test.txt and y_train.txt files in the associated directories, combining with rbind.  Next, the mapping of id to label was loaded from activity_labels.txt, and then the two data sets were merged to create a label for each observation. The Activity labels and SubjectIDs were then added to the data frame with cbind.

At this point, the criteria established in directions #1-4 have been met.  Along the way, I removed various helper data frames to assist in freeing up memory.

### Generating Tidy Data

In order to perform the required task, the melt function from rshape2 library was utilized to collate the observations based on Activity and SubjectID.  Once done, dcast was utilized to expand the means of each numeric column based on the unique Activity and SubjectID combinations.  The resulting data table was written to tidyData.txt in the working directory as instructed.

