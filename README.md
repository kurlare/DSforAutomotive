## Data Science for Automotive Lab

This repository contains data and analytic assets for the Data Science for Automotive Lab.  The iPython Notebook is designed to run on IBM Data Science Experience and analyzes the `historical_brake_events.csv` data set.

### Getting Started

Download the CSV and add it as a 'data asset' in your project on DSX.

To access the lab you can create a new notebook in DSX from a file or URL.  

#### From File:  
Download the file and select 'From File' when creating a new notebook in your project.

#### From URL:
Select 'From URL' when creating a new notebook in your project and paste the following URL into the URL Address field:

https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/DS%20for%20Automotive%20Lab_%20Classifying%20Brake%20Events.ipynb

#### Shiny App
Direct Link: https://kurlare.shinyapps.io/brakeeventanalyzer/

To run the Shiny app from RStudio in the cloud on DSX:  Copy the files in the repo to your RStudio instance on DSX.  Put all the Shiny App files in one folder, open up the server.R and ui.R scripts and make sure the paths to the data files and model are correct, then click the 'Run App' button in the top right corner of the script window.

To run the Shiny app from RStudio locally: Clone the repo to your machine and set your working directory to the 'Shiny' folder.  Then open up server.R or ui.R in RStudio and click the 'Run App' button in the top right corner of the script window. 

See [here](http://shiny.rstudio.com/tutorial/) for more details on how to launch Shiny apps in RStudio.


