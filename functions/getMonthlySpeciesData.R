getMonthlySpeciesData <- function(species="Rufous Hummingbird",
                                  parks=c("Discovery Park","Magnuson","Genesee","Golden Gardens","Lake Forest Park","Seward Park")){
  
  #extract species and parks
  sub <- subset(sp.months,Species %in% species
                & Site %in% parks)
  
  #this whole chunk just puts in rows for months with no species reports
  temp <- sub[0,]
  plot.data <- sub[0,]
  for(j in levels(factor(sub$Site))){ #loop over sites
    site <- subset(sub,Site==j)
    
    for(k in levels(factor(site$Species))){ #loop over species
      site.sp <- subset(site,Species==k)
      if(nrow(site.sp) >=1){
        na.months <- seq(1,12,1)[seq(1,12,1) %in% site.sp$Month==F]
        
        if(length(na.months)>=1){ #continue if empty months
          na.months.nsurveys <- subset(monthly.effort,Site==site.sp$Site[1] & Month %in% na.months) #get na month survey numbers
          for(i in 1:length(na.months)){                                                            #add rows for na months
            row <- data.frame(site.sp$Site[1],na.months[i],site.sp$Species[1],0,na.months.nsurveys[i,"nsurveys"],0)
            names(row) <- names(site.sp)
            site.sp <- rbind(site.sp,row)
          }
        }
        temp <- rbind(temp,site.sp)
      }
    }
    plot.data <- rbind(plot.data,temp)
    temp <- sub[0,]
  }
  return(plot.data)
}