#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("bins",
                        "Number of bins:",
                        min = 1,
                        max = 100,
                        value = 30),
            tags$p("This is a simple UI to demonstrate how a basic histogram can help uncover patterns in data. 
                   Simply adjust the slider bar to change the number of bins (groups). 
                   Notice that data appears to cluster around 50 and 80 minutes for all but the fewest number of bins.")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot")
        )
    )
)
)
