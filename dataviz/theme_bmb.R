library(ggplot2); theme_set(theme_bw())
library(directlabels)
library(colorspace)
library(cowplot)
library(tidyverse)

## lots of good advice from Toby Hocking at https://github.com/tdhock/directlabels/issues/31

source("makestuff/makeRfuns.R") 

callArgs <- "theme_bmb.Rout theme_bmb.R theme_count.rda"
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
## * add weekly-aggregated points? (maybe with horizontal segments to show that the cover a week?)
## * point size by total N in proportional plots?
## * more fussing with box formatting in direct labels: improved leading/margins in plot 3? rounded-corner
##    boxes as in geom_label?
## * define theme categories, facet/distinguish by line type?

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
    + scale_fill_discrete_qualitative()
    + scale_colour_discrete_qualitative()
    + labs(x="Date published", y="number of videos per day")
)

datex <- as.Date("2020-09-02") ## manual date for extending right axis
## it would be good to figure out a more automated method
print(direct.label((base
                   ## expand limits to the right to leave space for labels
                   + expand_limits(x=datex)
                   ## y limits trimmed on top, extended on bottom
                   + coord_cartesian(ylim=c(-0.07, 1.2))
                   + ggtitle("angled boxes")
)
, method=list(fill="white", "angled.boxes")))

## what about horizontal boxes?
horizontal.boxes <- list(fill="white", "far.from.others.borders", rot=0,
                          "calc.boxes", "enlarge.box", "draw.rects")
print(direct.label((base
                   ## expand limits to the right to leave space for labels
                   + expand_limits(x=datex)
                   ## y limits trimmed on top, extended on bottom
                   + coord_cartesian(ylim=c(-0.03, 1.2))
                   + ggtitle("horizontal boxes")
)
, method=horizontal.boxes))

## 
tcd_wraplabs <- (themeCountDaily
    %>% mutate_at("theme",stringr::str_replace, " ","\n")
    %>% mutate_at("theme",stringr::str_replace, "and","&")
)
hbox2 <- list(fill="white"
           , "far.from.others.borders"
           , rot=0
          ,  "calc.boxes"
            ## adjust box enlargement; more flexibility would be nice but ...
           , h=0.6
           , "enlarge.box"
           , "draw.rects")

print(direct.label(((base %+% tcd_wraplabs)
                   ## expand limits to the right to leave space for labels
                   + expand_limits(x=datex)
                   ## y limits trimmed on top, extended on bottom
                   + coord_cartesian(ylim=c(-0.03, 1.2))
                   + ggtitle("horizontal wrapped boxes")
)
, method=hbox2))



base_prop <- (ggplot(themePropDaily)
    + aes(x=published, y=prop, color=theme)
    + scale_fill_discrete_qualitative()
    + scale_colour_discrete_qualitative()
    ## expand limits to the right to leave space for labels
    ## + expand_limits(x=as.Date("2020-11-01"))
    + labs(x="Date published", y="daily proportion of videos")
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

## loess seems OK (all it misses is the blowup of uncertainty
## for the less-frequent categories at the beginning and end)

## restrict range (maybe not worth showing points if we're going to ignore the larger values?
##  show aggregated points instead?

prop_loess_chop <- prop_loess + scale_y_continuous(lim=c(0,0.55), oob=scales::squish)
print(prop_loess_chop + ggtitle("loess proportions, restricted range"))

## this could be combined with the directlabels fanciness from above ...
