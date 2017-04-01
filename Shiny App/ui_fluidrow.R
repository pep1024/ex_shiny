# ui.R
shinyUI(
  fluidPage(
    titlePanel("Widgets"),
#    fluidRow(
      h3("Buttons"),
      actionButton("action", label = "Action"),
      br(),
      br(),
      submitButton("Submit")
#    )
  )
)
