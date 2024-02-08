library(shiny)
library(shinycssloaders)
library(DT)

# Begin UI for the R + reticulate example app
ui <- fluidPage(
  
  titlePanel('WEHI Research Computing'),
  div(style = "text-align: center; margin: 2.5%", 
      tags$img(src = "logo.png", width = "25%")
  ),
  sidebarLayout(
    sidebarPanel(
          fileInput('upload', 'Upload image', accept = c('image/tiff', 'image/png')),
          div(id = "img_container", style = "padding: 10px; text-align: center; width", 
              imageOutput("img")
          ),
    ),
    mainPanel(
      tabsetPanel(tabPanel('Cell Analysis',
                           div(class = "container-fluid",
                               div(class = "row",
                                   div(class = "col-sm-12",
                                       style= "background-color: #ffffff; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);",
                                       h3('Cell Analysis Results', style = "margin-top: 0;"),
                                       textInput('fp', 'Filepath to images', value = 'Enter the path to an image file'),
                                       textInput('rp', 'Filepath to results', value = 'Enter the path to a CSV file'),
                                       actionButton('analyze_btn', 'Analyze Cells', class = "btn-primary"),
                                       DT::dataTableOutput('contents'),
                                       br(),
                                   )
                               )
                           ),
                           div(class = "container-fluid",
                               div(class = "row",
                                   div(class = "col-sm-13",
                                       style = "background-color: #ffffff; padding: 20px;",
                                      actionButton('show_btn', 'Show Results', class = "btn-primary"),
                                   ),
                                   div(class = "col-sm-14",
                                       style = "padding: 20px;",
                                   DTOutput('tbl'),
                                   ),
                               ),
                           )
                          
                      
                 ),
                 tabPanel('Upload new workflow', 
                         h3("Upload workflow Python script"),
                         hr(),
                         textInput('workflow-script', 'Filepath to script', value = 'Enter the path to your Python script'),
                         textInput('py-packages', 'Packages required for script to run', value = 'Enter the path to your Python script'),
                         textInput('dataset', 'Filepath to data', value = 'Enter the path to a CSV file'),
                         
                         
                 ),
                  tabPanel('Architecture Info', 
                           h3('Current architecture info'),
                           hr(),
                           shinycssloaders::withSpinner(DT::dataTableOutput('sysinfo')),
                           br(),
                           verbatimTextOutput('which_python'),
                           verbatimTextOutput('python_version'),
                           verbatimTextOutput('ret_env_var'),
                           verbatimTextOutput('venv_root')
                  )
      )
    )
  )
)

# End of ui.R
# Open the python file whenever written using reticulate, then ask user to input the dependencies needed. run the thig on the dataset and save.