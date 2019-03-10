library(carData)
data("Davis")

?Davis


plot(Davis$weight, Davis$repwt, 
     main="True and Reported Weight of 200 Participants", ylab="Reported Weight", xlab="True Weight")

Davis <- Davis[which(Davis$weight < 160),]
plot(Davis$weight, Davis$repwt, 
     main="True and Reported Weight of 200 Participants", ylab="Reported Weight", xlab="True Weight")


r <- cor(Davis$weight, Davis$repwt,  use="complete.obs", method = "pearson")
r
# [1] 0.9858579
r^2

linearModel <- lm(weight ~ repwt, data=Davis)
print(linearModel)
summary(linearModel)

plot(Davis$weight, Davis$repwt, 
     main="True and Reported Weight of 200 Participants", ylab="Reported Weight", xlab="True Weight")
abline(linearModel)
