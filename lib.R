



TakeMyCode <- function(input_dir = NULL){


  my_app <- list.files(input_dir, full.names = T)

  source(my_app)

  my_exit <- list(ui, server)
  names(my_exit) <- c("ui", "server")

  # Return
  return(my_exit)

}

