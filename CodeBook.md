#Code Book
This code book describes the variables, the data, and any transformations or work that was performed.

#Description
Description about the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). A portion of that page is reproduced here:
  >For each record in the dataset it is provided: 
  >* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
  >* Triaxial Angular velocity from the gyroscope. 
  >* A 561-feature vector with time and frequency domain variables. 
  >* Its activity label. 
  >* An identifier of the subject who carried out the experiment.

#Transformations
The data set was transformed in the following ways:
1. Only mean and standard deviation measurements were extracted for the `test` and `train` data.
2. Both the `test` and `train` data were appropriately labeled.
3. The `test` and `train` data were merged.
4. A tidy dataset with the average of each variable for each activity and each subject was output to a file.
