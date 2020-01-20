# =========================================================================================== #
#                                                                                             #
# Connecting to a database - demo                                               Megan Beckett #
# =========================================================================================== #

# DATA ----------------------------------------------------------------------------------------

# Run the following if doing this yourself and you want the data.
# On RStudio Cloud, the data is already present.
#
dir.create("data_raw", showWarnings = FALSE)
download.file(
  url = "https://ndownloader.figshare.com/files/2292171",
  destfile = "data_raw/mammals.sqlite",
  mode = "wb"
)

# LIBRARIES -----------------------------------------------------------------------------------

library(dplyr)
library(dbplyr)

# CONNECTION ----------------------------------------------------------------------------------

mammals <- DBI::dbConnect(RSQLite::SQLite(), "data/mammals.sqlite")

# INVESTIGATE ---------------------------------------------------------------------------------

src_dbi(mammals)

# Create a table from a data source.
#
surveys <- tbl(mammals, "surveys")

head(surveys)

nrow(surveys)

surveys_data <- surveys %>%
  collect()

nrow(surveys_data)

# QUERY ---------------------------------------------------------------------------------------

# How many different species per taxa are in the dataset?
#
species <- tbl(mammals, "species")

head(species)

taxa_summary <- species %>%
  count(taxa) %>%
  collect()

show_query(species %>%
             count(taxa))
