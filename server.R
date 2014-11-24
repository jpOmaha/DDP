# setwd("~/Documents/JHU/C9DDP/kaggleBaseCase")
require(shiny)   # runApp() # shinyapps::deployApp('path/to/your/app')
#
# A popular website for data science competitions is www.kaggle.com
# It hosts open competitions with prizes based on final rankings.
# It also lists cumulative competitor ratings over a moving window.
# Individual competitor X rating = sum of scores from competitions.
#
# Formula for individual competitor X from 1 competition is "scoreX",
# which for each X is a nonlinear function of teamSizeX and teamRankX.
#
# IF X submits solo, finishing 1st, THEN at deadline scoreX = 100,000.
# What happens with 10 teams when cor(teamSizeX, teamRankX = -1.0,
# and we vary teamSizeX or teamRankX?
#
base <- 100000 #Constant starting score, fixed by Kaggle
window <- 2 #Sliding window, in years
teams <- 10 # Variable
teamSizeX <- c(1:10) # Variable
teamRankX <- c(10:1) # Variable
lapse <- 0 # Variable
rankExpo <- -0.75 #Fixed by Kaggle
options(scipen=999) # To avoid scientific notation
(scoreX <- (base/teamSizeX) * (teamRankX^rankExpo) * log(teams, 10) * ((window - lapse) / window))
# 
teamSizeX <- factor(teamSizeX)
teamRankX <- factor(teamRankX)
shinyServer(function(input, output) {
  formulaText <- reactive({
    paste("scoreX ~", input$variable)
  })
  output$caption <- renderText({
    formulaText()
  })
  output$scoreXPlot <- renderPlot({
       plot(as.formula(formulaText()), )
  })
})
