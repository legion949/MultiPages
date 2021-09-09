library(shiny)

# Define UI for app that draws a histogram ----
ui <- fluidPage(

  # App title ----
  titlePanel("Bienvenido la pagina de MLG!"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      # Input: Slider for the number of bins ----
      "Page 01 - SideBarPanel",
      radioButtons("selector_page02", "Selector Pagina 2", c(10:13))

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Histogram ----
      plotOutput(outputId = "distPlot_pagina2")

    )
  )
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
  output$distPlot_pagina2 <- renderPlot({
    plot(iris, col ="blue")
  })

}

# Create Shiny app ----
# # # shinyApp(ui = ui, server = server)
