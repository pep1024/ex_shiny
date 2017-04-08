# ui.R
library(shiny)
fluidPage(
  titlePanel("TabPanel"),
  sidebarLayout(
    sidebarPanel(
      h3("Menu")
    ),
    mainPanel(
      h3("Main Panel"),
      tabsetPanel(type = "tabs",
        tabPanel("Tab Panel 1")
      )
    )
  )
)