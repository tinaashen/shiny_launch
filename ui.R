library(shiny)
library(shinycssloaders)
library(DT)

# Begin UI for the R + reticulate example app
ui <- fluidPage(
  
  titlePanel('Example app: Using R Shiny + reticulate'),
  
  sidebarLayout(
    sidebarPanel(
      # Inputs to Python functions called by reticulate
      fileInput('upload', 'Upload image', accept = c('image/tiff', 'image/png')),
      imageOutput("img")
    ),
    mainPanel(
      tabsetPanel(tabPanel('Cell Analysis',
                          tags$div(
                          h3('Cell Analysis Results'),
                          textInput('fp', 'Filepath to images', value = 'Enter the path to a image file'),
                          textInput('rp', 'Filepath to results', value = 'Enter the path to a CSV file'),
                          actionButton('analyze_btn', 'Analyze Cells'),
                          DT::dataTableOutput('contents'), # Add this line to display the results
                          br(),
                          actionButton('show_btn', 'Showing Button'),
                          DTOutput('tbl'),
                          )
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
