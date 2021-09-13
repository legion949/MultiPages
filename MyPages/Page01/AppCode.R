# Define UI for app that draws a histogram ----

shiny_options <- c(1:3)
names(shiny_options) <- c(1:3)

fluent_options <- OptS2F(shiny_options)

ui <- semanticPage(

  # App title ----
 # titlePanel("App 01 - La intro de capuccino! - COdigo de la APP"),

  # Sidebar layout with input and output definitions ----
 # sidebarLayout(

    # Sidebar panel for inputs ----
   # sidebarPanel(



      # Input: Slider for the number of bins ----
      "Page 01 - SideBarPanel",
 ChoiceGroup.shinyInput("choice_App1", value = 1, options = fluent_options),
 plotOutput("distPlot_App01")
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
  output$distPlot_App01 <- renderPlot({
    plot(iris, col ="blue")
  })

}




# Create Shiny app ----
# # # shinyApp(ui = ui, server = server)