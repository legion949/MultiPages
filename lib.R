



TakeMyCode <- function(input_dir = NULL, input_subdir = NULL,
                       input_file = NULL){
  
  if(!is.null(input_dir) && is.null(input_dir)) the_dir <- input_dir else
    if(is.null(input_dir) && !is.null(input_dir)) the_dir <- input_subdir else
      if(!is.null(input_dir) && !is.null(input_dir)) the_dir <- paste0(input_dir, "/", input_subdir)
      
      
      all_files <- list.files(the_dir, full.names = T)
      
      dt_file <- grepl(input_file, all_files)
      
      the_file <- all_files[dt_file]
      
      source(the_file)
      
      my_exit <- list(ui, server)
      names(my_exit) <- c("ui", "server")
      
      # Return
      return(my_exit)
      
}


TakeMyLib <- function(all_lib = NULL){

  all_files <- list.files(recursive = T)
  dt_lib <- grepl( "lib.R", list.files(recursive = T))
  dt_lib[all_files == "lib.R"] <- FALSE
  
  all_lib <- all_files[dt_lib]
  
  for (k in 1:length(all_lib)) source(all_lib[k])  
}



TakeMyLib()