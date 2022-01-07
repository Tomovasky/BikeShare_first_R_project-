# Load the Data
ny = read.csv('new-york-city.csv')
chi = read.csv('chicago.csv')

#Now I add a city col, so that when I combined the data I can still figure out 
#what city is still used. 
ny$city <-"ny"
chi$city <- "chi"

#As I want all the date accessed at once, I will combined it into one dataset.  
ny_chi_collection <- rbind(ny,chi)


#Function to change Birth.Year to Age for reliability. 
birth_year_to_age <- function(data){
  names(data)[names(data)=='Birth.Year'] <-'Age'
  data$Age <- 2020-data$Age
  return(data)
}

#Let's change ny,cites, and chi Birth.Year to Age.
# ** did not change wash as it has not Birth.Year data provided. 
ny_chi_collection <- birth_year_to_age(ny_chi_collection)


#Save ny_chi_collection to an csv file 

write.csv2(ny_chi_collection,"ny_chi_collection.csv", row.names = TRUE)