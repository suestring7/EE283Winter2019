# Homework 2

This assignment has you do an analysis using "base" R, and then again using the tidyverse.

The data for the assignment are in [this file](data.txt).  The data look like this:

```
value
0
0 
1
0
0
0
0
1
1
0
0
0
0
0
```

This file is a simplification of a common type of analysis:

* Imagine that your input data file contains some set of observations from a genomic analysis.
* The file is sorted (top to bottom) by genomic position.  For simplicity, we will assume that the file contains data
  from a single chromosome.  Thus, the top of the file is the "leftmost" positions on the chromosome (e.g., close to 1),
  and the bottom of the file are the rightmost positions.
* The column `value` represents the presence/absence of an observation along the genome.  For example, 0 = "no CHIP-seq
  peak", and 1 = "yes CHIP-seq peak"
* For every row, you need to calculate the location (row index) of the closest peak, either 5' (top/left) or 3'
  (bottom/right).

In other words, you need to transform the input data frame to the following ouput data frame:

```
value closest
0     3
0     3 
1     3
0     3
0     3
0     8
0     8
1     8
1     9
0     9
0     9
0     9
0     9
0     9
```

The assigment is:

* Generate the *output* data frame using **only** base R.  This means you cannot use any `tidyverse` packages other
  than `readr`, because all that will do is help you read in the file.
* Generate the *output* data frame using the `tidyverse`.

As before, put your answers into a new GitHub repo, and get Edwin to do a code review.

Hint: you will need both `dplyr` and `tidyr` functions for your `tidyverse` solution. The solution comes from adding
multiple new columns via `mutate` and then processing them for the final output.  Also, be sure to use "negative
selection" to get rid of columns that you don't need!  For real data, you wouldn't want to write all your intermediate
calculations to the output file!
