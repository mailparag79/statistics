remove.nonresponse = function(data,k) {
  data[data[,k] %in% 6:9,k] <- NA
  data
}

plot.factors = function(x, y, main, xlab) {
	mytable = with(data_sfo, table(x, y)) # create a 2 way table
	print(summary(mytable)) ##print chisq
	barplot(mytable, main=main,
		xlab=xlab, col=levels(as.factor(x)),
 	 	legend = rownames(mytable), beside=TRUE)

}

plot.factors.pct = function(x, main, xlab) {
	mytable = with(data_sfo, table(as.factor(x))) 
	barplot(prop.table(mytable), main=main,
		xlab=xlab, col=levels(as.factor(x)),
 	 	legend = rownames(mytable), beside=TRUE)

}

Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}

find.missing = function (a){
	missing = is.na(a)
	n.missing = sum(missing)
	return (n.missing)
}

random.imp = function (a){
	missing = is.na(a)
	n.missing = sum(missing)
	a.obs = a[!missing]
	imputed = a
	imputed[missing] = sample (a.obs, n.missing, replace=TRUE)
	return (imputed)
}

install.packages("survey")
install.packages("sampling")
install.packages("plyr")
install.packages("gmodels")
install.packages("ggplot2")

library(survey)
library(sampling)
library(plyr)
library(gmodels)
library(ggplot2)

#detach(data_sfo)
data_sfo = read.csv("C:/Users/dppodium.DPU.003/Desktop/project/SFO_Survey.csv", stringsAsFactor = TRUE)
attach(data_sfo)
head(data_sfo)
colNames = names(data_sfo)
dim(data_sfo)

##########Summary of data##############################################################################
## mean of overall rating
mean(Q8N, na.rm = TRUE)

##Mode of rating
Mode(Q8N)

###chisq test
related.cols = 0
for (i in 20:65){
	start = i+1
	for (j in start:65){
		ch.test = chisq.test(data_sfo[,i], data_sfo[,j])
		pvalue = ch.test$p.value
		if (pvalue < 0.05)
		{
			related.cols = c(colNames[i], colNames[j])
			related.cols = c(related.cols, pvalue)
			print(related.cols)
		}
	}
}



plot.factors(Q8N, STRATA, "Airport rating by STRATA", "Number of STRATA")
plot.factors.pct(Q8N, "Airport rating", "Rating Level")

plot.factors(Q8N, Q8A, "Airport rating by Artwork and Exhibit", "Rating")
plot.factors.pct(Q8A, "Artwork and Exhibit rating", "Rating Level")

plot.factors(Q8N, Q8B, "Airport rating by Restaurants", "Rating")
plot.factors.pct(Q8B, "Restaurants rating", "Rating Level")

plot.factors(Q8N, Q8C, "Airport rating by Shops and Concessions", "Rating")
plot.factors.pct(Q8C, "Shops and Concessions rating", "Rating Level")

plot.factors(Q8N, Q8D, "Airport rating by Signs and Directions", "Rating")
plot.factors.pct(Q8D, "Signs and Directions rating", "Rating Level")

plot.factors(Q8N, Q11, "Airport rating by Safety", "Rating")
plot.factors.pct(Q11, "Airport Safety rating", "Rating Level")

plot.factors(Q8N, Q17, "Airport rating by Area of living", "Rating")
plot.factors.pct(Q17, "Area of living", "Rating Level")

plot.factors(Q8N, Q2_1, "Airport rating by purpose of travel", "Rating")
plot.factors.pct(Q2_1, "purpose of travel", "Rating Level")

plot.factors(Q8N, Q7, "Airport rating by Number of Times Flown", "Rating")
plot.factors.pct(Q7, "Number of Times Flown", "Rating Level")

plot.factors(Q8N, Q8K, "Airport rating by Airtrain", "Rating")
plot.factors(Q8N, Q8L, "Airport rating by Shuttle Service", "Rating")
plot.factors(Q8N, Q8M, "Airport rating by Rental Service", "Rating")

