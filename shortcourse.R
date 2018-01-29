library(dplyr)
library(ggplot2); theme_set(theme_bw())
library(ggstance)
Z_to_p <- function(std.err,coef) {
    2*pnorm(coef/std.err,lower.tail=FALSE)
}
p_to_Z <- function(p,coef) {
    abs(coef/qnorm(p/2))
}
Z_to_p(1.85,coef=1)
p_to_Z(Z_to_p(1.85,coef=1),coef=1)

dd <- read.csv("shortcourse_table1.txt") %>%
    rename(variable=Variable.name,coef=Coefficient,
           p_value=P.value) %>%
    select(variable,coef,p_value) %>%
    mutate(std_err=p_to_Z(p_value,coef),
           measure=gsub(".*\\(([^)]+)\\)","\\1",variable),
           variable=gsub("\\([^)]+\\)","",variable),
           variable=reorder(factor(variable),coef)
           )

    
ggplot(dd,aes(coef,variable,colour=measure))+
    geom_pointrangeh(aes(xmin=coef-2*std_err,xmax=coef+2*std_err),
                     position=position_dodgev(height=0.5))+
    labs(subtitle="positive values mean untrained students are better",
         y="",x="coefficient")

