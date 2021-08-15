
shinyUI(fluidPage(
  title = "Lp-solver",
  titlePanel(title=div(img(src="logo.png",align='right'),"Lp-solver")),
  withMathJax(),
  # Input in sidepanel:
  sidebarPanel(
    numericInput("n0","No of decision variables",min = 1,max=10,value=1),
    numericInput("n1","No of constraints",min=1,max=10,value=1),
    selectInput("obj_type","Select object type",choices = c("Max"="max","Min"="min")),
    textInput("obj_str","Enter Objective Function",placeholder = "sales = 25x1 + 20*x2"),
    checkboxInput("int0","Find only integer solution",value = FALSE),
    uiOutput('consCtrl'),
    
  ),
  
  # Main Panel:
  mainPanel( 
    tabsetPanel(
      tabPanel("Overview",
               includeMarkdown("overview.md")
      ),
      tabPanel("Results",
        
#        verbatimTextOutput('objfn'),
        h5("Solution"),
        verbatimTextOutput('op'),
        hr(),
        h5("Optimum value of objective function is"),
        verbatimTextOutput('op1')

      )
    )
    
  )
)
)




