The "tidyverse"
========================================================
author: 
date: 
autosize: true

Background
========================================================

* You are probably familiar with "base" R, which is the set of features that come with R by default.
* While useful, the interface is inconsistent across different areas, and certain common operations
are clumsily-supported
* The "tidyverse" is an attempt to improve this situation with a modern and consistent interface.
* The "tidyverse" is also a cult.  Much like Cross Fit, tidyverse advocates just can't stop going on and on about it.

Plusses of the tidyverse
=============================================

* Replace `read.table` with `readr::read_delim` wherever possible.  Way faster!
* The `stringr` package makes string manipulation non-crappy.
* Nice date/time manipulation.  Maybe not relevant to much of what we do, though?
* ggplot2
* **dplyr**

Speed
==============================================

This gets its own slide!!!!

* tidyverse operations are typically an order of magnitude, or more, faster than "base" R operations.  This is especially true of dplyr!  Stuff I was doing in 2014 with "base" functions went from 8 hours to 10 minutes due to dplyr.
* The reason is [Rcpp](http://www.rcpp.org), which allows writing R functions, etc., in C++.  It is now the most depended-on package in CRAN, and has been a total game-changer for R as a data science tool.

WHO tuberculosis data.  (p 163 of book)
======================================


```r
head(tidyr::who)
```

```
# A tibble: 6 x 60
  country iso2  iso3   year new_sp_m014 new_sp_m1524 new_sp_m2534
  <chr>   <chr> <chr> <int>       <int>        <int>        <int>
1 Afghan… AF    AFG    1980          NA           NA           NA
2 Afghan… AF    AFG    1981          NA           NA           NA
3 Afghan… AF    AFG    1982          NA           NA           NA
4 Afghan… AF    AFG    1983          NA           NA           NA
5 Afghan… AF    AFG    1984          NA           NA           NA
6 Afghan… AF    AFG    1985          NA           NA           NA
# ... with 53 more variables: new_sp_m3544 <int>, new_sp_m4554 <int>,
#   new_sp_m5564 <int>, new_sp_m65 <int>, new_sp_f014 <int>,
#   new_sp_f1524 <int>, new_sp_f2534 <int>, new_sp_f3544 <int>,
#   new_sp_f4554 <int>, new_sp_f5564 <int>, new_sp_f65 <int>,
#   new_sn_m014 <int>, new_sn_m1524 <int>, new_sn_m2534 <int>,
#   new_sn_m3544 <int>, new_sn_m4554 <int>, new_sn_m5564 <int>,
#   new_sn_m65 <int>, new_sn_f014 <int>, new_sn_f1524 <int>,
#   new_sn_f2534 <int>, new_sn_f3544 <int>, new_sn_f4554 <int>,
#   new_sn_f5564 <int>, new_sn_f65 <int>, new_ep_m014 <int>,
#   new_ep_m1524 <int>, new_ep_m2534 <int>, new_ep_m3544 <int>,
#   new_ep_m4554 <int>, new_ep_m5564 <int>, new_ep_m65 <int>,
#   new_ep_f014 <int>, new_ep_f1524 <int>, new_ep_f2534 <int>,
#   new_ep_f3544 <int>, new_ep_f4554 <int>, new_ep_f5564 <int>,
#   new_ep_f65 <int>, newrel_m014 <int>, newrel_m1524 <int>,
#   newrel_m2534 <int>, newrel_m3544 <int>, newrel_m4554 <int>,
#   newrel_m5564 <int>, newrel_m65 <int>, newrel_f014 <int>,
#   newrel_f1524 <int>, newrel_f2534 <int>, newrel_f3544 <int>,
#   newrel_f4554 <int>, newrel_f5564 <int>, newrel_f65 <int>
```

Messy!!!
==================================

* Lots of redundant info spread across columns
* Multiple columns referring to the same thing.
* etc.

Let's look at something simpler
========================================


```r
library(tidyverse)
make_gb <- function()
{
tibble(student=c("Anadil","Fernando"),
                 exam1=c(11,10),
                 exam1total=c(12,12),
                 exam2=c(14,12),
                 exam2total=c(15,15))
}
gradebook=make_gb()
gradebook
```

```
# A tibble: 2 x 5
  student  exam1 exam1total exam2 exam2total
  <chr>    <dbl>      <dbl> <dbl>      <dbl>
1 Anadil      11         12    14         15
2 Fernando    10         12    12         15
```

Get the weighted percentage for each student using "base" R
=============================================


```r
gradebook$wp = (gradebook$exam1/gradebook$exam1total)*(gradebook$exam1total/(gradebook$exam1total+gradebook$exam2total)) + (gradebook$exam2/gradebook$exam2total)*(gradebook$exam2total/(gradebook$exam1total+gradebook$exam2total))
gradebook
```

```
# A tibble: 2 x 6
  student  exam1 exam1total exam2 exam2total    wp
  <chr>    <dbl>      <dbl> <dbl>      <dbl> <dbl>
1 Anadil      11         12    14         15 0.926
2 Fernando    10         12    12         15 0.815
```

Let's clean up the data first
===============================================


```r
tgb=make_gb() %>% 
  gather(exam1,exam2,key="exam",value="score") %>%
  mutate(total_points=exam1total+exam2total)
tgb
```

```
# A tibble: 4 x 6
  student  exam1total exam2total exam  score total_points
  <chr>         <dbl>      <dbl> <chr> <dbl>        <dbl>
1 Anadil           12         15 exam1    11           27
2 Fernando         12         15 exam1    10           27
3 Anadil           12         15 exam2    14           27
4 Fernando         12         15 exam2    12           27
```

Note the side effect!

Better
=========================


```r
tgb=make_gb() %>% 
  gather(exam1,exam2,key="exam",value="score") %>%
  mutate(total_points=exam1total+exam2total) %>%
  select(-exam1total, -exam2total)
tgb
```

```
# A tibble: 4 x 4
  student  exam  score total_points
  <chr>    <chr> <dbl>        <dbl>
1 Anadil   exam1    11           27
2 Fernando exam1    10           27
3 Anadil   exam2    14           27
4 Fernando exam2    12           27
```

Let's just do it
==========================


```r
tgb=make_gb() %>% 
  gather(exam1,exam2,key="exam",value="score") %>%  # Make 1 column
  mutate(total_points=exam1total+exam2total) %>%    # Add total points
  select(-exam1total, -exam2total) %>%              # Remove unwanted columns
  group_by(student) %>%                             # process each student separately
  summarise(wp=sum(score)/unique(total_points))     # Get the answer
tgb
```

```
# A tibble: 2 x 2
  student     wp
  <chr>    <dbl>
1 Anadil   0.926
2 Fernando 0.815
```

More generally
=====================================

* These tools let you operate on subsets of data via "group by" operations. 
* Code is typically more readable than 'base' R
* Often shorter
* The problem is debugging when things go wrong.

Databases
========================================

* dplyr also has the capacity to join across tables, etc., much like regular database software
* It can also process data in actual database files!!!!!!  You can analyze data TOO LARGE TO FIT IN MEMORY and do it WITHOUT WRITING ANY DATABASE COMMANDS **This is amazing**
* See [here](https://db.rstudio.com/dplyr/) for documentation
* [sqlite3](https://www.sqlite.org/index.html) is an open-source database that doesn't require "root" privileges.  It is also on HPC
