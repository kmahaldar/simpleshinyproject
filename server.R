library(shiny)
library(RCurl)
library(caret)
#data set airquality is available in R
modFit <- train(Solar.R ~ Wind + Temp  + Month + Day, 
                method="glm", data=airquality)
shinyServer(
  function(input, output) { 
    output$prediction <- renderPrint ({
      Wind = input$Wind
      Temp = input$Temp
      Month = input$Month
      Day = input$Day
      
      predict(modFit,data.frame(Wind , Temp , Month, Day))
    })
     
      
  }
)
