plot(x = iris$Sepal.Length, y = iris$Petal.Length,  # x and y variables
     col = iris$Species,                            # color by species! 
     pch = 16, cex = 2,                             # aesthetic parameters 
     xlab = "Sepal Length", ylab = "Petal Length",  # axis labels
     main = "Flower characteristics in Iris")       # title

# Adding grid: 
grid()

# Adding a legend: 
legend (x = 4.5, y = 7, legend = levels(iris$Species), 
        pch = 16, col = c(1:3))