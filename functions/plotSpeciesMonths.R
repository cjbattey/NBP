
plotSpeciesMonths <- function(plot.data,colors=sample(c("forestgreen","cornflowerblue","gold","orangered","violet"))) {
  ggplot(plot.data,aes(x=Month,y=freq,col=Species,fill=Species))+
    ylab("Detections/Survey")+
    scale_color_manual(values=colors)+
    scale_fill_manual(values=colors)+
    facet_wrap(~Site,scales=c("free"))+
    scale_x_continuous(breaks=seq(1,12,2),limits=c(1,12))+
    geom_point()+geom_smooth(alpha=0.15)
} 
