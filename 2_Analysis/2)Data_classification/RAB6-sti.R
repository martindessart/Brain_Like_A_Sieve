### Libz ----
library(ggplot2)
library(dplyr)
library(gridExtra)
library(scales)
rm(list=ls())
setwd("/Users/martin/Documents/1_PhD_Local/3_Data/Manip4/Raw")
r2<-read.table("RAB6.csv", sep="",header=T)
r2 %>% count(ID)
r3<-read.table("RAB6T.csv", sep="",header=T)
r3 %>% count(ID)
ratio<-1/25
frame_max<-max(r2$frame) #max frames
sti_nb <- 10 #number
beg_1sti <- 78 #sec 
end_1sti <- 81 #sec
### functions ----
stimuli4 <- function(beg_1sti,end_1sti) {
  s1d<-(beg_1sti)*25
  s1f<-((end_1sti)*25)-1
  dist0 <- vector("numeric", sti_nb)
  dist1 <- vector("numeric", sti_nb)
  step<-1
  counter<-vector("numeric", sti_nb)
  for (i in 1:sti_nb) {
    dist0[i]<-(s1d+(step*25))
    dist1[i]<-(s1f+(step*25))
    step<-step+600.6
    counter[i]<-i
  }
  df <- data.frame(counter,dist0,dist1)
  colnames(df) <- c("Stimulus","frameD","frameF")
  return(df)
  #assign("yo", df, envir=.GlobalEnv)
}
stimuliTest <- function(beg_1sti,end_1sti) {
  s1d<-(beg_1sti)*25
  s1f<-((end_1sti)*25)-1
  dist0 <- vector("numeric", sti_nb)
  dist1 <- vector("numeric", sti_nb)
  step<-1
  counter<-vector("numeric", sti_nb)
  for (i in 1:sti_nb) {
    dist0[i]<-(s1d+(step*25))
    dist1[i]<-(s1f+(step*25))
    step<-step+600.6
    counter[i]<-i
  }
  df <- data.frame(counter,dist0,dist1)
  colnames(df) <- c("Stimulus","frameD","frameF")
  return(df)
  #assign("yo", df, envir=.GlobalEnv)
}
filtron5 <-function(yo,numb) {
  #- from r1 filter frames + 500
  deb<-yo[numb,2]
  fin<-yo[numb,3]
  sti<-r2 %>% 
    filter(frame>deb-500&frame<fin+500)
  ggplot(sti)+
    geom_line(aes(x=frame,y=-pos_y,colour=as.factor(ID)))+
    #geom_smooth(aes(x=frame,y=-posf),method="gam",color="#41A191")+
    theme_light()+
    geom_rect(data=yo,aes(xmin=deb, xmax=fin, 
                          ymin=(-400), ymax=(0)), fill='#0677d704',color=NA)
}
plotsti4<- function(yo) {
  ggplot(NULL)+
    geom_line(data=r2,aes(x=frame,y=-pos_y))+
    geom_rect(data=range,aes(xmin=(range[1,2]+100),xmax=(range[1,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[2,2]+100),xmax=(range[2,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[3,2]+100),xmax=(range[3,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[4,2]+100),xmax=(range[4,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[5,2]+100),xmax=(range[5,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[6,2]+100),xmax=(range[6,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[7,2]+100),xmax=(range[7,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[8,2]+100),xmax=(range[8,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[9,2]+100),xmax=(range[9,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[10,2]+100),xmax=(range[10,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    geom_rect(data=range,aes(xmin=(range[11,2]+100),xmax=(range[11,3]),ymin=-400,ymax=0), fill='#C0000009',color=NA)+
    theme_light()+  
    labs(y="Position Y",x="Frames")+
    facet_wrap(~ID, ncol = 1)
}
datasti4<- function(rg) {
  df_tot = data.frame()
  for (i in 1:sti_nb) {
    nam<-paste("st",i,sep="")
    interval<-
      nam1<-r2 %>% 
      filter(frame>=rg[i,2] & frame< rg[i,3]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="Sti")
    
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
datiti3<- function(rg) {
  df_tot = data.frame()
  for (i in 1:sti_nb) {
    nam1<-r2 %>%
      filter(frame>rg[i,3] & frame<rg[(i+1),2]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="ITI")
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
filtron6 <-function(yo,numb) {
  #- from r1 filter frames + 500
  deb<-yo[numb,2]
  fin<-yo[numb,3]
  sti<-r3 %>% 
    filter(frame>deb-500&frame<fin+500)
  ggplot(sti)+
    geom_line(aes(x=frame,y=-pos_y,colour=as.factor(ID)))+
    #geom_smooth(aes(x=frame,y=-posf),method="gam",color="#41A191")+
    theme_light()+
    geom_rect(data=yo,aes(xmin=deb, xmax=fin, 
                          ymin=(-400), ymax=(0)), fill='#77d704',alpha=0.2)
}
datastiTest<- function(rg) {
  df_tot = data.frame()
  for (i in 1:sti_nb) {
    nam<-paste("st",i,sep="")
    interval<-
      nam1<-r3 %>% 
      filter(frame>=rg[i,2] & frame< rg[i,3]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="Sti")
    
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
datitiTest<- function(rg) {
  df_tot = data.frame()
  for (i in 1:sti_nb) {
    nam1<-r3 %>%
      filter(frame>rg[i,3] & frame<rg[(i+1),2]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="ITI")
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}

### create sti ----
#PREMIER SLOT
range<-stimuli4(beg_1sti,end_1sti)
filtron5(range,1) #input = range + number of stimulus to pl
filtron5(range,5) #input = range + number of stimulus to pl
filtron5(range,10) #input = range + number of stimulus to pl
rsti<-datasti4(range)

# RETENTION
sti_nb <- 1#number
beg_1sti <- 40 #sec 
end_1sti <- 43 #sec
range2<-stimuliTest(beg_1sti,end_1sti)
filtron6(range2,1)
rsti2<-datastiTest(range2) %>% mutate(cat=11)
rsti %>% count(cat)
rsti %>% count(cat,ID)
rsti2 %>% count(cat)
sti_nb <- 10 #number
beg_1sti <- 78 #sec 
end_1sti <- 81 #sec
riti<-datiti3(range)
riti2<-datitiTest(range)
siti<-bind_rows(rsti,riti,rsti2,riti2)
#siti<-bind_rows(rsti,riti)

setwd("/Users/martin/Documents/1_PhD_Local/3_Data/Manip4/Sti")
write.table(siti,"RAB6.csv")

rsti3<-bind_rows(rsti,rsti2)
Vsti<-rsti %>%
  group_by(cat) %>%
  summarise(dY=sum(-dY),
            absdY=sum(absdY))
Vsti$cat<-as.factor(Vsti$cat)
ggplot(Vsti)+
  geom_point(aes(x=cat,y=dY))+
  geom_line(aes(x=cat,y=dY,group=1))+
  theme_light()+
  labs(y="Distance",x="Stimulus")+
  ggtitle("")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.title = element_text(size=22,face = "bold"))+
  theme(axis.text=element_text(size=15),
        axis.title=element_text(size=15))+
  labs(color='Stimulus') 


ggplot(Vsti %>%filter(cat=="1"|cat=="10"|cat=="12"))+
  geom_point(aes(x=cat,y=dY))+
  geom_line(aes(x=cat,y=dY,group=1))+
  theme_light()+
  labs(y="Distance",x="Stimulus")+
  ggtitle("")+
  theme(plot.title = element_text(hjust = 0.5))+
  theme(plot.title = element_text(size=22,face = "bold"))+
  theme(axis.text=element_text(size=15),
        axis.title=element_text(size=15))+
  labs(color='Stimulus') 
  

