Coursera Developing Data Products Project: Predicting Solar R
========================================================
author: Kaushik Mahaldar
date: Mar 22, 2015

Introduction
========================================================
The shiny app under development allows a user to enter some basic information about the wind speed, Temperature , Month and day of month. Then it predicts the Solar R based on a training data set. the training data set is the "airquality" data set which is included in R environment.

Training data description
----------
Daily air quality measurements in New York, May to September 1973.

User guide
---------
Users have to submit the wind speed, temperature , month and day of month. The application the predicts Solar r value depending on the submitted variables. user has to click on 'submit' button after changing the input value.
 
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

