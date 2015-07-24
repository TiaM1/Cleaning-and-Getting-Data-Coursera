# How the script works
The script does the following things:
  1. Sets the working directory
  2. Loads the plyr package
  3. Reads the necessary data sets (X_test.txt, Y_test.txt, subject_test.txt, X_train.txt, Y_train.txt, subject_train.txt, features.txt, activity_lables.txt)
  4. Binds the rows among the X, Y, and subject test and train data sets to create single X, Y, and subject tables
  5. Identifies columns with means and standard devations only using the features table
  6. Correctly names all columns for the X and Y tables using the features and activity tables, respectively
  7. Binds the columns in the X, Y, and subject tables to make one table
  8. Creates a new tidy data set with the average of each variable for each subject 
