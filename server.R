
library(shiny)
library(stringr)
library(tm)
library(shinythemes)
library(markdown)
library(stylo)

#setwd("C:/Users/Peesonal/Documents/Dette/Coursera/Capstone/Project/nextwordprediction")

bi_data <- readRDS(file="./data/bigram.RData")
tri_data <- readRDS(file="./data/trigram.RData")
quad_data <- readRDS(file="./data/quadgram.RData")


shinyServer(function(input, output){
    
    predtext <- reactive({
        
        if (input$text=="") return("Enter a word or phrase to predict...")
        
        text <- input$text
        text1 <- removeNumbers(removePunctuation(tolower(text)))
        text1 <- stripWhitespace(str_replace_all(text1,"[^[:alnum:]]", " "))
        text1 <- txt.to.words.ext(text1, language="English.all", preserve.case = TRUE)
        textlen <- length(text1)
        
        if (textlen>=3) {text2 <- text1[(textlen-2):textlen] }
        else if(textlen==2) {text2 <- c(NA,text1)}
        else {text2 <- c(NA,NA,text1)}
        
        predtext <- as.character(quad_data[quad_data$word1==text2[1] & 
                                               quad_data$word2==text2[2] & quad_data$word3==text2[3],][1,]$word4)
        if(is.na(predtext)) {
            wordPrediction <- as.character(tri_data[tri_data$word1==text2[2] & 
                                                        tri_data$word2==text2[3],][1,]$word3)
            if(is.na(predtext)) {
                predtext <- as.character(bi_data[bi_data$word1==text2[3],][1,]$word2)
            }
        }
        return(predtext)
    })
    
    output$predword <- renderPrint(predtext())
    output$giventext <- renderText({ input$text }, quoted = FALSE)
    
})