deaths<-read.csv('KoreanConflict.csv',header=TRUE,stringsAsFactors = FALSE)

sum(str_detect(deaths$INCIDENT_DATE,"\\d{8}"))

for(i in 1:36574){ 
  incident<-str_detect(deaths$INCIDENT_DATE[i],"\\d{8}")
  fatality<-str_detect(deaths$FATALITY[i],"\\d{8}")
  if(incident==FALSE & fatality==TRUE){
    deaths$INCIDENT_DATE[i]<-deaths$FATALITY[i]
  }
  print(i)
}

#group by incident day, and number of deaths on that day is n
# filter: find a pattern when you get to a cell, and if you find it keep it
#mutate makes new column
df<-deaths%>%
  filter(str_detect(deaths$INCIDENT_DATE,"\\d{8}")==TRUE)%>%
  group_by(INCIDENT_DATE)%>%
  summarize(num_deaths=n())%>%
  mutate(date=ymd(INCIDENT_DATE))%>%
  filter(date<="1957-07-27")%>%
  select(INCIDENT_DATE,num_deaths,date)


#use head(df) to vuew data frame table

ggplot()+
  geom_line(data=df,aes(x=date,y=num_deaths))


#produce graph that shows years born for killed soldier in korean war