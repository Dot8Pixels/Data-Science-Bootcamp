my_name <- "Gun"
my_age <- 26
university <- "KMITL"

rm(university)

(x <- 1:100)

y = 20
30 -> z

(x <- 25:49)

y <- seq(1, 100, by=5)

class(x)
class(y)

class(3.42)
class(1L)

class("Hello World")

friends <- c("Toy", "John", "Mary", "Anna", "Kevin")

movie_lovers <- c(T, F, T, T, F)
class(movie_lovers)

ages <- c(33, 30, 25, 22, 28)

animals <- c("cat", "dog", "dog", "cat", "cat")

animals <- factor(animals)
table(animals)

my_date <- "2022-01-08"
my_date <- as.Date(my_date)

x <- 1:10
(m1 <- matrix(x, ncol=5, byrow = T))

customer01 <- list(
  fname = "David",
  lname = "Beckham",
  age = 42,
  movies = c("Avenger",
             "Spiderman",
             "Justice League"),
  m = matrix(1:10, ncol=2),
  address = c("Bangkok", "London")
)
customer02 <- list(
  fname = "Marry",
  lname = "Anne",
  age = 35,
  movies = c("Iron Man",
             "Batman",
             "Aquaman"),
  m = matrix(1:10, ncol=2)
)

customer_db <- list(
  id01 = customer01,
  id02 = customer02
)


friends <- c("Toy", "John", "Mary", "Anna", "David")
ages <- c(33, 30, 25, 28, 31)
movies <- c(T, T, F, F, T)
animals <- c("cat", "cat", "dog", "dog", "cat")


df <- data.frame(id = 1:5,
                 friends,
                 ages,
                 movies,
                 animals)

View(df)

write.csv(df, "friends.csv", row.names = F)
list.files()

df <- read.csv("friends.csv")

penguins <- read.csv("https://raw.githubusercontent.com/mwaskom/seaborn-data/master/penguins.csv")

mean(penguins$bill_length_mm, na.rm = T)
sum(penguins$bill_length_mm, na.rm = T)
median(penguins$bill_length_mm, na.rm = T)
max(penguins$bill_length_mm, na.rm = T)
min(penguins$bill_length_mm, na.rm = T)
summary(penguins)

head(penguins, 3)
tail(penguins, 3)

dim(penguins)

mini_penguins <- penguins[1:10, ]

mini_penguins$newcolumn <- mini_penguins$bill_length_mm * 2

mini_penguins$newcolumn <- NULL
View(mini_penguins)

mini_penguins <- mini_penguins[, 1:6]

result <- subset(mini_penguins, 
       bill_length_mm > 40,
       c("species", "island", "bill_length_mm"))

nrow(penguins)
nrow(penguins) - sum(complete.cases(penguins))

penguins[!complete.cases(penguins), ]

my_sum <- function(x, y) {
  x+y
}

my_cube <- function(base, power=3) {
  base ** power
}

test_function <- function(x) {
  list(value1 = x+1, 
       value2 = x*2, 
       value3 = x**2)
}

score <- 75

test_01 <- function(score){
  if(score >= 80){
    print("A")
  } else if(score >= 70){
    print("B")
  } else if(score >= 60){
    print("C")
  } else if(score >= 50){
    print("D")
  } else{
    print("F")
  }
} 

for(i in 1:ncol(mtcars)){
  print(mean(mtcars[, i]))
}

apply(mtcars, 2, mean)

x <- c(25, 30, 32, 55, 100)
x*2

for(i in 1:length(x)){
  print(x[i]*2)
}


c <- 0
while(c < 5){
  print("Hello World")
  c <- c + 1
}

login <- function(){
  un = readline("Username: ")
  pw = readline("Password: ")
  if(un == "Gun" & pw == "1234"){
    print("Successfully Login.")
  } else {
    print("Your Username or Passward is incorrect")
  }
}

# Homework Pao Ying Chub