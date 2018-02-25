#1. If Z is norm (mean = 0, sd = 1) 
#Find P(Z > 2.64) 
pnorm(2.64, mean=0, sd=1, lower.tail=FALSE) 
#Find P(|Z| > 1.39) 
answer <- 2*(1-(pnorm(-1.39, mean=0, sd=1, lower.tail=FALSE)))
answer
#P(|Z| > 1.39) = P( Z > 1.39) + P( Z < -1.39) = [1 - P( z < 1.39)] + [ 1 - P( z - 1.39)] =2*[1 - P( z < 1.39)] = 2(1 - 0.9177) = 2(0.0823) = 0.1646

#2. Suppose p = the proportion of students who are admitted to the graduate school of the University of California at Berkeley, and suppose that a public relation officer boasts that UCB has historically had a 40% acceptance rate for its graduate school. Consider the data stored in the table UCBAdmissions from 1973. 
#Assuming these observations constituted a simple random sample, are they consistent with the officerâ..s claim, or do they provide evidence that the acceptance rate was significantly less than 40%? 
#Use an Î± = 0.01 significance level. 
View(UCBAdmissions)
apply(UCBAdmissions, c(1, 2), sum)
mosaicplot(apply(UCBAdmissions, c(1, 2), sum),
           main = "Student admissions at UC Berkeley")
prop.table(UCBAdmissions) 

ftable(round(prop.table(UCBAdmissions), 3),
       row.vars="Dept", col.vars = c("Gender", "Admit"))
prop.test(1755,4526 , p=0.4, alternative = "less" , conf.level = 0.99, correct = F)

Conclusion: 
since the null probability value lies in the 99 percent confidence interval we say that, we are 99% conident about officer's claim of 40% of acceptance rate.
