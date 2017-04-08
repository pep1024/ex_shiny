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
        plot(iris$Sepal.Length,iris$Sepal.Width, col = factor(iris$Species))
      }, height = "auto", width = "auto")
      output$coord <- renderText({
        paste0("x=", input$mouse$x, "\ny=", input$mouse$y)
      })
      output$all <- renderUI({
        tagList(
          sliderInput("slider2", label = h4("Clusters"), 3, 10, 3),
          textOutput("text1")
        )
      })
    }
)
