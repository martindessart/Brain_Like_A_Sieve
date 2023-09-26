## 0) Libraries ----
library(lme4)
library(ggplot2)
library(dplyr)
rm(list=ls())
## 1) Open file ----
setwd("/Users/martin/Documents/GitHub/Brain_Like_A_Sieve/1_Data/2_Verified")
filename="B18"
trial_nb <- 10 #number of trials -> 10 trials during training
r2<-read.table(file=paste(filename,"_B.csv",sep=""), sep="",header=T)
r2 %>% count(ID)
#Open memory phase
r3<-read.table(file=paste(filename,"_T_BT.csv",sep=""), sep="",header=T)
r3 %>% count(ID)
frame_max<-max(r2$frame) #max frames
## 2) Find stimulation response ranges ----
#By looking at the video, enter the second from which the first trial is applied
beg_1trial <- 49 #sec 
end_1trial <- beg_1trial+3 #sec 
adjust <- 30 #frames to adjust precisely the location of the 1st trial
Find_stimuli_ranges <- function(beg_1trial,end_1trial) {
  s1d<-(beg_1trial)*25 #Convert in frames
  s1f<-((end_1trial)*25)-1 #Convert in frames
  dist0 <- vector("numeric", trial_nb)
  dist1 <- vector("numeric", trial_nb)
  step<-1
  counter<-vector("numeric", trial_nb)
  for (i in 1:trial_nb) { #For each trial, calculate the frame number associated
    dist0[i]<-(s1d+(step*25)-adjust)
    dist1[i]<-(s1f+(step*25)-adjust)
    step<-step+300.3
    counter[i]<-i
  }
  df <- data.frame(counter,dist0,dist1) #extract ranges 
  colnames(df) <- c("Trial","frameD","frameF")
  return(df)
}
Sti_range<-Find_stimuli_ranges(beg_1trial,end_1trial)

## 3) Display training responses ----
Display_response <-function(ranges,nb_Sti) {
  deb<-ranges[nb_Sti,2] #Find good ranges from the df
  fin<-ranges[nb_Sti,3] #Find good ranges from the df
  sti<-r2 %>% 
    filter(frame>deb-500&frame<fin+500) #Extract data
  ggplot(sti)+ #Display data
    geom_line(aes(x=frame,y=-pos_y,colour=as.factor(ID)))+
    #geom_smooth(aes(x=frame,y=-posf),method="gam",color="#41A191")+
    theme_light()+
    geom_rect(data=ranges,aes(xmin=deb, xmax=fin, 
                          ymin=(-400), ymax=(0)), fill='#0677d704',color=NA)
}
#Manually adjust TRIAL 1:
Sti_range<-Sti_range %>% 
  filter(Trial!=1) %>% 
  add_row(Trial=1,frameD=1245,frameF=frameD+74) %>% 
  arrange(Trial)
Display_response(Sti_range,1) # input = Df + trial number to plot
Display_response(Sti_range,5) # Half way
Display_response(Sti_range,10) # last trial of training

## 4) Classify data training ----
Sti_Data<- function(rg) {
  df_tot = data.frame()
  for (i in 1:trial_nb) {
    nam<-paste("st",i,sep="")
    interval<-
      nam1<-r2 %>% 
      filter(frame>=rg[i,2] & frame< rg[i,3]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="Sti") #Add variable that separate Sti and Iti
    
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
Df_Sti<-Sti_Data(Sti_range)



Interval_Data<- function(rg) {
  df_tot = data.frame()
  for (i in 1:(trial_nb-3)) {
    nam1<-r2 %>%
      filter(frame>rg[i,3] & frame<rg[(i+1),2]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="ITI")
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
Df_Iti<-Interval_Data(Sti_range)

## 5) Display responses at test phase ----
trial_nb <- 1 # 1 because 1 trial for test phase
beg_1sti <- 1532 #sec 
end_1sti <- beg_1sti+3 #sec
adjust <- 25 #frames to adjust precisely the location of the 1st trial
Sti_range2<-Find_stimuli_ranges(beg_1sti,end_1sti)
Display_response_TEST <-function(ranges,nb_Sti) {
  deb<-ranges[nb_Sti,2] #Find good ranges from the df
  fin<-ranges[nb_Sti,3] #Find good ranges from the df
  sti<-r3 %>% 
    filter(frame>deb-500&frame<fin+500) #Extract data
  ggplot(sti)+ #Display data
    geom_line(aes(x=frame,y=-pos_y,colour=as.factor(ID)))+
    #geom_smooth(aes(x=frame,y=-posf),method="gam",color="#41A191")+
    theme_light()+
    geom_rect(data=ranges,aes(xmin=deb, xmax=fin, 
                              ymin=(-400), ymax=(0)), fill='#77d709',alpha=0.2)
}
Display_response_TEST(Sti_range2,1)

## 6) Classify data FOR TEST ----
Sti_Data_TEST<- function(rg) {
  df_tot = data.frame()
  for (i in 1:trial_nb) {
    nam<-paste("st",i,sep="")
    interval<-
      nam1<-r3 %>% 
      filter(frame>=rg[i,2] & frame< rg[i,3]) %>% 
      mutate(cat=i) %>% 
      mutate(gp="Sti") #Add variable that separate Sti and Iti
    
    df_tot<-rbind(df_tot,nam1)
  }
  return(df_tot)
}
Df_Sti_TEST<-Sti_Data_TEST(Sti_range2)%>% mutate(cat=11)



### Check and combine ----
Df_Sti %>% count(cat)
Df_Sti_TEST %>% count(cat)
Df_Iti %>% count(cat)
Df_Tot<-bind_rows(Df_Sti,Df_Sti_TEST,Df_Iti)

setwd("/Users/martin/Documents/GitHub/Brain_Like_A_Sieve/1_Data/3_Classified")
write.table(Df_Tot, file=paste(filename, "_DC.csv", sep=""))
