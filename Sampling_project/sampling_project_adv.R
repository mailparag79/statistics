remove.nonresponse = function(data,k) {
  data[data[,k] %in% 6:9,k] <- NA
  data
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
install.packages("foreign")
library(survey)
library(sampling)
library(foreign)

data_sfo = read.csv("C:/Users/dppodium.DPU.003/Desktop/project/SFO_Survey.csv", stringsAsFactor = TRUE)
head(data_sfo)
colNames = names(data_sfo)
dim(data_sfo)

##########impute missing values by random samples##############################################################################

##find no of missing vars
for (i in 1:length(colNames)) {
	n.missing = find.missing(data_sfo[1:nrow(data_sfo), i])
	print (c(colNames[i], n.missing))
}

##missing vars
#[1] "Q13"  "3364"
#[1] "Q13A1" "3626" 
#[1] "Q13A2" "3826" 
#[1] "Q13A3" "3866"

chisq.test(as.factor(data_sfo$Q13), as.factor(data_sfo$STRATA))
##p-value = 0.8286

chisq.test(as.factor(data_sfo$Q13A1), as.factor(data_sfo$STRATA))
##p-value = 0.1992

chisq.test(as.factor(data_sfo$Q13A2), as.factor(data_sfo$STRATA))
##p-value = 0.148

chisq.test(as.factor(data_sfo$Q13A3), as.factor(data_sfo$STRATA))
##p-value = 0.3019

##theta does not depend on survey design
####missing completely at random using random imputation to replace these values
n.rows = nrow(data_sfo)
data_imp = matrix(ncol = ncol(data_sfo), nrow=n.rows)
data_imp = data_sfo
for (i in 1:length(colNames)) {
	if (colNames[i] == "Q13" || 
	    colNames[i] == "Q13A1" || 
	    colNames[i] == "Q13A2" || 
	    colNames[i] == "Q13A3") {
		data_imp[1:n.rows,i] = random.imp(data_sfo[1:n.rows, i])
	}
}

###test
##find no of missing vars
for (i in 1:length(colNames)) {
	n.missing = find.missing(data_imp[1:nrow(data_imp), i])
	print (c(colNames[i], n.missing))
}

# recode
data_imp$Q8N_rec[data_imp$Q8N == 0] = 1
data_imp$Q8N_rec[data_imp$Q8N == 6] = 5

data_imp$Q8N_rec[data_imp$Q8N == 1] = 1
data_imp$Q8N_rec[data_imp$Q8N == 2] = 2
data_imp$Q8N_rec[data_imp$Q8N == 3] = 3
data_imp$Q8N_rec[data_imp$Q8N == 4] = 4
data_imp$Q8N_rec[data_imp$Q8N == 5] = 5

##test levels
as.factor(data_imp$Q8N_rec)
#Levels: 1 2 3 4 5

data_imp = as.data.frame(data_imp)
detach(data_sfo)
attach(data_imp)
head(data_imp)
dim(data_imp)

################################################################################################################################

###########Stratified random sampling#############################################
n_1 = table(as.factor(STRATA))[[1]]
n_2 = table(as.factor(STRATA))[[2]]
n_3 = table(as.factor(STRATA))[[3]]

stratum.survey = table(as.factor(STRATA))
strata.size = as.data.frame(stratum.survey)$Freq
##[1] 1125 1564 1183
strata.n = floor(strata.size * 0.3)
st.unequal=strata(data_imp[order(data_imp$STRATA),],stratanames=c("STRATA"),
	size=strata.n, method="srswor", pik = data_imp$Q8N_rec)
summary(st.unequal)

stratified.data.unequal = getdata(data_imp[order(data_imp$STRATA),], st.unequal)
dim(stratified.data.unequal)
names(stratified.data.unequal)
stratified.data.unequal$popsize = 
	with(stratified.data.unequal, ifelse(STRATA=="1",n_1,ifelse(STRATA=="2",n_2,n_3)))
stratified.data.unequal$myweights = 1/stratified.data.unequal$Prob


dstrata.unequal = svydesign(id=~1, weights=~myweights, fpc=~popsize,
	strat = ~STRATA, data=stratified.data.unequal)
summary(dstrata.unequal)
svymean(~Q8N_rec, dstrata.unequal)
svyvar(~Q8N_rec, dstrata.unequal)

svymean(~Q21, dstrata.unequal)
svyvar(~Q21, dstrata.unequal)

##means by strata
svyby(~Q8N_rec, ~STRATA, dstrata.unequal, svymean)

svytotal(~Q8N, dstrata.unequal, na.rm=TRUE)
svyvar(~Q8N, dstrata.unequal, na.rm=TRUE)

svyquantile(~Q8N_rec, quantile=c(0.25,0.5,0.75), design=dstrata.unequal,
	na.rm=TRUE, ci=TRUE)

svyby(~Q8N, ~STRATA, dstrata.unequal, svyquantile, quantiles=0.5, ci=TRUE)
X11()
svyhist(~Q8N_rec, dstrata.unequal, main="Sample",col="pink")
X11()
svyboxplot(Q8N_rec~as.factor(STRATA), dstrata.unequal, col="peachpuff")
X11()
plot(svysmooth(~Q8N, design=dstrata.unequal))

#######################bootstrap variance######################################

boot.dstrata.unequal = as.svrepdesign(dstrata.unequal, type="bootstrap", replicates=500)
summary(boot.dstrata.unequal)
##         mean      SE
# Q8N 3.8527214 0.01741


svymean(~Q8N_rec, boot.dstrata.unequal, na.rm=TRUE)

##means by strata
svyby(~Q8N_rec, ~STRATA, boot.dstrata.unequal, svymean)

svyvar(~Q8N_rec, boot.dstrata.unequal, na.rm=TRUE)

svymean(~Q21, boot.dstrata.unequal)
svyvar(~Q21, boot.dstrata.unequal, na.rm=TRUE)

##############################subset estimation ######################################

svymean(~Q8N, subset(dstrata.unequal, Q18COUNTRY=="US" & Q7 > 2))
svymean(~Q8N, subset(boot.dstrata.unequal, Q18COUNTRY=="US" & Q7 > 2))

svyby(~Q8N+Q11, ~Q18COUNTRY+Q7, dstrata.unequal, svymean, keep.var=TRUE)

#############summary stats##########################################################

a = svymean(~interaction(STRATA, Q8N), design = dstrata.unequal, na.rm=TRUE)
b = ftable(a, rownames = list(STRATA = c("AM", "MID",
     "PM"), Q8N = c("Unacceptable", "Below Average", "Average", "Good", "Outstanding")))
round(100 * b, 1)

a.boot = svymean(~interaction(STRATA, Q8N), design = boot.dstrata.unequal, na.rm=TRUE)
b.boot = ftable(a, rownames = list(STRATA = c("AM", "MID",
     "PM"), Q8N = c("Unacceptable", "Below Average", "Average", "Good", "Outstanding")))
round(100 * b, 1)

#############post stratification calibration#########################################
##strata.size 
##[1] 1125 1564 1183
pop.types = xtabs(~as.factor(STRATA), data=data_imp)
cali.dstrata.unequal = postStratify(dstrata.unequal, strata = ~STRATA, pop.types)
svymean(~Q8N, cali.dstrata.unequal, na.rm=TRUE)

##means by strata
svyby(~Q8N, ~STRATA, cali.dstrata.unequal, svymean)

###calibration

pop.totals = c(`(Intercept)`=3872, STRATA1=1125, STRATA2=1564, STRATA3=1183)
calibrat.dstrata.unequal = calibrate(dstrata.unequal, ~STRATA+Q20, c(pop.totals, Q20=1813))


###################regression models###################################################

glm.dstrata.unequal = svyglm(Q8N_rec ~ as.factor(STRATA) - 1, design = dstrata.unequal)
svyby(~Q8N,~as.factor(STRATA),dstrata.unequal,svymean, keep.var=TRUE)
svymean(~Q8N, glm.dstrata.unequal, na.rm=TRUE)

###########chisq tests#################################

scsloop = function( vars , design ){ 
	svychisq( as.formula( paste( "~" , vars ) ) , design ) 
}

# test it out
scsloop( "Q8N+STRATA" , dstrata.unequal )

# identify vars based on column name
cols.to.chisq = colNames[ seq(29, 49, by = 1) ]

# find every combination of that vector, taken two at a time
combos = combn( cols.to.chisq , 2 )

# separate them by +
col.combos = paste( combos[ 1 , ] , combos[ 2 , ] , sep = "+" )

# run it on each of those character strings 
( x = lapply( col.combos , scsloop , dstrata.unequal ) )

col.combos[1] ; x[[1]]
col.combos[2] ; x[[2]]
col.combos[3] ; x[[3]]



