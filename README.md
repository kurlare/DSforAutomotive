## Data Science for Automotive Lab

This repository contains data and analytic assets for the Data Science for Automotive Lab.  The iPython Notebook is designed to run on IBM Data Science Experience and analyzes the `historical_brake_events.csv` data set.
_________________________

### Getting Started

Download the CSV and add it as a 'data asset' in your project on DSX.  

The notebooks are divided into 3 difficulty levels.  If you don't know how to code or have no experience with Python or Spark, the beginner notebook will hold your hand the whole way through and provide most of the answers.  The intermediate notebook provides a few answers to some of the more difficult parts and assumes you are familiar with pySpark and SQL.  The advanced notebook requires the greatest degree of skill and I actually try to stump you once or twice. :D  

To access the lab you can create a new notebook in DSX from a file or URL.  

##### From File:  
Download the file and select 'From File' when creating a new notebook in your project.

##### From URL:
Select 'From URL' when creating a new notebook in your project and paste the following URL into the URL Address field:

**Beginner**

https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/DS%20for%20Automotive_%20Beginner.ipynb

**Intermediate**

https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/DS%20for%20Automotive_%20Intermediate.ipynb

**Advanced**

https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/DS%20for%20Automotive_%20%20Advanced.ipynb

**Original (keeping this so some things don't break for folks)**
https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/DS%20for%20Automotive%20Lab_%20Classifying%20Brake%20Events.ipynb

________________

#### Shiny App
*Direct Link:* https://kurlare.shinyapps.io/brakeeventanalyzer/

*To run the Shiny app from RStudio in the cloud on DSX:*  Copy the files in the repo to your RStudio instance on DSX.  Put all the Shiny App files in one folder, open up the server.R and ui.R scripts and make sure the paths to the data files and model are correct, then click the 'Run App' button in the top right corner of the script window.

*To run the Shiny app from RStudio locally:* Clone the repo to your machine and set your working directory to the 'Shiny' folder.  Then open up server.R or ui.R in RStudio and click the 'Run App' button in the top right corner of the script window. 

See [here](http://shiny.rstudio.com/tutorial/) for more details on how to launch Shiny apps in RStudio.

##### Contact Info
Email the author at rafi.kurlansik@ibm.com or reach out on Twitter @kurlare.



