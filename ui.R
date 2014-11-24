# setwd("~/Documents/JHU/C9DDP/kaggleBaseCase")
library(shiny) # > runApp()
shinyUI(pageWithSidebar(
  headerPanel("Competitor Score"),
  sidebarPanel(
    selectInput("variable", "Variable:",
                list("teamSizeX" = "teamSizeX", 
                     "teamRankX" = "teamRankX")
                )
    ),
  mainPanel(
    h3(textOutput("caption")),
    HTML("<p>A popular website for data science competitions is www.kaggle.com
It hosts open competitions with prizes based on final rankings.
It also lists cumulative competitor ratings over a moving window.
Individual competitor X rating = sum of scores from competitions.</p>

<p>Formula for individual competitor X from 1 competition is \"scoreX\",
which of any X is a nonlinear function of teamSizeX and teamRankX.</p>

<p><strong>IF</strong> X submits solo, finishing 1st, <strong>THEN</strong> at deadline scoreX = 100,000.
What happens with 10 teams when cor(teamSizeX, teamRankX = -1.0,
and we vary teamSizeX or teamRankX?</p>"),
    plotOutput("scoreXPlot")
  )
))