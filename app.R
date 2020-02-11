library(shiny)
library(shinydashboard)


header <- dashboardHeader(title="Databrew app")
sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem(
            text="Main",
            tabName="main",
            icon=icon("eye")),
        menuItem(
            text="Charts",
            tabName="charts",
            icon=icon("eye")),
        menuItem(
            text = 'About',
            tabName = 'about',
            icon = icon("cog", lib = "glyphicon"))
    )
)

body <- dashboardBody(
    tags$head(
        tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    tabItems(
        tabItem(
            tabName="main",
            fluidPage(
                fluidRow(
                    a(href="http://databrew.cc",
                      target="_blank", uiOutput("box1")),
                    a(href="http://databrew.cc",
                      target="_blank", uiOutput("box2"))
                )
            )
        ),
        tabItem(
            tabName="charts",
            tabsetPanel(
                id = 'tabs',
                tabPanel(
                    title = 'Most recent value - Population mean',
                    value = 'value_mean'),
                tabPanel(
                    title = 'Trends - Population mean',
                    value = 'trends_mean'),
                tabPanel(
                    title = 'Quintile trends',
                    value = 'quintile_trends'),
                tabPanel(
                    title = 'Quintile dotplot for countries',
                    value = 'quintile_doptplot'),
                tabPanel(
                    title = 'Quintile dotplot for indicators',
                    value = 'quintile_indicators'),
                tabPanel(
                    title = 'Most recent value - concentration index',
                    value = 'value_concentration'),
                tabPanel(
                    title = 'Trends - concentration index',
                    value = 'trends_concentration'),
                tabPanel(
                    title = 'Data availibility per indicator',
                    value = 'data_per_indicator'),
                tabPanel(
                    title = 'Data availibility per country',
                    value = 'data_per_country')
                
                )),
            
        tabItem(
            tabName = 'about',
            fluidPage(
                fluidRow(
                    div(img(src='logo_clear.png', align = "center"), style="text-align: center;"),
                    h4('Built in partnership with ',
                       a(href = 'http://databrew.cc',
                         target='_blank', 'Databrew'),
                       align = 'center'),
                    p('Empowering research and analysis through collaborative data science.', align = 'center'),
                    div(a(actionButton(inputId = "email", label = "info@databrew.cc", 
                                       icon = icon("envelope", lib = "font-awesome")),
                          href="mailto:info@databrew.cc",
                          align = 'center')), 
                    style = 'text-align:center;'
                )
            )
        )
    )
)

# UI
ui <- dashboardPage(header, sidebar, body, skin="blue")

# Server
server <- function(input, output) {
    
    output$box1 <- renderUI({
        valueBox(
            "12345", "Some information 1", icon = icon("bullseye"),
            color = 'blue'
        )})
    
    output$box2 <- renderUI({
        valueBox(
            5, "Some information 2", icon = icon("tachometer"),
            color = 'orange'
        )})
}

shinyApp(ui, server)