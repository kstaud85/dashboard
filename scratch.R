deaths<-read.csv('KoreanConflict.csv',header=TRUE,stringsAsFactors = FALSE)
#run, colnames(deaths), deaths$INCIDENT_DATE
#str_detect("19931211","^\\d{8}$") <-8 digits, date, must have \\, 
^ look for that at beinging, $ at the end (8digits)
sum(str_detect(deaths$INCIDENT_DATE,"\\d{8}"))
dim(deaths) #how many rows and columns there are, subtract dim from sum to find number of mistakes

colnames(deaths)
deaths$INCIDENT_DATE
head(deaths)<to view table


#loop: ask if theres a mistake, and if the date is out of place

#[i]looking at i incident in column to see if theres a pattern 

#swaps if meets criteria:
for(i in 1:36574){ 
  incident<-str_detect(deaths$INCIDENT_DATE[i],"\\d{8}")
  fatality<-str_detect(deaths$FATALITY[i],"\\d{8}")
  if(incident==FALSE & fatality==TRUE){
    deaths$INCIDENT_DATE[i]<-deaths$FATALITY[i]
  }
  print(i)
}