summary.list = apply(data_sfo, 2, describe)
STRATA.summary = summary.list[8]
summary.list[20] #Q2_1
summary.list[21] #Q3_1
summary.list[29] #Q8A
summary.list[30] #Q8B
summary.list[31] #Q8C
summary.list[32] #Q8D
summary.list[33] #Q8E
summary.list[34] #Q8F

summary.list[35] #Q8G
summary.list[36] #Q8H
summary.list[37] #Q8I
summary.list[38] #Q8J
summary.list[39] #Q8K
summary.list[40] #Q8L
summary.list[41] #Q8M
summary.list[42] #Q8N

CrossTable(Q8N, Q2_1, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q7, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, digits=2, format="SAS")

CrossTable(STRATA, Q8N, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q8A, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q8B, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q8C, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q8D, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")

CrossTable(Q8N, Q11, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q17, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")

CrossTable(Q8N, Q20, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8N, Q21, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")

CrossTable(Q8J, Q8N, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8K, Q8N, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8L, Q8N, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")
CrossTable(Q8M, Q8N, prop.t=FALSE, prop.chisq=FALSE, 
	chisq=TRUE, format="SAS")


for (i in 5:length(colNames)) {
	if (colNames[i] != "Q18ZIP" && 
	    colNames[i] != "PASSTIME" && 
	    colNames[i] != "PASSMIN" && 
	    colNames[i] != "DEPTIME" && 
	    colNames[i] != "Q1MIL") {
		sdata = c(colNames[i], Mode(data_sfo[,i]))
		summary.var[i-4] = paste(sdata, collapse = ': Mode = ')
	}
}



################################################################################################################################

###########Stratified random sampling#############################################
n_1 = table(as.factor(STRATA))[[1]]
n_2 = table(as.factor(STRATA))[[2]]
n_3 = table(as.factor(STRATA))[[3]]

stratum.survey = table(as.factor(STRATA))
strata.size = as.data.frame(stratum.survey)$Freq
##[1] 1125 1564 1183

################################################################
strata.n = floor(strata.size * 0.3)
st=strata(data_sfo[order(data_sfo$STRATA),],stratanames=c("STRATA"),
	size=strata.n, method="srswor")
summary(st)

stratified.data = getdata(data_sfo[order(data_sfo$STRATA),], st)
dim(stratified.data)
names(stratified.data)
stratified.data$popsize = 
	with(stratified.data, ifelse(STRATA=="1",n_1,ifelse(STRATA=="2",n_2,n_3)))
stratified.data$myweights = 1/stratified.data$Prob


dstrata = svydesign(id=~1, weights=~myweights, fpc=~popsize,
	strat = ~STRATA, data=stratified.data)
summary(dstrata)

svymean(~Q8N, dstrata)
#      mean     SE
#Q8N 3.8269 0.0169

svyvar(~Q8N, dstrata)
#    variance     SE
#Q8N   1.1049 0.0443

svymean(~Q21, dstrata)
#      mean     SE
#Q21 2.0424 0.0226

svyvar(~Q21, dstrata)
#    variance     SE
#Q21   1.9785 0.0288

##means by strata
svyby(~Q8N, ~STRATA, dstrata, svymean)
#  STRATA      Q8N     se.Q8N
#1      1 3.959075 0.02867595
#2      2 3.762148 0.02711041
#3      3 3.786802 0.03185668

dstrata.qunt.8qn = svyquantile(~Q8N, quantile=c(0.25,0.5,0.75), design=dstrata,
	na.rm=TRUE, ci=TRUE, interval.type="Wald")
confint(dstrata.qunt.8qn)

dstrata.qunt.21q = svyquantile(~Q21, quantile=c(0.25,0.5,0.75), design=dstrata,
	na.rm=TRUE, ci=TRUE, interval.type="Wald")
confint(dstrata.qunt.21q)

svyby(~Q8N, ~STRATA, dstrata, svyquantile, quantiles=0.5, ci=TRUE)
X11()
svyhist(~Q8N, dstrata, main="Sample",col="pink")
X11()
svyboxplot(Q8N~as.factor(STRATA), dstrata, col="peachpuff")
X11()
plot(svysmooth(~Q8N, design=dstrata))

