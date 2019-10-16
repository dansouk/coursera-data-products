library(shiny)

# Define server logic required to compute approval likelihood
shinyServer(function(input, output) {

    output$app_status <- renderText({

        # Calculate 'score' using a simple multiple regression model
        score = 0
        
        if (input$income == 0)
            rate = 0
        else
            rate = (((input$otherdebt * 12) + input$loanamount) / (input$income * 12))

        if (rate > 0)
        {
            if (rate < .5)
                score = score + 25 #InstallmentRatePercentage
            if (rate < .4)
                score = score + 15
            if (rate < .3)
                score = score + 10
            if (input$repaymentperiod > 60)
                score = score - 10
            if (input$overdrawn)
                score = score - 5
            if (input$everdefault)
                score = score - 10
            if (input$currentchkbal > 0)
                score = score + 5
            if (input$currentchkbal > 100)
                score = score + 5
            if (input$currentchkbal > 500)
                score = score + 5
            if (input$currentchkbal > 1000)
                score = score + 10
            
            score = score * 10
        }
        
        if (score <= 0)
        {
            score = 0
            msg = ''
        }
        else
        {
            if (score < 500)
                msg = "This loan is not likely to be approved"
            
            if (score >= 500 & score < 750)
                msg = "This loan is likely to be approved, but not gauranteed"
    
            if (score >= 750)
                msg = "This loan is very likely to be approved, but not gauranteed"
        }
        
        return(msg)
    })

})
