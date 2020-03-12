library(RPostgres)
library(RPostgreSQL)
library(dbplyr)
library(tidyverse)
library(DBI)


# connect to Postgres database using RPostgres package method
con <- dbConnect(RPostgres::Postgres(),
                  dbname = "mucs", 
                  host = "localhost", # i.e. 'ec2-54-83-201-96.compute-1.amazonaws.com'
                  port = 5432, # or any other port specified by your DBA
                  user = "<USERNAME>",
                  password = "<PASSWORD>")

# get list of tables in db
dbListTables(conn = con)

# Example
#=========

# Return a subset of data from a table held in your database

# create a reference to a desired table - this only queries the database, it doesnt bring it in
basics <- tbl(con, "basiccompanydata")
# check the reference works
head(basics)
