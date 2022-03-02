# GaCD_Course_project
Pipeline:
1. Download file on the feature (./UCI HAR Dataset/features.txt)
2. get the index of features that are either mean or standard deviation
3. Get the names of the features that are either mean or standard deviation
4. Get rid of the dash and round brackets in the feature name and make them all lower case

5. download the X training data and testing data
6. Extrac the required columns according to the feature index
6. Bind the 2 dataset together
7. name the columns with the feature name above

8. Download the y training and testing data and bind the 2 data set

9. Download the activity labels
10. Replace the numbers in y data into text

11. Merge the x and y datasets

12. Download the subject training and testing data
13. merge the subject data to x and y dataset

14. Group the data by subject and activity and summarize the mean of each column in each group


## Variables
The variables start with "t" is calculated by the body linear acceleration and angular velocity that were derived in time to obtain Jerk signals

The variables start with "b" is calculated by a Fast Fourier Transform (FFT)

mean = mean of the data
std = standard deviation of the data

The data ends with x / y / z mean represent the 3d direction of the data