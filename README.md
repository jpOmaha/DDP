DDP
===

A popular website for data science competitions is www.kaggle.com
It hosts open competitions with prizes based on final rankings.
It also lists cumulative competitor ratings over a moving window.
Individual competitor X rating = sum of scores from competitions.

Formula for individual competitor X from 1 competition is "scoreX",
which of any X is a nonlinear function of teamSizeX and teamRankX.

IF X submits solo, finishing 1st, THEN at deadline scoreX = 100,000.
What happens with 10 teams when cor(teamSizeX, teamRankX = -1.0,
and we vary teamSizeX or teamRankX?
