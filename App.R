library(shiny)
library(shiny.router)
source("lib.R")


# This generates menu in user interface with links.
menu <- (
  tags$ul(
    tags$li(a(class = "item", href = route_link("/"), "Pagina Principal - Cappuchino")),
    tags$li(a(class = "item", href = route_link("Pagina01"), "Pagina01 - RMedic")),
    tags$li(a(class = "item", href = route_link("Pagina02"), "Pagina02 - MLG")),
    tags$li(a(class = "item", href = route_link("Pagina03"), "Pagina03 - Qué querés???"))
  )
)


Code01 <- TakeMyCode(input_dir = "Page01")
Code02 <- TakeMyCode(input_dir = "Page02")

# This creates UI for each page.
page <- function(title, content, table_id) {
  div(
    menu,
    titlePanel(title),
    p(content),
    dataTableOutput(table_id)
  )
}


# This creates UI for each page.
page3 <- function(title, content,...) {
  div(
    menu,
    titlePanel(title),
    p(content),
    img(src = "capuccino.png", height="300p", width="300p", align="c" )
  )
}

page2 <- function(title, content, ...) {
  div(
    br(),
    menu,
   # titlePanel(title),
  p(content),
  #  dataTableOutput(table_id)
  ...
  )
}

# Both sample pages.
root_page <- page3("Pagina Principal", "Bienvenido a la página principal la CONSULTORA")
other_page <- page2("Pagina 01", "Aca va la App01 - RMedic!",Code01$ui)
# third_page <- div(menu, titlePanel("Pagina02 - Nada! En construccion!"))
third_page <- page2("Pagina 02", "Aca va la App02 - MLG!",Code02$ui)
my_page <- page("Pagina 03", "Que querés acá??????", "table_tree")

# Callbacks on the server side for
# the sample pages
root_callback <- function(input, output, session) {
  output$table_one <- renderDataTable({
    data.frame(x = c(1, 2), y = c(3, 4))
  })
}

other_callback <- Code01$server

third_page_callback <- Code02$server

mypage_callback <- function(input, output, session) {
  output$table_tree <- renderDataTable({
    # data.frame(x = c(5, 6), y = c(7, 8))
    mtcars
  })

  output$graph_tree <- renderPlot({
    # data.frame(x = c(5, 6), y = c(7, 8))
    plot(mtcars)
  })


}

# Creates router. We provide routing path, a UI as
# well as a server-side callback for each page.
router <- make_router(
  route("/", root_page, root_callback),
  route("Pagina01", other_page, other_callback),
 # route("Pagina02", third_page, NA),
 route("Pagina02", third_page, third_page_callback),
  route("Pagina03", my_page, mypage_callback)
)

# Make output for our router in main UI of Shiny app.
ui <- shinyUI(fluidPage(
  router$ui
))

# Plug router into Shiny server.
server <- shinyServer(function(input, output, session) {
  router$server(input, output, session)
})

# Run server in a standard way.
shinyApp(ui, server)
