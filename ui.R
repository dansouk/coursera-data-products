library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Loan Application Pre-screening"),

    # Sidebar
    sidebarLayout(
        sidebarPanel(
            numericInput("income", "Monthly income", 0)
            , numericInput("loanamount", "Loan amount", 0)
            , numericInput("repaymentperiod", "Repayment period (months)", 12, 60, step = 6)
            , numericInput("otherdebt", "Total monthly payments on other debts", 0)
            , numericInput("currentchkbal", "What is the approximate current balance of your checking account?", 0)
            , checkboxInput("overdrawn", "Has your checking account been overdrawn in the last year?", value = FALSE)
            , checkboxInput("everdefault", "Have you ever defaulted on any debt in the last two years?", value = FALSE)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tags$p("This app provides the ability to quickly screen a loan applicant.
                     Enter and/or adjust responses to the questions to see if an application is likely to be approved.")
            , tags$br()
            , tags$br()
            , textOutput("app_status")
        )
    )
)
)
