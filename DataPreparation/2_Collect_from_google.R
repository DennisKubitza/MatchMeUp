### This script scrapes all connections in distances_relevant from google maps
### UPDATE THE TIMESTAMP BEFORE EXECUTION and ADD API TOKEN (Mykey)!!!!


library(jsonlite)
library(RCurl)

mykey <- ""



googleurl <- function(key=mykey, return.call = "json", origin="50.74021,7.12322", destination="50.70624 7.13778", mode="transit") {
  root <- "https://maps.googleapis.com/maps/api/distancematrix/"
  u <- paste(root, return.call, "?origins=", origin, "&destinations=", destination,"&units=metric" ,"&mode=",mode,"&key=", mykey, sep = "","&departure_time=1705906800")
  return(URLencode(u))
}

query<-jsonlite::fromJSON(url(googleurl()))

query<-jsonlite::fromJSON(url(googleurl(mode = "DRIVING")))

distances_backup <- distances_relevant
distances_relevant$commuting_nov <- 0
distances_relevant$driving_nov <- 0

#distances_relevant<-distances_relevant[1:15,]

for(i in 1:nrow(distances_relevant))
{
  origins <- paste(st_coordinates(distances_relevant$geometry...2)[i,2:1], collapse=",")
  destinations <-  paste(st_coordinates(distances_relevant$geometry...5)[i,2:1], collapse=",")
  if(i %% 1000 == 0) 
    {
    print(i)
  }
  query<-jsonlite::fromJSON(url(googleurl(origin=origins, destination = destinations)))
  if( query$rows$elements[[1]]$status == "ZERO_RESULTS" )
  {
    minutes <- Inf
  }
  else
  {
    
    minutes <- query$rows$elements[[1]]$duration$value/60
  } 
  distances_relevant$commuting_nov[i] <- minutes
}

save(distances_relevant, file="distances_AB_with_times_november.Rdata")
##########################################


for(i in 1:nrow(distances_relevant))
{
  origins <- paste(st_coordinates(distances_relevant$geometry...2)[i,2:1], collapse=",")
  destinations <-  paste(st_coordinates(distances_relevant$geometry...5)[i,2:1], collapse=",")
  if(i %% 1000 == 0) 
  {
    print(i)
  }
  query<-jsonlite::fromJSON(url(googleurl(origin=origins, destination = destinations, mode="DRIVING")))
  if( query$rows$elements[[1]]$status == "ZERO_RESULTS" )
  {
    minutes <- Inf
  }
  else
  {
    
    minutes <- query$rows$elements[[1]]$duration_in_traffic$value/60
  } 
  distances_relevant$driving_nov[i] <- minutes
}


save(distances_relevant, file="distances_AB_2023.Rdata")


