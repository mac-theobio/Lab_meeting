library(ggplot2); theme_set(theme_bw())
library(directlabels)
library(RColorBrewer)

source("makestuff/makeRfuns.R") 

makeGraphics()

commandEnvironments()

summary(themeCountDaily)

print(ggplot(themeCountDaily)
	+ aes(x=published, y=n, color=theme)
	## + geom_point()
	+ geom_smooth(alpha=0.1)
	+ coord_cartesian(ylim=c(0, 1.5))
	+ scale_fill_brewer(palette = "Dark2")
)

direct.label(ggplot(themeCountDaily)
	+ aes(x=published, y=n, color=theme)
	+ geom_line(alpha=0.0)
	+ stat_smooth(alpha=0.1)
	+ coord_cartesian(ylim=c(0, 1.5))
	+ scale_fill_brewer(palette = "Dark2")
)

