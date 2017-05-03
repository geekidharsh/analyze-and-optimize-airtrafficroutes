# run this script at the file location of data files
import time
import os
import sys
import pandas as pd

'''
looks for files and merges them together in a single dataframe
'''

def main(location):
	start_time = time.time()
	counter = 0 # keep a track of total files found
	files = [] #store the files found at the location
	frames = pd.DataFrame()
	print "Looking for files here:\t", location	

	for file in os.listdir(location):
		try:
			if file.endswith(".csv"):
				files.append(str(file))
				print "files found", file
				thisDF = pd.read_csv(file)
				frames = frames.append(thisDF, ignore_index= True) # thisDF.to_sql(flight_data_table, 3306, schema=test, index=True)

				counter = counter+1
		except Exception as e:
			raise e
			print "No .csv files here. Make sure you have files at the location"

	file_loc = location+"/"+"Output"
	if (os.path.exists(file_loc)): 
		print "Desitnation Location exists. New file will be created in the location"
	else: 
		os.mkdir(file_loc)
	file_name = file_loc+"/"+"merged-file"+str(start_time)+".csv"
	filecount = 0
  	frames.to_csv(file_name, encoding="utf-8", index=False)
  	filecount = filecount+1
  	print "\n"+str(filecount)+" new files page-query files generated at the location."
  	print "Total files found & merged", counter


if __name__ == '__main__':
	main(os.getcwd())