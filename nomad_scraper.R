# Scraper for digital nomads
library(rvest)
library(stringr)

#nomadResult <- data.frame(Country = character(), City = character(), People = numeric(), stringsAsFactors=FALSE)

scrapeNomadList <- function(url, filename){
  
  nomadResult <- data.frame(Slug = character(), People = numeric(), stringsAsFactors=FALSE)
  data <- read_html(url)
  
  resultsTable <- data %>% html_nodes("div.grid.show.view")
  rows <- resultsTable %>% html_nodes("div.item.show")
  #for(i in 1:length(rows)){
  for(i in 1:3){
    slug <- html_attr(rows[i], "data-slug")
    print(slug)
    peopleCount <- getCityDetails(slug)
    result <- c(slug, peopleCount)
    nomadResult[nrow(nomadResult)+1,] <- result
  }
  
  #http://bl.ocks.org/phil-pedruco/7745589
  #https://www.toptal.com/javascript/a-map-to-perfection-using-d3-js-to-make-beautiful-web-maps
  #var itemCoords=[["berlin-germany","Berlin","52.5200066","13.404954",5],["ubud-bali-indonesia","Ubud","-8.519268","115.263298",5],["hoi-an-vietnam","Hoi An","15.8800584","108.3380469",5]
  write.table(nomadResult, filename, row.names=F, na="NA",append=F, quote= FALSE, sep=",", col.names=T)
}

##https://nomadlist.com/berlin-germany/people
getCityDetails <- function(slug){
  url <- paste("http://nomadlist.com", slug, "people", sep = "/")
  data <- read_html(url)  
  lis <- data %>% html_nodes("div.tabs") %>% html_nodes("li") 
  for(i in 1:length(lis)){
    if(html_attr(lis[i], "data-tab") == "people"){
      people <- lis[i] %>% html_nodes("span")
      people <- str_extract_all(people,"\\(?[0-9,.]+\\)?")[[1]]
      people <- gsub('\\(', '', gsub(')', '', people))
      return(people)
    }
  }
}

#Main start
url <- "http://nomadlist.com"
filename <- "data/nomadcities.csv"
scrapeNomadList(url, filename)