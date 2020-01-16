# =========================================================================================== #
#                                                                                             #
# Databases in R - Exercise 1                                                   Megan Beckett #
# =========================================================================================== #


# QUESTION 1 ----------------------------------------------------------------------------------
# Load the relevant libraries



# QUESTION 2 ----------------------------------------------------------------------------------
# Create a connection to the local mammals.sqlite database in the folder /data_raw.
# View the source for the database backend connection using src_dbi().
con <- ......(......., .......)

src_dbi(.....)


# QUESTION 3 ----------------------------------------------------------------------------------
# Create a reference to each of the 3 tables in the mammals database. View the head of the plots
# and surveys tables.
species <- tbl(......, ......)
surveys <-
plots <-


# QUESTION 4 ----------------------------------------------------------------------------------
# Perform a simple query to request rows of the surveys table in which weight is less than 5
# and keep only the species_id, sex, and weight columns. Do not collect the results.
# How many rows are shown in the "lazy query"?

surveys %>%
  filter(......) %>%
  select(......)


# QUESTION 5 ----------------------------------------------------------------------------------
# Use dplyr syntax to query the species survey table to find out how many of each different species_id
# have been recorded in total.

# Show the SQL query that the R code was translated into

survey_species_sum <- surveys %>%
  group_by(......) %>%
  .......(N = n()) %>%
  ........

show_query(......)


# QUESTION 6 ----------------------------------------------------------------------------------
# For the year 2000, how many records were made each month? Which months do not have any data?

year_2000_sum <- surveys %>%
  filter(.......) %>%
  ....... %>%
  ....... %>%
  .......


# QUESTION 7 ----------------------------------------------------------------------------------
# Calculate the mean hindfoot length per species_id in the survey table for all obervations,
# arranged in descending order.

hindfoot_mean <- ......



# BONUS ---------------------------------------------------------------------------------------
# You can also make use of dplyr's joining functionality to join tables in a database and collect
# the results. Very handy!

# As above, but first remove those observations that do not have a hindfoot_length, then join
# to the species table by species_id before collecting the results.

# Which taxa do all the species belong to that have hindfoot measurements?

hindfoot_mean <- ......




# View the SQL query for the above. It might not look exactly how you might have written the SQL
# yourself, but have a look to see how the R code has been translated.

show_query(......)

