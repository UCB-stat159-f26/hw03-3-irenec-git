
<!-- README.md is generated from README.Rmd. Please edit that file -->

<!-- #region -->

# HW 3: R Package tennisage

Author: Irene Chen\
Date: November 13, 2026

## Description

This repository creates `tennisage`, an R package containing functions
that retrieve data on a given professional tennis player’s career
matches and creates a plot visualization of their career matches. This
package can be applied to both male and female players.

## Data Details

Data for this package is obtained and downloaded from Tennis Abstract
(tennisabstract.com).

## Installation Details

You can install the development version of `tennisage` from this
repository using the `devtools` function `install_github()` or the `pak`
function `pak()`.

``` r
# option 1: install.packages("devtools")
devtools::install_github("UCB-stat159-f26/hw03-3-irenec-git")

# option 2: install.packages("pak")
pak::pak("UCB-stat159-f26/hw03-3-irenec-git")
```

## Functions Details

The package `tennisage` contains two functions: 1.
`get_career_matches(name)`: This function retrieves career match
information of a given professional tennis player, female or male. Input
the name of a professional tennis player in the format “First Last”,
“first last”, or “FirstLast”. For example, to obtain information about
Serena Williams, please call: `get_career_matches("Serena Williams")`.
This will return a data frame containing information on match date,
tournament, surface, opponent, result (1 = win, 0 = loss), player age at
time of match, and age difference (player age - opponent age). Please
note that inputting an invalid name will return an error. Any name not
listed on tennisabstract.com is considered an invalid name. For example,
calling `get_career_matches("GastonSanchez")` will return the following
error message: `Player GastonSanchez not found. Check the spelling.`.

2.  `plot_age_gap(data)`: This function takes the data obtained from
    `get_career_matches()` and creates a scatter plot with player age on
    the x-axis, age difference on the y-axis, and points colored by the
    match result (blue for a win, purple for a loss).

## Example

``` r
# load package
library(tennisage)

# Serena Williams
serena = get_career_matches("Serena Williams")
plot_age_gap(serena)

# Rafael Nadal
rafa = get_career_matches("Rafael Nadal")
plot_age_gap(rafa)

# invalid name
get_career_matches("Gaston Sanchez")
```

## Tests Details

Tests for this package use small mock files in place of the live
website, so they can run without internet connection.

``` r
devtools::test()
```

## Personal Reflection

Through this assignment, I learned how to create an R package. I feel
that this is especially helpful in generalizing an exploratory data
analysis process to various data sets, rather than working with one data
set or repeating the entire process for multiple data sets. I also
learned how to incorporate tests into my analysis process. Before this
assignment, I had never written a test before and would wait until I
encountered an issue before examining my code. Tests are particularly
helpful when the data or function outputs differ depending on the task
at hand (i.e. the player chosen by a user), since it is highly
impractical to examine the validity every possible data set. They are
also an effective way of checking your code to identify if there are
issues with code rather than data or inputs. Finally, I learned about
many new packages, including `devtools`, `usethis`, `testthat`, and
`roxygen2`. I had never worked with these before and feel that these
packages will be very useful in the future when working on other
projects.

<!-- #endregion -->
