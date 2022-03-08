library(Dict)

weapons <- dict("1"="Rock", "2"="Paper", "3"="Scissors", "4"="Run!")

rps_play <- function(user_point=0, opponent_point=0, turn=1){
  while(TRUE){
    cat(paste("Turn: ", turn))
    user_weapon <- readline("\nPlease choose your weapon (Rock=1, Paper:2, Scissors:3, Run!:4): ")
    #cat("\n---------------------------------------------------------------------------------------------------------------\n")
    cat("\n")
    if(user_weapon %in% c("1", "2", "3")){
      result <- versus(user_weapon)
      sum_points <- cal_points(result, user_point, opponent_point)
      user_point <- sum_points[1]
      opponent_point <- sum_points[2]
      cat(paste("Player Points: ", user_point, "\n"))
      cat(paste("Opponent Points: ", opponent_point, "\n"))
      cat("---------------------------------------------------------------------------------------------------------------\n")
      turn <- turn + 1
    } else if(user_weapon == 4){
      cat("-- END GAME --\n")
      if(user_point > opponent_point){
        cat("Congratulations, you won!")
      } else if(user_point < opponent_point){
        cat("Sorry, you lost!!!")
      } else if(user_point == opponent_point){
        cat("- Draw -")
      }
      cat("\nThank for joining in.")
      break
    } 
    
    else {
      rps_play()
    }
  }
}


versus <- function(weapon){
  player_weapon <- weapons[weapon]
  opponent_weapon <- sample(c("Rock", "Paper", "Scissors"), 1)
  cat(paste("Your weapon - ", player_weapon, "\n"))
  cat(paste("Opponent weapon - ", opponent_weapon, "\n"))
  cat(paste(player_weapon, " vs. ", opponent_weapon, "\n"))
  if (player_weapon == "Rock" & opponent_weapon == "Rock"){
    result <- "Draw"
    cat("Draw\n")
  } else if (player_weapon == "Rock" & opponent_weapon == "Paper"){
    result <- "Lose"
    cat("You Lose\n")
  } else if (player_weapon == "Rock" & opponent_weapon == "Scissors"){
    result <- "Win"
    cat("You Win\n")
  } else if (player_weapon == "Paper" & opponent_weapon == "Rock"){
    result <- "Win"
    cat("You Win\n")
  } else if (player_weapon == "Paper" & opponent_weapon == "Paper"){
    result <- "Draw"
    cat("Draw\n")
  } else if (player_weapon == "Paper" & opponent_weapon == "Scissors"){
    result <- "Lose"
    cat("You Lose\n")
  } else if (player_weapon == "Scissors" & opponent_weapon == "Rock"){
    result <- "Lose"
    cat("You Lose\n")
  } else if (player_weapon == "Scissors" & opponent_weapon == "Paper"){
    result <- "Win"
    cat("You Win\n")
  } else if (player_weapon == "Scissors" & opponent_weapon == "Scissors"){
    result <- "Draw"
    cat("Draw\n")
  }
  return(result)
}

cal_points <- function(result, u_point, o_point){
  if(result == "Win"){
    u_point <- u_point + 1
  } else if(result == "Lose"){
    o_point <- o_point + 1
  } else if (result == "Draw"){
    #Do Nothing
  }
  
  ls_points <- c(u_point, o_point)
  return(ls_points)
  
}


run_game <- function(){
  cat("Hello Ladies & Gentlemen, welcome to Rock-Paper-Scissors Game \n")
  cat("---------------------------------------------------------------------------------------------------------------")
  cat("\nRule")
  cat("\n---------------------------------------------------------------------------------------------------------------")
  game_start <- toupper(readline("\nDo you want to play the RPS game? (Y/N): "))
  if(game_start == "Y"){
    cat("\n---------------------------------------------------------------------------------------------------------------\n")
    cat("Game Start!\n")
    rps_play()
  } else {
    cat("\nExit")
  }
}

run_game()
