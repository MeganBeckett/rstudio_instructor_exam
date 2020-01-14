# =========================================================================================== #
#                                                                                             #
# Connecting to a database                                                      Megan Beckett #
# =========================================================================================== #


# DATA ----------------------------------------------------------------------------------------
# Run the following if doing this yourself and you want the data.
# On RStudio Cloud, the data is already present
dir.create("data_raw", showWarnings = FALSE)
download.file(url = "https://ndownloader.figshare.com/files/2292171",
              destfile = "data_raw/mammals.sqlite", mode = "wb")


# LIBRARIES -----------------------------------------------------------------------------------
library(dplyr)


# CONNECTION ----------------------------------------------------------------------------------
mammals <- DBI::dbConnect(RSQLite::SQLite(), "data_raw/mammals.sqlite")


# INVESTIGATE ---------------------------------------------------------------------------------
src_dbi(mammals)

# Create a table from a data source
surveys <- tbl(mammals, "surveys")

head(surveys)

nrow(surveys)

surveys_data <- surveys %>%
  collect()

nrow(surveys_data)

# QUERY ---------------------------------------------------------------------------------------

show_query(head(surveys))

plot <- tbl(mammals, "plot")

species <- tbl(mammals, "species") %>%
  collect()

species_summary <- species %>%
  group_by(taxa) %>%
  summarise(N = n()) %>%
  collect()

head(species)
nrow(species)

show_query(head(surveys))
