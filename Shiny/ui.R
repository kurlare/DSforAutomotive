#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
newEventsDF <- read.csv("new_brake_events.csv")
oldEventsDF <- read.csv("historical_brake_events.csv")

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Analyze Recent Brake Events"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar",
                  label = h3("Choose X-axis Variable"),
                  choices = colnames(newEventsDF[, -1])
      ),
      selectInput("yvar",
                  label = h3("Choose Y-axis Variable"),
                  choices = colnames(newEventsDF[, -1]),
                  selected = "brake_distance_ft"
      ),
      br(),
      checkboxInput("newPoints", label = "Plot new event data?")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type = "tabs", 
                  tabPanel("Explore", plotOutput("plot"),
                           br(), br(),
                           h4("Table of Recent Brake Events for Service Bay:"),
                           fluidRow(
                             DT::dataTableOutput("table"))
                  ), 
                  tabPanel("Model",
                           br(), br(),
                           "Please enter data points for prediction.  The model will return a classification.", 
                           br(), hr(),
                           fluidRow(
                             column(4,
                                    selectInput("roadType", "Road Type:", choices = c("residential", "main road", "highway")),
                                    numericInput("brakeTime", "Brake Time (sec):", min = 0, max = 120, value = 0, width = 75),
                                    numericInput("brakingDist", "Brake Distance (ft):", min = 0, max = 120, value = 0, width = 75),
                                    numericInput("brakeScore", "Braking Score:", min = 0, max = 400, value = 0, width = 75)),
                             column(4,
                                    numericInput("absEvent", "ABS Event:", min = 0, max = 1, value = 0, width = 75),
                                    numericInput("speed", "Travel Speed:", min = 0, max = 1230, value = 0, width = 75),
                                    numericInput("brakeP20", "Brake Pressure 20%:", min = 0, max = 1, value = 0, width = 75),
                                    numericInput("brakeP40", "Brake Pressure 40%:", min = 0, max = 1, value = 0, width = 75)),
                             column(4,
                                    numericInput("brakeP60", "Brake Pressure 60%:", min = 0, max = 1, value = 0, width = 75),
                                    numericInput("brakeP80", "Brake Pressure 80%:", min = 0, max = 1, value = 0, width = 75),
                                    numericInput("brakeP100", "Brake Pressure 100%:", min = 0, max = 1, value = 0, width = 75))
                           ),
                           br(),br(),
                           actionButton("getPrediction", "Determine Event Class"),
                           verbatimTextOutput("predict")
                  )
                  
      )
    )
  )
)
)
