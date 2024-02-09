# R Shiny UI Interface Setup for OnDemand

This repository contains the necessary files and instructions to set up a UI interface in R Shiny, designed for use with the OnDemand platform and Milton HPC system.

## Prerequisites

Before you begin, ensure you have access to Milton HPC and can log into OnDemand. If you do not have access, follow the setup instructions provided by your organization.

## Getting Started

1. **Access OnDemand**: Log into OnDemand. Navigate to `CLUSTERS -> SLURM SHELL ACCESS`.

2. **Clone the Repository**: In your terminal, clone this repository using the command:
   ```bash
   git clone https://github.com/yourusername/yourrepository.git

## Configuring Your Environment
Follow these steps to prepare your environment for launching Shiny applications:

- **Access OnDemand**: Log into the OnDemand platform and navigate to the terminal through CLUSTERS -> SLURM SHELL ACCESS.
- **Launch RStudio**: From OnDemand, launch an RStudio session, ensuring you select the appropriate resources (e.g., partition, runtime hours, CPUs, and memory).
- **Install Required Packages**: In the RStudio session, use the provided script install_packages.R to install necessary R packages.

## Deploying Shiny Applications
To deploy your Shiny application:

- **Prepare the App**: Ensure your Shiny application is ready and tested in a local environment.
- **Configure App Settings**: In OnDemand, navigate to the Shiny Apps section and configure the settings for your application, including resource allocation.
- **Launch the App**: Start your Shiny application and access it through the provided OnDemand URL.

Check out the technical document for detailed step-by-step with images: 

[Technical Note](https://wehieduau.sharepoint.com/:w:/r/sites/StudentInternGroupatWEHI/Shared%20Documents/Image%20Introduction/2023-2024%20Summer%20Technical%20Notes/Technical%20Notes%20Shiny.docx?d=w488b868b75aa460eaea8ace0ef2cc5e2&csf=1&web=1&e=GRg1JI)

