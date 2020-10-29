library(dplyr)
library(tidyr)

source("makestuff/makeRfuns.R") 

themeDate <- csvRead()

summary(themeDate)

themeCountDaily <- (themeDate
	%>% select(published, theme)
	%>% group_by(published, theme)
	%>% tally
	%>% ungroup
	%>% complete(published, theme
		, fill = list(n=0)
	)
)

saveVars(themeCountDaily)

