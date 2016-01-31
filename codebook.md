# This is the codebook for the run_analysis.R script.
##First we load the data via train/test files
## Next like files are grouped (x vs y vs subject)
## We then extract the needed information, in this case, mean and standard deviation of the accelerometer (velocity) data
## We then add in labels for activities performed and subject and group into a large final dataset (alldata)
## Lastely, we extract the information we want, get the mean of those data and extract them to a new data set called averages_data.txt via the write.table command