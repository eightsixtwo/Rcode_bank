# This code creates a function that takes a character vector of package names, checks to see if 
# they are installed and installs any that are not.  It then loads all packages into the worskspace.

# Why bother?  Well, simply put a package name into the function and it will check to see if it is installed,
# install it if not and then load it into the workspace.  Installing and loading usually needs two separate
# steps - install.packages() and library/require().  Our function only requires a single step to do everything! =)

# 1. Create vector - add any necessary package names needed.
list_of_packages <- c("rvest", "dplyr", "httr", "xml2", "jsonlite", 
                      "DT", "here", "readtext")
# 2. Create function that will do the job for us whenever required.
load_packages <- function(package_names){
  # Assign packages not listed in installed.packages() to a new vector object
  new_packages <- package_names[!(package_names %in% installed.packages()[,"Package"])]
  # If length of new_packages returns a value, install all packages named
  if(length(new_packages)) install.packages(new_packages, repos = "https://cloud.r-project.org/")
  # Use lappy to load required packages into the workspace
  lapply(package_names, library, character.only = TRUE)
}

# Use our new function to install and load necessary packages
load_packages(list_of_packages)

# Has it worked?
sessionInfo()

# Lets test it on a new package that we decide to add in later...
load_packages("ggplot2")

# Did it work?
sessionInfo()
