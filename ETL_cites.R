#confirm the right working directory

# Load the Data
ny = read.csv('new-york-city.csv', na.strings = (c("", "NA")))
wash = read.csv('washington.csv',na.strings = (c("", "NA")))
chi = read.csv('chicago.csv',na.strings = (c("", "NA")))

#Before I can do analyse I will have to do a little data cleaning. 
#Add missing col. to Wash with NA set as the value. 
wash$Gender <-NA 
wash$Birth.Year <- NA

#Now I add a city col, so that when I combined the data I can still figure out 
#what city is still used. 
ny$city <-"ny"
wash$city <- "wash"
chi$city <- "chi"

#As I want all the date accessed at once, I will combined it into one dataset.  
cites <- rbind(ny,wash)
cites <- rbind(cites,chi)

#Function to change Birth.Year to Age for reliability. 
birth_year_to_age <- function(data){
  names(data)[names(data)=='Birth.Year'] <-'Age'
  data$Age <- 2020-data$Age
  return(data)
}

#Let's change ny,cites, and chi Birth.Year to Age.
# ** did not change wash as it has not Birth.Year data provided. 
cites <- birth_year_to_age(cites)


#Duration is in seconds for easier evaluating lets change to min. 
convert_to_min <- function(data){
  data$Trip.Duration <- data$Trip.Duration/60
  return(data)
}

cites <- convert_to_min(cites)


#Save cites to an csv file 

write.csv(cites,"cites.csv", row.names = TRUE)