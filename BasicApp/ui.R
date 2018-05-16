#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data and Iris mayhem"),
  
  # Sidebar with a slider input for number of bins 
  tabsetPanel(
    tabPanel("Geyser",
      sidebarLayout(
        sidebarPanel(
          sliderInput("bins",
                      "Number of bins:",
                      min = 1,
                      max = 50,
                      value = 30)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
          plotOutput("distPlot")
        )
      )),
    tabPanel("Iris",
      sidebarLayout(
        sidebarPanel(
          selectInput("xvar",
                      label = "Select x-axis variable",
                      choices = names(iris)[1:4],
                      selected = "Sepal.Length"),
          selectInput("yvar",
                      label = "Select y-axis variable",
                      choices = names(iris)[1:4],
                      selected = "Sepal.Width")
        ),
        mainPanel(
          plotOutput("scatterPlot")
        )
      )
    )
  )
)
)
