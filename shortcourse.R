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

    
ggplot(dd,aes(coef,variable,colour=measure,shape=measure))+
    geom_pointrangeh(aes(xmin=coef-2*std_err,xmax=coef+2*std_err),
                     position=position_dodgev(height=0.5))+
    geom_vline(xintercept=0,lty=2)+
    annotate("text",x=2,y=5,label="untrained students are better")+
    annotate("text",x=-2,y=5,label="trained students are better")+
    labs(y="",x="coefficient")+
    scale_colour_brewer(palette="Dark2")
ggsave("shortcourse.pdf",width=12,height=10)
