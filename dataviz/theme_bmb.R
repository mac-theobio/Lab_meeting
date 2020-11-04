library(ggplot2); theme_set(theme_bw())
library(directlabels)
## devtools::load_all("~/R/pkgs/directlabels")
library(colorspace)
library(cowplot)
library(RColorBrewer)
library(tidyverse)

source("makestuff/makeRfuns.R") 

## callArgs Only works interactively and is target-dependent
callArgs <- "theme_smooth.Rout theme_smooth.R theme_count.rda"
startGraphics()

commandEnvironments()

## FIXME: this should go upstream
themePropDaily <- (themeCountDaily
    %>% group_by(published)
    %>% mutate(ntot=sum(n),
               prop=n/ntot)
    %>% ungroup()
)




## TODO
## * add weekly-aggregated points?
## * multinomial version (smoothing); smooth stacked plot?
## * consider different kinds of smoothing
##    * loess gives reasonable smooth type, but doesn't respect zero boundary
##    * gam() is good for boundaries and appropriate weighting (e.g. binomial models),
##      but seems 'too' smooth (even with formula=y~s(x,k=20), etc.)
##    * use glm() with splines::ns() ?

base <- (ggplot(themeCountDaily)
    + aes(x=published, y=n, color=theme)
    + geom_smooth(alpha=0.1,
                  ## alternate choices:
                  ## method="gam",
                  ## method.args=list(family=quasipoisson
                  ## method="REML"),
                  ## formula=y~s(x,k=50))
                  method="loess",
                  formula=y~x,
                  aes(fill=theme))
    + scale_y_continuous(limits=c(0,NA), oob=scales::squish)
    + coord_cartesian(ylim=c(0, 1.2))
    + scale_fill_discrete_qualitative()
    + scale_colour_discrete_qualitative()
    ## expand limits to the right to leave space for labels
    ## + expand_limits(x=as.Date("2020-11-01"))
    + labs(x="Date published", y="number of videos per day")
)

print(direct.label(base, method=list(fill="white", "angled.boxes")))

base_prop <- (ggplot(themePropDaily)
    + aes(x=published, y=prop, color=theme)
    + scale_fill_discrete_qualitative()
    + scale_colour_discrete_qualitative()
    ## expand limits to the right to leave space for labels
    ## + expand_limits(x=as.Date("2020-11-01"))
    + labs(x="Date published", y="number of videos per day")
)

prop_gam <- (base_prop
    + geom_smooth(alpha=0.1,
                  method="gam",
                  formula=y~s(x,k=20),
                  aes(weight=ntot,fill=theme),
                  method.args=list(family=quasibinomial))
    ## geom_point() must be *after* geom_smooth to avoid messing up direct labels pos
    + geom_point(alpha=0.4)
)

prop_loess <- (base_prop
    + geom_smooth(alpha=0.1,
                  method="loess",
                  formula=y~x,
                  aes(weight=ntot) ## don't know whether loess respects weights?
                  )
    ## geom_point() must be *after* geom_smooth to avoid messing up direct labels pos
    + geom_point(alpha=0.4)
)

## these are easier to compare side-by-side (with plot_grid) but it's hard to get the
## aspect ratio right in a make-y environment without going full Rmarkdown

print(prop_gam + ggtitle("gam proportions"))
print(prop_loess + scale_y_continuous(lim=c(0,NA), oob=scales::squish) + ggtitle("loess proportions"))

## loess doesn't seem too bad/misrepresentative (all it misses is the blowup of uncertainty
## for the less-frequent categories at the beginning and end)

## restrict range (maybe not worth showing points if we're going to ignore the larger values?
##  show aggregated points instead?

prop_loess_chop <- prop_loess + scale_y_continuous(lim=c(0,0.55), oob=scales::squish)
print(prop_loess_chop + ggtitle("loess restricted range"))

## the same problem with boxes
print(direct.label(prop_loess_chop, method=list(fill="white", "angled.boxes")))

## can we suppress rotation? do we want to?
