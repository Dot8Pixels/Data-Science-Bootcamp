my_sum <- function(num1, num2){
  num1 + num2
}

my_sum(10, 15)

my_sum2 <- function(num1, num2=2){
  num1 + num2
}

library(glue)
my_name <- "Toy"
my_age <- 33

glue("Hello my name is {my_name}. This year I'm {my_age} years old.")

hello <- function(user_name){
  glue("Hello! {user_name}")
}

fav_book <- "Business Made Simple"

movie_lover <- TRUE

puppy <- c("cat", "dog", "dog", "cat", "cat")

puppy <- as.factor(puppy)

today <- as.Date

seq(from=1, to=100, by=4)
my_friends <- c("Toy", "Aan", "Yos", "Ink", "Top")

matrix(1:25, nrow = 5)
m1 <- matrix(1:25, ncol = 5, byrow = TRUE)
ncol(m1)
nrow(m1)
dim(m1)

customer_data <- list(
  id = 1,
  name = "David",
  location = "London",
  language = "English"
)

customer_data$name
customer_data[[3]]

customer_data <- list(
  customer_01 = list(
    name = "David",
    location = "London"
  ),
  customer_02 = list(
    name = "Ako",
    location = "Tokyo"
  ),
  customer_03 = list(
    name = "Anna",
    location = "Washington",
    movie_lover = TRUE,
    visit_bank = TRUE,
    account_balance = 2000
  )
)

age <- c(33, 33, 30, 29, 28)
friend <- c("Toy", "Aan", "Yos", "Ink", "Top")
movie_lover <- c(TRUE, FALSE, TRUE, FALSE, FALSE)

df <- data.frame(id = 1:5,
                 friend,
                 age,
                 movie_lover)

write.csv(df, "friends.csv", row.names = FALSE)

friends <- read.csv("friends.csv")
class(friends)

friends[1:2, 1:3]
friends[1:4, ]
friends[c(1,3,4),]
friends[, c(1,2)]
friends[, c("friend","age")]

friends$age < 30

friends[friends$age >=30, ]
friends[friends$movie_lover, ]
friends[!friends$movie_lover, ]

new_friends <- data.frame(
  id = 6:7,
  friend = c("Ball", "Wann"),
  age = c(32, 26),
  movie_lover = c(T, T)
)

all_friends <- rbind(friends, new_friends)

all_friends$correct_age <- all_friends$age - 1

all_friends$age <- NULL

names(all_friends)[2] <- "name"

mini_friends <- all_friends[ -c(3,4), ]

score <- 90

if (score >= 80){
  print("Passed")
} else {
  print("Failed")
}

check_grade <- function(score){
  if (score >= 80){
    print("A")
  } else if (score >= 70) {
    print("B")
  } else {
    print("C")
  }
}

score <- 79
ifelse(score >= 80, "Passed", "Failed")

check_grade2 <- function(score){
  ifelse(score >= 80, "Passed", "Failed")
}

numbers <- c(10, 15, 20, 50)

for (i in numbers){
  print(i * 2)
}

numbers * 2

friends <- c('Toy', 'Aan', 'Wann')

for (i in friends){
  print(paste("Hello!", i))
}

paste("Hello!", friends)

x <- 0

while (x < 10){
  print(x+1)
  x <- x + 1
}

check_in <- function() {
  user_input <- readline("What is your username: ")
  #print(user_input)
  user_pw <- readline("What is your password: ")
  #print(user_pw)
  
  sys_un <- c("Gun", "Guide")
  sys_pw <- "1234"
  
  if(user_input %in% sys_un & user_pw == sys_pw){
    print("Login successfully")
  } else{
    print("Please check your username or password")
  }
}

score <- c(50, 100, 95)
names(score) <- c("Toy", "Aan", "Wan")
