library(shiny)
library(caret)
shinyUI (
  pageWithSidebar (
    # Application title
    headerPanel ("Get the predicted Solar R during May to September "),
    
    sidebarPanel (
      numericInput('Wind', 'Wind speed in mph', 10, min = 0, max= 200, step = 1),
      numericInput('Temp', 'Temperature in degrees F', 55, min = 15, max= 130, step = 0.1),
      #numericInput('Month', 'Month of the year, 5 to 9', 6, min = 5, max= 9, step = 1),
      #numericInput('Day', 'Day of the month, 1 to 31', 10, min = 1, max= 31, step = 1),
      sliderInput('Month', 'Month of the year, May to September', value=7, min=5, max=9, step=1),
      sliderInput('Day', 'Day of the month', value=15, min=1, max=31, step=1),
      
      
      submitButton('Submit')
    ),
    mainPanel (
      h3 ('Results of prediction'),
      h4 ('Solar.R Predicted value: (Please click on Submit after changing value)'),
      textOutput("prediction")
    )
  )
  
)
