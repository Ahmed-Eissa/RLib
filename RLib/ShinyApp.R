
#-------------------------------------------------------------------------------------------------
#-- Shiny  (https://www.shinyapps.io/admin/#/dashboard  sign using google)
#-------------------------------------------------------------------------------------------------


install.packages('rsconnect')
#-- Authorize
rsconnect::setAccountInfo(name = 'ahmedeissa', token = '52528B2F931DCB920412D116BF57193C', secret = '5Dz2RC7yP7FckXaG4jelPHHBNn3ED+6j0SV8ulGM')
#-- Deploy
library(rsconnect)
rsconnect::deployApp('path/to/your/app')