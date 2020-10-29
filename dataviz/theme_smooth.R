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
### BMB: combination of geom_line and geom_smooth confuses/is confusing
### in conjunction with direct.labels:
### I don't know how it chooses which geom to uses in computing direct
### label positions (but in the examples below it would be choosing the
### (invisible) lines rather than the smooths
### It would be nice to figure out how to do this, but in the past when
### I have wanted labels to appear relative to a smooth rather than relative
### to the (noisier) raw data, I've done it by hand
### I have some (fairly scary) code from a recent project with Harry Shannon
### that demonstrates this if you want to see
###   commenting out (invisible) geom_line() for now ...
    ## + geom_line(alpha=0.0)
        + geom_smooth(alpha=0.1, method="loess", formula=y~x)
        ## add explicit method/formula to suppress messages
        + coord_cartesian(ylim=c(0, 1.5))
        ## leave a bunch of space so we can see the labels (for now)
        + scale_x_continuous(expand=expansion(0.6,0))
	+ scale_fill_brewer(palette = "Dark2")
)

print(base)
try(direct.label(base, method="chull.points"))
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
direct.label(base_point,method="top.qp")

## library(plotly)
## ggplotly(base)
