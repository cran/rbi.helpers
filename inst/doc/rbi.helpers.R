## ---- include = FALSE---------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true") # nolint
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = NOT_CRAN
)

## ---- eval = FALSE------------------------------------------------------------
#  install.packages("rbi.helpers")

## ---- eval = FALSE------------------------------------------------------------
#  remotes::install_github("sbfnk/rbi.helpers")

## ---- eval = FALSE------------------------------------------------------------
#  library("rbi")
#  library("rbi.helpers")

## ---- echo = FALSE------------------------------------------------------------
#  suppressPackageStartupMessages(library("rbi"))
#  suppressPackageStartupMessages(library("rbi.helpers"))

## ---- eval = NOT_CRAN---------------------------------------------------------
#  model_file <- system.file(package = "rbi", "SIR.bi") # file included in package
#  sir_model <- bi_model(model_file) # load model
#  set.seed(1001912)
#  sir_data <- bi_generate_dataset(sir_model, end_time = 16 * 7, noutputs = 16)

## -----------------------------------------------------------------------------
#  bi_prior <- sample(
#    proposal = "prior", sir_model, nsamples = 1000, end_time = 16 * 7,
#    nparticles = 4, obs = sir_data, seed = 1234
#  )

## -----------------------------------------------------------------------------
#  adapted <- adapt_particles(bi_prior)

## -----------------------------------------------------------------------------
#  adapted$options$nparticles

## -----------------------------------------------------------------------------
#  adapted <- adapt_proposal(adapted, min = 0.05, max = 0.4)

## -----------------------------------------------------------------------------
#  bi_read(adapted, file = "input")

## -----------------------------------------------------------------------------
#  posterior <- sample(adapted)
#  DIC(posterior)

## -----------------------------------------------------------------------------
#  res <- numeric_to_time(posterior, unit = "day", origin = as.Date("2018-04-01"))
#  head(res$Z)

## -----------------------------------------------------------------------------
#  orig <- time_to_numeric(res, unit = "day", origin = as.Date("2018-04-01"))
#  head(orig$Z)

## -----------------------------------------------------------------------------
#  posterior <- sample(
#    proposal = "prior", sir_model, nsamples = 1000,
#    end_time = 16 * 7, nparticles = 4, obs = sir_data, seed = 1234
#  ) |>
#    adapt_particles() |>
#    adapt_proposal(min = 0.05, max = 0.4) |>
#    sample(nsamples = 5000) |>
#    sample_obs()

