# test-repo

The code in run_analysis.R contained in this repo takes the UCI data, tidies it up, and then calculates the mean (by Activity & Subject) for certain variables in the dataset. The code will run as long as the data are contained in a subfolder called "ucidata" from your working directory (IOW, "train" and "test" should be two subfolders in your <current wd>/ucidata/ folder). This is done for organizationl purposes since the data is delivered in .zip format. Theindividual actions performed by each piece of R code are commented in run_analysis.R. 


Codebook:

See http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones for a full explanation of the experiment.

This data that was collected during the experiment was randomly split into 2 groups: training and testing. Therefore the files for each of the two groups have the exact same format but for the number of observations.

The data for the analysis consists of the following:
1) X_train.txt - observations for the training group. The 561 variables consist of various statistical measures (mean, std, variance,
etc.) for different variables that were captured by the gyroscope.
2) Y_train.txt - activity types for the training group
3) subject_train.txt - Subject number (1-30) for the training group

These 3 files correspond to one another (all contain 7,352 observations) and can thus be cbinded together.

4) X_test.txt - observations for the test group. The 561 variables consist of various statistical measures (mean, std, variance,
etc.) for different variables that were captured by the gyroscope.
5) Y_test.txt - activity types for the test group
6) subject_test.txt - Subject number (1-30) for the test group

Again, these 3 files correspond to one another (all contain 2,947 observations) and can thus be cbinded together.

Finally, two additional files are needed:
7) activity_labels.txt - this file is the codebook for the activity codes (1-6) found in the "Y_" files above. It is used to
make the summary output more readable for the user
8) features.txt - this file contains the variable names for the "X_" files and is used to rename the column names in the 
output file.
