#nbp global.R
library(plyr);library(dplyr);library(magrittr);library(ggplot2);library(data.table);library(RColorBrewer)
source("./functions/plotSpeciesMonths.R")
source("./functions/getMonthlySpeciesData.R")

sp.months <- fread("./data/sp.months.csv",data.table=F)
annual.surveys <- fread("./data/annual_surveys.csv",data.table=F)
monthly.effort <- fread("./data/monthly.effort.csv",data.table=F)
# 
# #load and trim data
# df <- fread("./data/NBP Database Export_2014-05-15.csv",stringsAsFactors = T) %>% 
#   data.frame()
# df <- subset(df,!grepl("sp.",as.character(df$Species)))
# df$Species <- factor(df$Species)
# df$Survey.Date <- as.Date(as.character(df$Survey.Date),"%Y-%m-%d")
# df$total <- apply(df[,c("Seen","Heard","Fly")],1,function(e) sum(e))
# df$surveyID <- paste(df$Site,df$Loop,df$Station,df$Survey.Date)
# 
# #summarize effort across years
# annual.surveys <- ddply(df,.(Site,Year),summarize,nsurveys=length(unique(surveyID)))
# 
# #summarize monthly species abundance
# sp.months <- ddply(df,.(Site,Month,Species),summarize,total=sum(total))
# monthly.effort <- ddply(df,.(Site,Month),summarize,nsurveys=length(unique(surveyID)))
# sp.months <- join(sp.months,monthly.effort,by=c("Site","Month"),type="left")
# sp.months$freq <- sp.months$total/sp.months$nsurveys
# 
# #write files for faster loading
# write.csv(annual.surveys,"./data/annual_surveys.csv",row.names = F)
# write.csv(sp.months,"./data/sp.months.csv",row.names = F)
# write.csv(monthly.effort,"monthly.effort.csv",row.names=F)