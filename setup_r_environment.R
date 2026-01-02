# ============================================================================
# R Package Installation Script
# Online Shopper's Intention (OSI) Analysis Project
# ============================================================================
# This script installs all required R packages for the OSI analysis project
# Run this script once before executing the main analysis
# ============================================================================

# Function to check and install packages
install_if_missing <- function(packages) {
  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      message(paste("Installing package:", pkg))
      install.packages(pkg, dependencies = TRUE)
    } else {
      message(paste("Package already installed:", pkg))
    }
  }
}

# List of required packages
required_packages <- c(
  # Data Manipulation & Visualization
  "tidyverse",      # Collection of data science packages (includes dplyr, ggplot2, stringr)
  "ggplot2",        # Data visualization
  "dplyr",          # Data manipulation
  "stringr",        # String operations

  # Statistical Analysis
  "moments",        # Skewness and kurtosis analysis
  "zoo",            # Time series and rolling calculations

  # Machine Learning & Classification
  "caret",          # Classification and Regression Training
  "e1071",          # Support Vector Machines (SVM)
  "rpart",          # Decision Trees (CART)
  "rpart.plot",     # Decision tree visualization
  "randomForest",   # Random Forest classifier

  # Clustering & Dimensionality Reduction
  "factoextra",     # PCA and clustering visualization

  # Model Evaluation
  "pROC"            # ROC curve analysis and AUC calculation
)

# Install packages
message("==============================================================")
message("Starting package installation for OSI Analysis Project")
message("==============================================================\n")

install_if_missing(required_packages)

message("\n==============================================================")
message("Package installation complete!")
message("==============================================================")

# Verify installation
message("\nVerifying package installation...\n")
all_installed <- TRUE
for (pkg in required_packages) {
  if (require(pkg, character.only = TRUE, quietly = TRUE)) {
    message(paste("✓", pkg, "- OK"))
  } else {
    message(paste("✗", pkg, "- FAILED"))
    all_installed <- FALSE
  }
}

if (all_installed) {
  message("\n✓ All packages installed successfully!")
  message("You can now run the analysis script: DSC 441 HW5.Rmd")
} else {
  message("\n✗ Some packages failed to install. Please check the error messages above.")
}

# Print R session info
message("\n==============================================================")
message("R Session Information:")
message("==============================================================")
print(sessionInfo())
