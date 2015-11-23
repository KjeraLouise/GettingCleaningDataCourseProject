# GettingCleaningDataCourseProject

## run_analysis.R

This script combines data on Samsung Smartphone usage for activity tracking on two randomly assigned groups (test and train).

The activity data is from 30 volunteers participating in 6 activities:
walking, walking upstairs, walking downstairs, sitting, standing and laying.

The original test and train data included 17 measurements, in three directions with variables of 17 data summaries for each measurement.


## The main purpose of this script

1) Merges the test and train datasets together.
2) Changes variable names (V1, V2, etc.) to be more descriptive.
3) Relabels the activity code with the activity itself.
4) Makes a subset of the original data to only include the mean and standard deviation data summaries of the original 17 measurements in three directions.
5) Summarizes this all into a smaller dataset that includes each participant’s activity average for each measurement and measurement direction.