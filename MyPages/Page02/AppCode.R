# Define UI for app that draws a histogram ----
# ui <- fluidPage(

shiny_options <- c("A", "B", "C")
names(shiny_options) <- c("Option A", "Option B", "Option C")

fluent_options <- OptS2F(shiny_options)

# options <- list(
#   list(key = "A", text = "Option A"),
#   list(key = "B", text = "Option B"),
#   list(key = "C", text = "Option C")
# )



ui <- div(
  ChoiceGroup.shinyInput("choice_App2", value = "B", options = fluent_options),
  plotOutput("distPlot_App02")

)

# Define server logic required to draw a histogram ----
server <- function(input, output, session) {

  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot_App02 <- renderPlot({
    plot(mtcars, col ="orange")
  })

}




# Create Shiny app ----
# # # shinyApp(ui = ui, server = server)