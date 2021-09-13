library(shiny)
library(shiny.fluent)
library(shiny.semantic)



OptS2F <- function(input_vector = NULL){

options <- list()

for (k in 1:length(input_vector)) {
  options[[k]] <- list(key = input_vector[k], text = names(input_vector)[k])
  }

return(options)

}

