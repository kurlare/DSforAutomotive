## Data Science for Automotive Lab

This repository contains data and analytic assets for the Data Science for Automotive Lab.  The iPython Notebook is designed to run on IBM Data Science Experience and analyzes the `historical_brake_events.csv` data set.
_________________________

### Getting Started

1.  Head to https://datascience.ibm.com/ and sign up for a free trial.  **Note:  Please use Firefox or Chrome!**

2.  Once you've done that, download the CSV and add it as a 'data asset' to a project on DSX.  This can be the default project or one that you've created and named separately.

3.  Add a notebook as one of your 'Analytics Assets'.  The notebooks are divided into 3 difficulty levels.  If you don't know how to code or have no experience with Python or Spark, the beginner notebook will hold your hand the whole way through and provide most of the answers.  The intermediate notebook provides a few answers to some of the more difficult parts and assumes you are familiar with pySpark and SQL.  The advanced notebook requires the greatest degree of skill and I actually try to stump you once or twice. :D  

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

4.  Work through the Python notebook.

5.  Add the R notebook "Classifying Driver Behavior in R - Example" to your project in the same way you added the lab.  URL:

https://raw.githubusercontent.com/kurlare/DSforAutomotive/master/Classifying%20Driver%20Behavior%20in%20R%20-%20Example.ipynb

See how the analysis is done and the model is saved.  

6.  Check out the Shiny App to see one way that the model can be deployed.

##### Shiny App
*Direct Link:* https://kurlare.shinyapps.io/brakeeventanalyzer/

*To run the Shiny app from RStudio in the cloud on DSX:*  Copy the files in the repo to your RStudio instance on DSX.  Put all the Shiny App files in one folder, open up the server.R and ui.R scripts and make sure the paths to the data files and model are correct, then click the 'Run App' button in the top right corner of the script window.

*To run the Shiny app from RStudio locally:* Clone the repo to your machine and set your working directory to the 'Shiny' folder.  Then open up server.R or ui.R in RStudio and click the 'Run App' button in the top right corner of the script window. 

See [here](http://shiny.rstudio.com/tutorial/) for more details on how to launch Shiny apps in RStudio.

_____________

If you've made it this far, let's review what you've done!

- Signed up for IBM Data Science Experience (DSX), created a project, and populated it with analytics and data assets.
- Used the Apache Spark service built into DSX to analyze the data in Python
- Wrote SQL to display tables in Pandas and visualize data with Pixiedust
- Built a model using SparkML Pipelines and exported it to Object Storage
- Analyzed the data separately in R with dplyr and ggplot2, saving a trained Random Forest model to Object Storage
- Launched and/or explored a Shiny App to see how the trained model can be deployed and score new records

Congrats!  Thank you for participating!

##### Contact Info
Email the author at rafi.kurlansik@ibm.com or reach out on Twitter @kurlare.



