## https://cran.r-project.org/web/packages/googlesheets/vignettes/basic-usage.html

days <- c("Mon","Tues","Weds","Thurs","Fri")
slots <- sprintf("%s:30",c(9:12,1:4))
all_slots <- apply(expand.grid(slots=slots,days=days)[c("days","slots")],
      1,paste,collapse=" ")

print(all_slots)

x <- as.data.frame(matrix(
	NA, nrow=length(all_slots), ncol=1
	, dimnames=list(slot=all_slots, ID="dushoff")
))

write.csv(x, csvname)
