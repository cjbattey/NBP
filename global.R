#nbp global.R
library(plyr);library(dplyr);library(magrittr);library(ggplot2);library(data.table)
source("./functions/plotSpeciesMonths.R")
source("./functions/getMonthlySpeciesData.R")

#load and trim data
df <- fread("./data/NBP Database Export_2014-05-15.csv",stringsAsFactors = T) %>% 
  data.frame()
df <- subset(df,!grepl("sp.",as.character(df$Species)))
df$Species <- factor(df$Species)
df$Survey.Date <- as.Date(as.character(df$Survey.Date),"%Y-%m-%d")
df$total <- apply(df[,c("Seen","Heard","Fly","Nest")],1,function(e) sum(e))
df$surveyID <- paste(df$Site,df$Loop,df$Station,df$Survey.Date)

#summarize effort across years
annual.surveys <- ddply(df,.(Site,Year),summarize,nsurveys=length(unique(surveyID)))

#summarize monthly species abundance
sp.months <- ddply(df,.(Site,Month,Species),summarize,total=sum(total))
monthly.effort <- ddply(df,.(Site,Month),summarize,nsurveys=length(unique(surveyID)))
sp.months <- join(sp.months,monthly.effort,by=c("Site","Month"),type="left")
sp.months$freq <- sp.months$total/sp.months$nsurveys
