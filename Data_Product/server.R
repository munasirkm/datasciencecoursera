

library(shiny)

shinyServer(function(input, output) {
  tata<-subset(mtcars,select=c(mpg,hp,disp,cyl,wt))
  m<-lm(mpg~hp+wt+disp+cyl,data=tata)
    
           mpl_t<-
             reactive({
             (40.82+(-0.0205*input$hp)+(-3.8539*input$wg)+(0.0116*input$dsp)+(-1.29332*input$cld))
                })
           output$mpl<-renderText({  paste("miles Per Gallon Expected: =",mpl_t())
                            })

        
       

    })
