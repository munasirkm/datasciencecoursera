
library(shiny)
shinyUI(fluidPage(

    titlePanel("Word Guess"),

    sidebarLayout(
        sidebarPanel(
            p(h4("The slide Deck")),
            tags$a(href= "https://rpubs.com/munasirkm/text","Presentation"),
            p(h4("Instructions")),
            helpText("Enter the words in the box and press submit"),
            helpText("This App supports only English Language"),
            helpText("Get more details from above presentaion or Documents Tab")
        ),

        mainPanel(
            
            tabsetPanel(
                tabPanel("Predict",
                    textInput("ip",h3("Type Here"),value=""),
                    h3("Next word Expected is:"),
                    h4(em(span(textOutput("ngram_output")))),
                    submitButton("Submit")
                         ),
                tabPanel("Documentation",
                         p(h4("Word Guess")),
                         helpText("This is application for predicting next word likely to occur based on previous words in the sequence.This project is done as a part of Data Science specialisation Capstone project"),
                         p(h5("Roadmap to this project")),
                         helpText("Model for the Prediction is made using the dataset from Swiftkey"),
                         tags$a(href="https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip","Corsera-Swiftkey DataSet"),
                         helpText("This dataset contains 3 set of text data news,blogs and twitter data in English,German,French and Russian languages"),
                         helpText("Clening ang Processing the data in English language we have made an N-gram model which we have used in this Final Product")
                         )
                       )
                     )
                    )
                 )
)
