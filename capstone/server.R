library(shiny)


source("ngram.R")
ngrams <- function(input){
    # Create a dataframe
    input <- data_frame(text = input)
    # Clean the Inpput
    replace_reg <- "[^[:alpha:][:space:]]*"
    input <- input %>%
        mutate(text = str_replace_all(text, replace_reg, ""))
    # Find word count, separate words, lower case
    input_count <- str_count(input, boundary("word"))
    input_words <- unlist(str_split(input, boundary("word")))
    input_words <- tolower(input_words)
    # Call the matching functions
    out <- ifelse(input_count == 0, "Please input a phrase",
                  ifelse(input_count == 3, quadgram(input_words),
                         ifelse(input_count == 2, trigram(input_words), bigram(input_words))))
    
    # Output
    return(out)
}

shinyServer(function(input, output) {
    
    op<- reactive({ngrams(input$ip)})
    
    output$ngram_output <-renderText({op()})
      
})

