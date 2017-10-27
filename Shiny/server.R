#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  library(DT)
  library(shiny)
  library(data.table)
  library(ggplot2)
  library(randomForest)
  library(jsonlite)
  
  source("credentials.R")
  
  ## load data and model
  newEventsDF <- read.csv("new_brake_events.csv")
  oldEventsDF <- read.csv("historical_brake_events.csv")
  
  brakeEventModel <- readRDS(file = "brakeEventModel.rds")
  
  ## Define scoring endpoint for WML
  scoring_url <- "add scoring endpoint URL here"
    
  ## Render plot and conditional statement for new points
  output$plot <- renderPlot({
    if(input$newPoints == F){
      ggplot(oldEventsDF, aes_string(x=input$xvar, y=input$yvar)) + 
        geom_point(aes(color = road_type, shape = road_type), size = 2) +
        theme_minimal()
    } else
      ggplot(oldEventsDF, aes_string(x=input$xvar, y=input$yvar)) + 
      geom_point(aes(color = road_type, shape = road_type), size = 2) +
      geom_point(data = newEventsDF, aes_string(x = input$xvar, y = input$yvar), size = 4, shape = 8) +
      theme_minimal()
    
  })
  
  ## Render table with new records
  output$table <- DT::renderDataTable(DT::datatable({
    
    data <- newEventsDF[, c("VIN", "brake_time_sec", "brake_distance_ft",
                            "road_type", "travel_speed", "abs_event", "braking_score")]
    
    data
    
  }))
  
  ## Get predictions based on user input
  toPredictR <- eventReactive(input$getPrediction,{
    
    toPredictDF <- data.frame(
      brake_time_sec = input$brakeTime,
      brake_distance_ft = input$brakingDist,
      road_type = as.factor(input$roadType),
      braking_score = input$brakeScore,
      brake_pressure20pct = input$brakeP20,
      brake_pressure40pct = input$brakeP40,
      brake_pressure60pct = input$brakeP60,
      brake_pressure80pct = input$brakeP80,
      brake_pressure100pct = input$brakeP100,
      abs_event = input$absEvent,
      travel_speed = input$speed)
    
    levels(toPredictDF$road_type) <- c("residential", "highway", "main road")
    
    prediction <- predict(brakeEventModel, toPredictDF)
    
    prediction
    
  })
  
  ## Reactive output for WML
  toPredictWML <- eventReactive(input$getPrediction,{
    
    toPredictDF <- data.frame(
      brake_time_sec = input$brakeTime,
      brake_distance_ft = input$brakingDist,
      road_type = as.factor(input$roadType),
      braking_score = input$brakeScore,
      brake_pressure20pct = input$brakeP20,
      brake_pressure40pct = input$brakeP40,
      brake_pressure60pct = input$brakeP60,
      brake_pressure80pct = input$brakeP80,
      brake_pressure100pct = input$brakeP100,
      abs_event = input$absEvent,
      travel_speed = input$speed)
    
    levels(toPredictDF$road_type) <- c("residential", "highway", "main road")
    
    ## Convert dataframe to WML payload
    scoringSample <- to_wml_payload(toPredictDF)
    
    ## Send payload to WML
    results <- wml_score(scoring_url, auth_headers, payload = scoringSample)
    
    ## Convert API response to DataFrame
    resultsDF <- from_wml_payload(results)
    
    toJSON(results)
    
  })
  
  ## Render the prediction in the UI
  output$predict <- renderPrint({
    toPredictR()
    
  })
  
  ## Render WML results
  output$predictWML <- renderPrint({
    toPredictWML()
  })
  
})
