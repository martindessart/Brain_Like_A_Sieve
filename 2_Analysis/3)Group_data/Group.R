## 0) Libraries ----
library(dplyr)
rm(list=ls())
set.seed(666) #Fix kernell

## 1) Open files and add metadata ----
setwd("/Users/martin/Documents/GitHub/Brain_Like_A_Sieve/1_Data/3_Classified")
s1<-read.table("B1_DC.csv", sep="",header=T) %>% mutate(ret=1) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=1) 
s2<-read.table("B2_DC.csv", sep="",header=T) %>% mutate(ret=2) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=2)
s3<-read.table("B3_DC.csv", sep="",header=T) %>% mutate(ret=2) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=3)
s4<-read.table("B4_DC.csv", sep="",header=T) %>% mutate(ret=1) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=4)
s5<-read.table("B5_DC.csv", sep="",header=T) %>% mutate(ret=3) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=5)
s6<-read.table("B6_DC.csv", sep="",header=T) %>% mutate(ret=1) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=6)
s7<-read.table("B7_DC.csv", sep="",header=T) %>% mutate(ret=2) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=7)
s8<-read.table("B8_DC.csv", sep="",header=T) %>% mutate(ret=3) %>% mutate(ct=4) %>% mutate(pck=1) %>% mutate(expe=8)
s9<-read.table("B9_DC.csv", sep="",header=T) %>% mutate(ret=4) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=9)
s10<-read.table("B10_DC.csv", sep="",header=T) %>% mutate(ret=3) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=10)
s11<-read.table("B11_DC.csv", sep="",header=T) %>% mutate(ret=4) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=11)
s12<-read.table("B12_DC.csv", sep="",header=T) %>% mutate(ret=4) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=12)
s13<-read.table("B13_DC.csv", sep="",header=T) %>% mutate(ret=5) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=13)
s14<-read.table("B14_DC.csv", sep="",header=T) %>% mutate(ret=5) %>% mutate(ct=4) %>% mutate(pck=2) %>% mutate(expe=14)
s15<-read.table("B15_DC.csv", sep="",header=T) %>% mutate(ret=5) %>% mutate(ct=4) %>% mutate(pck=3) %>% mutate(expe=15)
s16<-read.table("B16_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=1) %>% mutate(pck=1) %>% mutate(expe=16) 
s17<-read.table("B17_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=2) %>% mutate(pck=1) %>% mutate(expe=17)
s18<-read.table("B18_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=3) %>% mutate(pck=1) %>% mutate(expe=18)
s19<-read.table("B19_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=2) %>% mutate(pck=2) %>% mutate(expe=19)
s20<-read.table("B20_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=3) %>% mutate(pck=3) %>% mutate(expe=20)
s21<-read.table("B21_DC.csv", sep="",header=T) %>% mutate(ret=6) %>% mutate(ct=1) %>% mutate(pck=3) %>% mutate(expe=21)

s17 %>% count(cat)
## 2) Affect individuals per group ----
#4MIN RETENTION ---
X4<-s4 %>% 
  mutate(ID=ID+10)
X6<-s6 %>% 
  mutate(ID=ID+20)
S2<-bind_rows(s1,X4,X6) %>% mutate(iti="2 min")
S2 %>% count(ID)  

#30MIN RETENTION ---
X3<-s3 %>% 
  mutate(ID=ID+10)
X7<-s7 %>% 
  mutate(ID=ID+20)
S5<-bind_rows(s2,X3,X7) %>% mutate(iti="2 min")
S5 %>% count(ID)  

#1H RETENTION ---
X8<-s8 %>% 
 mutate(ID=ID+10)
X10<-s10 %>% 
  mutate(ID=ID+20)
S10<-bind_rows(s5,X8,X10) %>% mutate(iti="2 min")
S10 %>% count(ID)  

#2H RETENTION ---
X11<-s11 %>% 
  mutate(ID=ID+10)
X12<-s12 %>% 
  mutate(ID=ID+20)
S11<-bind_rows(s9,X11,X12) %>% mutate(iti="2 min")
S11 %>% count(ID)  

#3H RETENTION ---
X14<-s14 %>% 
  mutate(ID=ID+10)
X15<-s15 %>% 
  mutate(ID=ID+20)
S12<-bind_rows(s13,X14,X15) %>% mutate(iti="2 min")
S12 %>% count(ID)  

#24H RETENTION ITI 2MIN ----
X19<-s19 %>% 
  mutate(ID=ID+10)
S13<-bind_rows(s17,X19) %>% mutate(iti="2 min")
S13 %>% count(ID)  

#5MIN
X20<-s20 %>% 
  mutate(ID=ID+10)
S14<-bind_rows(s18,X20) %>% mutate(iti="5 min")
S14 %>% count(ID)  

#10MIN
X21<-s21 %>% 
  mutate(ID=ID+10)
S15<-bind_rows(s16,X21) %>% mutate(iti="10 min")
S15 %>% count(ID)  


## Calculate number of diving events ---- 
countDiving<-function(arrive,ID){
  counter<-0 #Number of Top 
  count2<-0 #Number of down
  traj<-0 #Trajectory reminder
  df1 = data.frame()
  df_tot = data.frame()
  
  for (j in 1:ID) { #across table's rows
    sa<-arrive %>% filter(ID==j)
    if (nrow(sa)<1) {
      next
    } 
    else { 
      print(c("ID",j))
      sx<-arrive %>% filter(ID==j)
    }
    for (i in 1:nrow(sx)) { #across table's rows
      #if larvae going up
      if (traj<1) {
        #print("going up")
        
        #if larvae is near the top
        if(sx[i,4]>280){
          counter<-counter+1 #count 1 Top
          traj<-1 #change Trem
          #print("Up")
        }
      }
      
      #if larvae going down
      else { 
        #print("going down")
        #if larvae is near the bottom
        if(sx[i,4]<120){
          count2<-count2+1 #count 1 Down
          traj<-0 #change Trem
          #print("OK")
        }
      }
    }
    sx2<-sx %>% 
      mutate(plong=counter)
    print(c(counter,"Ok"))
    df_tot<-rbind(df_tot,sx2)
    #track<-j
    counter<-0
  }
  return(df_tot)
}
XGA<-countDiving(S2,30)
XGB<-countDiving(S5,30)
XGD<-countDiving(S10,30)
XGE<-countDiving(S11,30)
XGF<-countDiving(S12,30)
XGG<-countDiving(S13,20)
XGH<-countDiving(S14,20)
XGI<-countDiving(S15,20)

Df_Tot<-bind_rows(XGA,XGB,XGD,XGE,XGF,XGG,XGH,XGI)

## Convert pixels in mm ----
# Calculate mean vertical length 

a1<-max(s1$pos_y)-min(s1$pos_y)
a2<-max(s2$pos_y)-min(s2$pos_y)
a3<-max(s3$pos_y)-min(s3$pos_y)
a4<-max(s4$pos_y)-min(s4$pos_y)
a5<-max(s5$pos_y)-min(s5$pos_y)
a6<-max(s6$pos_y)-min(s6$pos_y)
a7<-max(s7$pos_y)-min(s7$pos_y)
a8<-max(s8$pos_y)-min(s8$pos_y)
a9<-max(s9$pos_y)-min(s9$pos_y)
a10<-max(s10$pos_y)-min(s10$pos_y)
a11<-max(s11$pos_y)-min(s11$pos_y)
a12<-max(s12$pos_y)-min(s12$pos_y)
a13<-max(s13$pos_y)-min(s13$pos_y)
a14<-max(s14$pos_y)-min(s14$pos_y)
a15<-max(s15$pos_y)-min(s15$pos_y)
a16<-max(s16$pos_y)-min(s16$pos_y)
a17<-max(s17$pos_y)-min(s17$pos_y)
a18<-max(s18$pos_y)-min(s18$pos_y)
a19<-max(s19$pos_y)-min(s19$pos_y)
a20<-max(s20$pos_y)-min(s20$pos_y)
a21<-max(s21$pos_y)-min(s21$pos_y)
AT<-(a1+a2+a3+a4+a5+a6+a7+a8+a9+a10+a11+a12+a13+a14+a15+a16+
       a17+a18+a19+a20+a21)/21

# Convert pixels in mm : 
# Length cuvette = 45mm
# Pixel number = AT

Df_Tot2<-Df_Tot %>% 
  mutate(dY=dY*45/AT) %>% filter(gp=="Sti")
Df_Tot2 %>% count(ret,ID)

setwd("/Users/martin/Documents/GitHub/Brain_Like_A_Sieve/1_Data/4_Grouped")
write.table(Df_Tot2, "G2.csv", sep=";")


