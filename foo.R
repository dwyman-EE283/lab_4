library("optparse")
library("readr")
library("ggplot2")

main <- function() {

    opts <- parse_options()
    print(opts$infile)
    print(opts$outfile)
    diamonds <- read.csv(opts$infile, header = TRUE)

    plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + geom_bar() +
                            theme(axis.text.x = element_text(angle=70, vjust=0.5))
    ggsave(opts$outfile,device="pdf")
    
}

parse_options <- function() {

    option_list <- list(
        make_option(c("--infile"), action = "store", dest = "infile",
                    default = NULL, help = "Input file"),
        make_option(c("--outfile"), action = "store", dest = "outfile",
                    default = NULL, help = "Output file"))

    opt <- parse_args(OptionParser(option_list=option_list))
    return(opt)
}
main()
