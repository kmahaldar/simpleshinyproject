Coursera Developing Data Products Project: Predicting Solar R
========================================================
author: Kaushik Mahaldar
date: Mar 22, 2015

Introduction
========================================================
The shiny app under development allows a user to enter some basic information about the wind speed, Temperature , Month and day of month. Then it predicts the Solar R based on a training data set. the training data set is the airquality data set.
 
The Algorithm
========================================================


```r
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
```
The simple GLM model is choosend because of its simplicity

