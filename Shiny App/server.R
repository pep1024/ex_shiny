#server.R
shinyServer(
    function(input, output) {
      output$Table <- renderDataTable(iris,
        options = list(pageLength = 1,
          lengthMenu = list(c(10, 20, 30, -1), c('10','20','30','ALL'))
        )
      )
      output$image_1 <- renderImage(
        {list(src = "www/iris_parameters.jpg",
          alt = "This is alternate text")
        }, deleteFile = FALSE
      )
      output$image <- renderImage(
        {filename <- normalizePath(file.path('./images',
          paste('pic_', input$radiobuttons_2, '.jpg', sep='')))
          # paste0('images/pic_', input$radiobuttons, '.jpg')
        list(src = filename,
             alt = "This is alternate text",
             width = 300, height = 200)
        }, deleteFile = FALSE
      )
      output$text1 <- renderPrint(
        {paste("You have selected", input$slider2, "clusters")}
      )
      # summary_iris <- as.data.frame.array(summary(iris))
      summary_iris <- summary(iris)
      output$Table2 <- renderDataTable(summary_iris,
        options = list(searching = FALSE, paging = FALSE)
      )
      output$text2 <- renderText(
        {paste("In slider 1, you have selected", input$slider1, "values")
        }
      )
      output$plot1 <- renderPlot({
        palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
        plot(Data(), col = Clusters()$cluster, pch = 20, cex = 3)
      }, height = "auto", width = "auto")
      output$coord <- renderText({
        paste0("x=", input$mouse$x, "\ny=", input$mouse$y)
      })
      Data <- reactive({
        iris[, c(input$xcol,input$ycol)]
      })
      Clusters <- reactive({
        kmeans(Data(), centers = input$slider1)
      })
      output$all <- renderUI({
        tagList(
          sliderInput("slider2", label = h4("Clusters"), 3, 10, 3),
          textOutput("text1")
        )
      })
    }
)
