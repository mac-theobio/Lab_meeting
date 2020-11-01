##Zachary Levine's entry, find the app online at https://mcmasterpandemic.shinyapps.io/dataviz/
default.start.date <- "2020-01-01"
library(shiny)
library(lubridate)
run_shiny <- function() {
  ## The ui (user interface) is what the user is shown when running
  ## the shiny.  The ui also gathers input that is the passed to the
  ## server (e.g., filling in boxes or sliders).
  ui <- fluidPage(theme = shinythemes::shinytheme("flatly"),
                  ##Set the title panel to be Heritage Maroon.
                  h1(id = "heading", "YouTube Data Visualization"),
                  ##Colour the top and bottom of the page appropriately.
                  tags$style(HTML("#heading {background-color: #7A003C; color: white !important;}")),
                  tags$style(HTML("#sourcelink {background-color: #7A003C; color: white !important;}")),
                  #Change the colours of text on the tab selectors to be blue.
                  tags$style(HTML("
                                  .tabbable > .nav > li > a[data-value='plotaes'] {color: blue}
                                  .tabbable > .nav > li > a[data-value='uploadtab'] {color: blue}
                                  ")),
                  ##Bold the explanation title for the error entry tab.
                  tags$style(HTML("#explanationTitle {font-weight: bold;}")),
                  ##Set the colour of the sidebar panel to be Heritage Gold.
                  tags$head(tags$style(HTML('#sidebar {background-color: #FDBF57;}'))),
                  ##Set the background colour to be a lighter and faded Heritage Grey (original one is too dark).
                  shinyWidgets::setBackgroundColor(color = "#e6ebed"),
                  sidebarLayout(
                    sidebarPanel(id = "sidebar", width = 4,
                                 fluidRow(
                                   textOutput("checkButtonTitle"),
                                   uiOutput("plotTogglePanel")
                                 ),
                                 fluidRow(
                                   dateInput(inputId = "sd",
                                             label = "Start Date",
                                             value = default.start.date,
                                             min = "2020-01-01",
                                             max = "2030-11-31"),
                                   uiOutput("endDate")),
                                 ## Only show the selector to input parameters if that's selected.
                                 uiOutput("maintabPanel"),
                                 ##Colour the checkboxes to match the curves in the plot.
                                 ##Use the below object to call the HTML tags within the server function.
                                 htmlOutput("colourManager")),
                    mainPanel(
                      fluidRow(
                        uiOutput("plotColumn"),
                        br())
                    )
                  ),
                  uiOutput("sourcelink")
                  )
  
  #Everything else.
  server <- function(input, output, session){
    ##Render the tab panel server-side to force tab changes the way we'd like, and give us the load-edit functionality we're after.
    output$maintabPanel <- renderUI({
      tabsetPanel(
        ##Use this to force the tab to change.
        id = "tabs",
        ##The parameters panel needs to be the default selected panel. This is so it Shiny can render the panel first. The input slots aren't created until the panel is created.
        ##So keep the default to be the parametersPanel to avoid ugly errors.
        selected = "uploadtab",
        tabPanel(title = "Upload file", value = "uploadtab",
                  fileInput("theDf", 'Enter the YouTube data to visualize',
                  accept=c('text/csv','text/comma-separated-values,text/plain','.csv'))),
        tabPanel(
          title = "Plot aesthetics",
          value = "plotaes",
          sliderInput("Globalsize", "Text size:",
                      min = 5, max = 45,
                      step = 0.25,
                      value = 10),
          checkboxInput(inputId = "automaticSize",
                        label = ("Show sliders for individual text element sizes"),
                        value = 0),
          conditionalPanel(condition = "input.automaticSize",
                           sliderInput("titleSize", "Title size:",
                                       min = 0, max = 25,
                                       value = 20),
                           sliderInput("XtextSize", "X axis title size:",
                                       min = 0, max = 25,
                                       value = 10),
                           sliderInput("YtextSize", "Y axis title size:",
                                       min = 0, max = 25,
                                       value = 10)
          ))
      )})
      output$plot <- renderPlot(width = 850,{
        library(ggplot2)
        if (is.null(input$theDf)){
          return(ggplot(data = data.frame()) + geom_point() + theme(plot.background = element_rect(fill = "#e6ebed", color = "#e6ebed", size = 0),
                                                      panel.border = element_blank(), panel.background = element_rect(fill = "#e6ebed", color = "#e6ebed", size = 0)))
        }
        else{
          library(anytime)
          library(ggplot2)
          maindf <- read.csv(input$theDf$datapath)
          maindf <- maindf[anytime(maindf$published) >= anytime::anydate(input$sd) & anytime(maindf$published) <= anytime::anydate(input$ed),]
          p <- ggplot2::ggplot(data = maindf, mapping = aes(x = theme, y = code)) + geom_col(fill = "#FDBF57") + labs(x = "theme", y = "count", title = "Youtube themes over time")
        if (input$automaticSize == 1){
          p <- p + ggplot2::theme(
            plot.title = element_text(color = "black", size = input$titleSize),
            axis.title.x = element_text(color = "black", size = input$XtextSize),
            axis.title.y = element_text(color = "black", size = input$YtextSize))
        }
        else{
          p <- p + theme_minimal(base_size = input$Globalsize)
        }
        # Colour properly and eliminate other elements.
        p <- p + theme(plot.background = element_rect(fill = "#e6ebed", color = "#e6ebed", size = 0),
                       panel.border = element_blank())
        p
        }
      })
    output$plotColumn <- renderUI({
      column(9,
             ##Set a default plot size and make the panel scrollable if a plot overflows.
             style = "max-width:500px, overflow-x: scroll;",
             plotOutput("plot")
      )
    })
    ##EndDate is the name of the ui object, "ed" is the name of the input slot to store the end date in.
    ##We make this reactive so we can use the input start date as the minimum value for the end date.
    observe({
      output$endDate <- renderUI({
        dateInput(inputId = "ed",
                  label = "End date",
                  value = toString(anytime::anydate(input$sd) + 30*9),
                  min = toString(anytime::anydate(input$sd) + 1),
                  max = toString(anytime::anydate(input$sd) + 5*365))
      })
    })
    output$sourcelink <- renderUI({tagList(
      "Shiny interface for dataviz contest @ Mac TheoBio written by Zachary Levine."
    )})
  }
  return(shinyApp(ui, server))
}
run_shiny()