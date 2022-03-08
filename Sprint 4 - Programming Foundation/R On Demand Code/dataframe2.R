friends <- c("Wan", "Ink", "Aan", "Bee", "Top")

ages <- c(26, 27, 32, 31, 28)

locations <- c("New York", "London", "London", "Tokyo", "Manchester")

movie_lover <- c(TRUE, TRUE, FALSE, TRUE, TRUE)

my_list <- list(friends = friends,
                ages = ages,
                locations = locations,
                movie = movie_lover)

df <- data.frame(my_list)
