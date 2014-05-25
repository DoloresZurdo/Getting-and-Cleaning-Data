Getting-and-Cleaning-Data
=========================

Course Project of Getting and cleaning data for Data Science courses

This file is to describe run_analysis.R for the course project of Getting and cleaning data of Data Science

In this course project we have as inputs different data of 30 subjects.
Each subject collect data with their samsung phone. Each subject is categorized by their correspondent number from 1 to 30.
They are represented in the column named "Subject" (in final file).
Each subject has 6 different states. This state is indicate in "activity_label" (in final file).
  1 - Walking
  2 - Walking_upstairs
  3 - Walking_downstairs
  4 - Sitting
  5 - Standing
  6 - Laying

Data collected by the phone are the acceleration corresponding for axis "x", "y", "z" 
and the angular velocity of the girospcope data of "x", "y", "z" axis.

The subjct were separated randomly in test data and training data.
For this project I have merged both sources of data.

All varibales which read data from a input data are clasify as: "origin_ " -> (for example origin_activity_label).

Once all necessary data are readed, I have merged the data, to obtain only one file.
Columns of this file are named according with the names from source data. I also remove columns which are not interesting
for this study. 
So I only mantain "Subject", "activity_label" "mean_data" and "sdt_data" for angular velocity and acceleration

Once I have the corresponding data, I create the file named "DataSet1" and save its contents.

Afterwards, I create another file "DataSet2". This file have the same sources data as the previous file.
Here all the columns are the mean of the corresponding data for different subcase.
Each subcase has one subject (30 different subject) and 6 posible status (walking...). 
So I have 30 * 6 different subsets.
Then I create "DataSet2", and save its contents.
