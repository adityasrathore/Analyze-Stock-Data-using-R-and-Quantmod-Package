install.packages("tidyverse")
install.packages("TTR")
install.packages("quantmod")
install.packages("PerformanceAnalytics")
install.packages("RColorBrewer")
install.packages("tseries")
install.packages("lubridate")
install.packages("Quandl")



MSFT<-getSymbols("MSFT",auto.assign=FALSE)
head(MSFT)
tail(MSFT)
dim(MSFT)
str(MSFT)

new<-MSFT[1:30,1:3]
MSFT["2007-01-03","MSFT.Open"]

df <- as.data.frame(MSFT)
class(df)

tsla <-getSymbols("TSLA",auto.assign=FALSE)
head(tsla,20)

head(dailyReturn(tsla$TSLA.Adjusted),20)
tsla_ad <- Ad(tsla)
tsla_daily <- dailyReturn(tsla_ad)
plot(dailyReturn(tsla$TSLA.Adjusted),type='l')

MSFT_AD<-Ad(MSFT)
MSFT_daily<-dailyReturn(MSFT_AD)
head(MSFT_daily)

fb<-getSymbols("FB", auto.assign=F)
fb_ad = Ad(fb)
fb_daily = dailyReturn(fb_ad)

combine<-merge(MSFT_daily,tsla_daily)
head(combine)
comb_traded=merge(MSFT_daily,tsla_daily,all=F)
head(comb_traded)
dim(comb_traded)
charts.PerformanceSummary(comb_traded,main="Microsoft v/s Tesla")

table.AnnualizedReturns(comb_traded,scale = 252,Rf = .004/252)
