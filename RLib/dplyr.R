#------------------------------------------------------------------------------------------
#-- Learn dplyr
#-- it is a package for data manipulation
#-- it contains the following verbs  Filter, Select, arrange, mutate and summary
#-- also it has join
#------------------------------------------------------------------------------------------

install.packages("hflights")
#-- Loading packages
require("dplyr")
require("hflights")

#-- Data
#-- convert dataframe to local dataframe (it print better)
str(hflights)
flights = tbl_df(hflights)


#1- Filter
#-----------------------------------------------------------
#-- normal way
flights[flights$Month == 1 & flights$DayofMonth == 1,]

#-- dplyr way
filter(flights, Month == 1 & DayofMonth == 1)
#- You can use the boolean operators (e.g. >, <, >=, <=, !=, %in%) to create the logical tests
filter(flights, Origin %in% c( "DFW" , "IAH" ))
#-

#2- Select
#-------------------------------------------------------------
select(flights, Year, Month, ArrTime)

#- select all the columns except a specific column, use the “-“
select(flights, -Year)

#- To select a range of columns by name, use the “:” (colon) operator
select(flights, DepTime:TailNum)

#- To select all columns that start with the character string “Da”, use the function starts_with()
#- you have also ends_with(), contains(), one_of() 
select(flights, starts_with("Da"))


#3- arrange
#-------------------------------------------------------------------
arrange(flights, Year, DayOfWeek)
#- using desc() function
arrange(flights, Year, desc(DayOfWeek))


#4- mutate - to create a new column
#------------------------------------------------------------------
mutate(flights, xyz = Year + 5)
select(mutate(flights, xyz = Year + 5), xyz)
#- You can add many new columns using mutate (separated by commas).
mutate(flights, xyz = Year + 5, m5 = Month + 2)


#5- summarise - create a summary
#------------------------------------------------------------------

#- The summarise() function will create summary statistics for a given column
#  in the data frame such as finding the mean
#  There are many other summary statistics you could consider such sd(), min(), max(), median(), sum(),
#  n() (returns the length of vector), 
#  first() (returns first value in vector), last() (returns last value in vector) 
#  and n_distinct() (number of distinct values in vector).
summarise(flights, n())
summarise(flights, n_distinct(UniqueCarrier))



#6- Pipe operator: %>%
#--------------------------------------------------------------------
# his operator allows you to pipe the output from one function to the input of another function.

#7- group_by
#--------------------------------------------------------------------
flights %>% group_by(DayofMonth) %>% summarise(n())
flights %>% group_by(DayofMonth) %>% summarise(max(FlightNum), min(FlightNum))



#8- Joins
#--------------------------------------------------------------------

inner_join
left_join
semi_join

select(mutate(flights, x = lag(DayofMonth)), x, DayofMonth)