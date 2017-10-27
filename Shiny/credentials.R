
## Install the R4WML library and define your credentials here
## This script is sourced by the Shiny App

## Make sure this is installed 
devtools::install_github(repo = 'IBMDataScience/R4WML')
library(R4WML)

## WML Credentials ##
token_url <- "https://ibm-watson-ml.mybluemix.net/v3/identity/token"
username <- "add username from Bluemix credentials here"
password <- "add password from Bluemix credentials here"

## Get WML token
auth_token <- get_wml_auth_token(token_url, username, password)

## Get authentication headers
wml_url <- "https://ibm-watson-ml.mybluemix.net"
auth_headers <- get_wml_auth_headers(wml_url, username, password)



