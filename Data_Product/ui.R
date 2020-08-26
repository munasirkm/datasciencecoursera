library(shiny)

shinyUI(fluidPage(

 
    titlePanel("Expected miles per gallon"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("hp",
                        "Horse Power:",
                        min = 50,
                        max = 350,
                        value = 70),
            sliderInput("dsp",
                        "Displacement in cubic inch",
                        min=70,
                        max=500,
                        value=100),
            numericInput("wg",
                        "Weight in 1000lbs",
                        min=1.000,
                        max=6.000,
                        step = 0.001,
                        value=1.630),
            sliderInput("cld",
                          "no.of cylinders",
                          min=4,
                        max=8,
                        value = 4),
            submitButton("submit")
        ),
    
    
        
        mainPanel(
            tabsetPanel(
            tabPanel("Output",
                     p(h5("Expected miles per gallon:")),textOutput("mpl"), 
                     
                    ),
            
            tabPanel("Documentation",
                     p(h4("Miles per gallon predictor")),
                     helpText("This Application uses linear model trained on a dataset to predict the mileage expected based on the parameters you've entered"),
                     p(h5("fitting linear model")),
                     helpText("We have created a multivariate linear model from mtcars dataset on variable names mpg,hp,disp,cyl,wt"),
                    strong("lm(mpg~hp+disp+wt+cyl,data=mtcars)"),
                    p(helpText("from  the coefficiants of above model we calculate mpg as:")),
                    strong("mpg=intercept+(coeff_hp*hp)+(coeff_disp*disp)+(coeff_wt*wt)+(coeff_cyl*cyl)")
                     ))
                )
    )))
