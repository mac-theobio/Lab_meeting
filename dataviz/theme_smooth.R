library(ggplot2); theme_set(theme_bw())
library(directlabels)
library(RColorBrewer)

source("makestuff/makeRfuns.R") 

## callArgs Only works interactively and is target-dependent
callArgs <- "theme_smooth.Rout theme_smooth.R theme_count.rda"
if (!interactive()) makeGraphics()

commandEnvironments()

summary(themeCountDaily)

base <- (ggplot(themeCountDaily)
	+ aes(x=published, y=n, color=theme)
	+ geom_smooth(alpha=0.1, method="loess", formula=y~x)
	+ coord_cartesian(ylim=c(0, 1.5))
	+ scale_fill_brewer(palette = "Dark2")
)

print(base)

## assign so we don't try to print (try()  won't catch it)
try(dd <- direct.label(base, method="chull.points"))
## error: "data must have a column named x"
## debug(directlabels:::check.for.columns)
## at some point check.for.columns() gets passed a data frame
## with names
##   {i1,i2,x1,y1,x2,y2}
## not sure where ... ?
direct.label(base,method="last.bumpup")

## BMB: I think basic problem is that chull.points is
## designed for 'scatterplots'; not sure how relevant this is,
## but I think we'll have better luck with the methods listed
## here under 'lineplot':
##  http://directlabels.r-forge.r-project.org/docs/index.html
try(print(base + geom_dl(stat="smooth", method="chull.points")))
## unused argument (alist())

lineplot_methods <- c("angled.boxes","first.bumpup","first.points","first.polygons","first.qp","lasso.labels","last.bumpup","last.points","last.polygons","last.qp","lines2","maxvar.points","maxvar.qp")

lineplot_methods <- setdiff(lineplot_methods, "lines2") ## need 2 groups

pp <- list()
for (m in lineplot_methods) {
    pp[[m]] <- direct.label(base,method=m)+ggtitle(m)
}
cowplot::plot_grid(plotlist=pp)

## I would have expect this to work but it doesn't ... don't know
## all of the internal magic of directlabels (and it's not super
## well-documented ...

base_point <- (ggplot(themeCountDaily)
    + aes(x=published, y=n, color=theme)
    + geom_point())
try(junk <-direct.label(base_point,method="top.qp"))

## library(plotly)
## ggplotly(base)

sessionInfo()
