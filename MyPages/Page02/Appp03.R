library(shiny.fluent)


if (interactive()) {
  options <- list(
    list(key = "A", text = "Option A"),
    list(key = "B", text = "Option B"),
    list(key = "C", text = "Option C")
  )



    ui <- div(
      ChoiceGroup.shinyInput("choice", value = "B", options = options)
    )


    shinyApp(ui = ui, server = server)
}