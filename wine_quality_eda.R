red_wine <- read.csv("~/Desktop/CL7730/redwine.csv")
head(red_wine)
str(red_wine)
# summary 
summary (red_wine)

#checking for relationships 
plot(red_wine$alcohol, red_wine$quality,
     xlab = "Alcohol (%)",
     ylab = "Wine Quality",
     main = "Wine Quality vs Alcohol")

plot(red_wine$sulphates, red_wine$quality,
     xlab = "Sulphates",
     ylab = "Wine Quality",
     main = "Wine Quality vs Sulphates")

plot(red_wine$volacid, red_wine$quality,
     xlab = "Volatile Acidity",
     ylab = "Wine Quality",
     main = "Wine Quality vs Volatile Acidity")

plot(red_wine$density, red_wine$quality,
     xlab = "Density",
     ylab = "Wine Quality",
     main = "Wine Quality vs Density")
abline(lm(quality ~ density, data = red_wine), col = "red", lwd = 2)

#create a model 
full_model <- lm(quality ~ ., data = red_wine)
summary(full_model)

#make the model more simple 

step_model <- step(full_model, direction = "both", trace = 0)
summary(step_model)


#model validity 
par(mfrow = c(2,2))
plot(step_model)
