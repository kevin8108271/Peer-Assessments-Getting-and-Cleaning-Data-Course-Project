# Peer-Assessments-Getting-and-Cleaning-Data-Course-Project
#ReadMe
##purpose
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.


The goal is to prepare tidy data that can be used for later analysis.


You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit:


1.a tidy data set as described below


2.a link to a Github repository with your script for performing the analysis


3.a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

##objectives
in the  run_analysis.R,performs
1.Merges the training and the test sets to create one data set.  
2.Extracts only the measurements on the mean and standard deviation for each measurement.   
3.Uses descriptive activity names to name the activities in the data set  
4.Appropriately labels the data set with descriptive variable names.   
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##steps
1.first,we check wether the file under the dir,if not download and unzip it.    
2.Second,we read the X_train, y_train,X_test,y_test,subject_train,subject_test by rea.table seperately;then we use the rbind function to bind the test and train data  
3.Third,we use the grep() to catch the variable associate with mean and std,then use it to be the index of x to find the x that with mean and sd ,then we clean it to be the names of x
4.Fourth,we read the activities labels,and clean it ,then bind it with x  
5.Last,we use the aggregate to calculate the mean of the data by activity and subject
