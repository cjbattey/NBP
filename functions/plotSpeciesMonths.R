
plotSpeciesMonths_smooth <- function(plot.data,colors=sample(brewer.pal(9,"Set1"))) {
  ggplot(plot.data,aes(x=Month,y=freq,col=Species,fill=Species))+
    ylab("Detections/Survey")+
    scale_color_manual(values=colors)+
    scale_fill_manual(values=colors)+
    facet_wrap(~Site,scales=c("free"))+
    scale_x_continuous(breaks=seq(1,12,2),limits=c(1,12))+
    coord_cartesian(ylim=c(0,c(0,max(plot.data$freq)+sd(plot.data$freq))))+
    geom_point()+geom_smooth(alpha=0.15)
} 

plotSpeciesMonths_line <- function(plot.data,colors=sample(brewer.pal(9,"Set1"))) {
  ggplot(plot.data,aes(x=Month,y=freq,col=Species,fill=Species))+
    ylab("Detections/Survey")+
    scale_color_manual(values=colors)+
    scale_fill_manual(values=colors)+
    facet_wrap(~Site,scales=c("free"))+
    scale_x_continuous(breaks=seq(1,12,2),limits=c(1,12))+
    coord_cartesian(ylim=c(0,c(0,max(plot.data$freq)+sd(plot.data$freq))))+
    geom_point()+geom_line()
} 