library(shiny)
library(shiny.router)
library(shiny.semantic)
library(semantic.dashboard)
library(bslib)
library(plotly)
library(DT)
source("lib.R")


# This generates menu in user interface with links.
menu <- (

  tags$ul(
    tags$li(a(class = "item", href = route_link("/"), "Pagina Principal - Cappuchino")),
    tags$li(a(class = "item", href = route_link("Pagina02"), "Pagina02 - RMedic")),
    tags$li(a(class = "item", href = route_link("Pagina03"), "Pagina03 - Uchikomi")),
    img(src = "capuccino.png", height="300p", width="300p", align="c" )
  )


)


Code01 <- TakeMyCode(input_dir = "MyPages", input_subdir = "Page01", input_file =  "AppCode")
Code02 <- TakeMyCode(input_dir = "MyPages", input_subdir = "Page02", input_file =  "AppCode")
Code03 <- TakeMyCode(input_dir = "MyPages", input_subdir = "Page03", input_file =  "AppCode")


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
    menu,
   # titlePanel(title),
  p(content),
  #  dataTableOutput(table_id)
  ...
  )
}

# Both sample pages.
page_ui01 <- page2("Pagina Principal", "Bienvenido a la página principal la CONSULTORA", Code01$ui)
page_ui02 <- page2("Pagina 02", "Aca va la App02 - RMedic!",Code02$ui)
page_ui03 <- page2("Pagina 03", "Aca va la App03 - Uchikomi!",Code03$ui)








# Creates router. We provide routing path, a UI as
# well as a server-side callback for each page.
router <- make_router(
  route("/", page_ui01, Code01$server),
  route("Pagina02",  page_ui02, Code02$server),
  route("Pagina03",  page_ui03, Code03$server)
 # route("Pagina02", third_page, NA),
)

# Make output for our router in main UI of Shiny app.
ui <- shinyUI(fluidPage(
#  theme = "main.css",
 # theme = bs_theme(version = 4),
 # theme = bs_theme(bootswatch = "solar"),
  router$ui
))

# Plug router into Shiny server.
server <- shinyServer(function(input, output, session) {
  router$server(input, output, session)
})

# Run server in a standard way.
shinyApp(ui, server)
