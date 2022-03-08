x <- 1:25
length(x)
dim(x) <- c(5,5)

m1 <- matrix(1:25, ncol=5)
m2 <- matrix(1:6, ncol=3, nrow=2, byrow = T)

m2 + 100
m2 * 4
