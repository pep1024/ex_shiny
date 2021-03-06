#ui.R
shinyUI(
  fluidPage(
    titlePanel(h1("Shiny App")),
    sidebarLayout(
      sidebarPanel(
        h2("Menu"),
        fluidRow(
          br(),
          column(width = 6,
            h4("Actionbutton"),
            actionButton("per", label = "Perform")),
          column(width = 6,
            h4("Help Text"),
            helpText("For Help"))
        ),
        br(),
        fluidRow(
          column(6, 
            h4("Submitbutton"),
            submitButton("Submit")),
          column(6,
            numericInput("num", label = h4("Numeric Input"), value = 10))
        ),
        fluidRow(
          column(6, 
            h4("Single Checkbox"),
            checkboxInput("checkbox", label = "Choice A", value =TRUE)),
          column(6,
            radioButtons("radiobuttons", label = h4("Radio Buttons"), 
              choices = list("A1" = 1, "A2" = 2))
          )
        ),
        fluidRow(
          column(6, 
            checkboxGroupInput("checkGroup", label = h4("Checkbox group"),
              choices = list("A" = 1, "B" = 2, "C" = 3), selected = 2)),
          column(6,
            selectInput("select", label = h4("Select Box"),
              choices = list("Choice 1" = 1, "Choice 2" = 2),
              selected = 2))
        ),
        fluidRow(
          column(5,
            checkboxGroupInput("xcol", label = h4("variable X"),
              choices = names(iris), selected = names(iris)[4]
            )
          ),
          column(7,
            selectInput("ycol", label = h4("Variable Y"), 
              names(iris),
              selected = names(iris)[4], multiple = FALSE)            
          )
        ),
        fluidRow(
          column(6,
            dateInput("date", label = h4("Date Input"), value = "2016-12-01")),
          column(6,
            sliderInput("slider1", label = h4("Sliders"), 3, 9, 3))
        ),
        fluidRow(
          column(6,
            dateRangeInput("dates", label = h4("Date Range"))),
          column(6,
            textInput("text", label = h4("Text Input"), value = "Some Text"))
        ),
        fileInput("file", label = h4("File Input"))
      ),
      mainPanel(
        h1("Main"), br(), br(),
        img(src="iris_parameters.jpg", height = 'auto', width = 'auto'),
        p("This famous (Fisher's or Anderson's)", 
          a("iris", href="http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html"),
          "data set gives the measurements in centimeters of the 
            variables sepal length and width and petal length and width,
            respectively, for 50 flowers from each of 3 species of iris.
            The species are ",
          strong("Iris setosa,"), strong("versicolor"), "and",
          strong("virginica."),
          br(),
          h2("Analysis")
        ),
        tabsetPanel(type = "tabs",
          tabPanel("Data Table",
            dataTableOutput("Table")
          ), 
          tabPanel("Summary",
            dataTableOutput("Table2")
          ),
          tabPanel("Text",
            includeText("../iris.txt")       
          ),
          tabPanel("Image",
            imageOutput("image_1")       
          ),
          tabPanel("K-means",
#            radioButtons("radiobuttons_2", label = h4("Select Image"), 
#              choices = list("A1" = 1, "A2" = 2)),
#            imageOutput("image"),
            plotOutput("plot1", click = "mouse"),
            verbatimTextOutput("coord"),
            uiOutput("all")
#            submitButton("Submit"),
#            sliderInput("slider2", label = h4("Clusters"), 3, 10, 3),
#            textOutput("text1"),
#            textOutput("text2")
          ),
          tabPanel("Iris R Dataset help",
            includeHTML("http://stat.ethz.ch/R-manual/R-devel/library/datasets/html/iris.html")       
          )
        )
      )
    )
  )
)