box_map <- function(...) {
  data.frame(
    id = c("unemployment_rate",
           "unemployed",
           "employment_total",
           "participation_rate", 
           "employment_ft",
           "employment_pt",
           "underemployed",
           "underutilised",
           "underemployment_rate",
           "underutilisation_rate", 
           "hours_worked_total", 
           "labour_force_total"),
    indicator = c("Unemployment rate",
                  "Unemployed total", 
                  "Employed total", 
                  "Participation rate",
                  "Employed full-time", 
                  "Employed part-time", 
                  "Underemployed total",
                  "Underutilised total",
                  "Underemployment rate (proportion of labour force)",
                  "Underutilisation rate",
                  "Monthly hours worked in all jobs",
                  "Labour force total"),
    reverse = c(TRUE, 
                FALSE,
                FALSE,
                FALSE,
                FALSE,
                FALSE,
                TRUE,
                TRUE,
                TRUE,
                TRUE,
                FALSE,
                FALSE),
    percent = c(TRUE,
                FALSE,
                FALSE,
                TRUE,
                FALSE,
                FALSE,
                FALSE,
                FALSE,
                TRUE,
                TRUE,
                FALSE,
                FALSE),
    footer =  paste0("Data last updated: ")
  )
}

labour_market_indicators <- function() {
  aitidata::labour_force %>%
    dplyr::distinct(indicator) %>%
    dplyr::filter(!indicator %in% c("Monthly hours worked in all jobs (employed full-time)",
                                    "Monthly hours worked in all jobs (employed part-time)",
                                    "Unemployed looked for full-time work",
                                    "Unemployed looked for only part-time work",
                                    "Unemployment rate looked for full-time work",
                                    "Unemployment rate looked for only part-time work")) %>% 
    dplyr::pull()
}

series_choices <- function() {
  c("Original",
    "Seasonally Adjusted")
}

regions <- function() {
  sort(c("South Australia",
         "Western Australia",
         "Tasmania",
         "Australia",
         "Queensland",
         "Victoria",
         "New South Wales",
         "Northern Territory",
         "Australian Capital Territory"))
}

boxes_names <- function() {
  tibble::tribble(
    ~indicator, ~label, 
    "Employed total", "Employed Total",
    "Employed full-time", "Employed Full Time",
    "Employed part-time", "Employed Part Time",
    "Unemployment rate", "Unemployment Rate",
    "Unemployed total", "Unemployed Total",
    "Labour force total", "Labour Force Total",
    "Underemployed total", "Underemployed Total",
    "Underutilised total", "Underutilised Total",
    "Participation rate", "Participation Rate",
    "Employment to population ratio", "Employment to Population Ratio",
    "Underemployment rate (proportion of labour force)", "Underemployment Rate",
    "Underutilisation rate", "Underutilisation Rate",
    "Monthly hours worked in all jobs", "Hours Worked",
    "Jobkeeper applications", "JobKeeper Applications",
    "Jobkeeper proportion", "JobKeeper Rate",
    "Jobseeker payment", "JobSeeker Recipients",
    "Youth allowance other", "Youth Allowance"
  )
  
}