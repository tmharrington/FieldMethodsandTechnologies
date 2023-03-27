---
title: "Pollution Project - DBH"
author: "Trevor Harrington"
format: html
editor: visual
execute: 
  keep-md: TRUE
  code-fold: TRUE
---



# SNHU Arboretum Stream Pollution Project


::: {.cell}
::: {.cell-output .cell-output-stderr}
```

Attaching package: 'dplyr'
```
:::

::: {.cell-output .cell-output-stderr}
```
The following objects are masked from 'package:stats':

    filter, lag
```
:::

::: {.cell-output .cell-output-stderr}
```
The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union
```
:::

::: {.cell-output .cell-output-stderr}
```

Attaching package: 'kableExtra'
```
:::

::: {.cell-output .cell-output-stderr}
```
The following object is masked from 'package:dplyr':

    group_rows
```
:::
:::


### Writing and organizing the Data in R Studio

-   before analysis on DBH can be accomplished, both of the variables containing DBH will need to be converted into a data frame in R Studio.

    -   This could be done with code, but the excel file would need to be organized where each sheet contains a dataset, and is individually piped into R with excel plugin.

    -   Because this data set only contains 10 vectors, the easiest method will be manually entering DBH into R.


::: {.cell}

```{.r .cell-code}
# Generate variables for each set of vectors
dbh_near_water <- c(48.2, 32.3, 40.6, 21.0, 44.7)
dbh_distant_from_water <- c(54.5, 70.2, 29.0, 26.2, 46.7)

# Convert DBH from inches to centimeters
dbh_near_water <- dbh_near_water * 2.54
dbh_distant_from_water <- dbh_distant_from_water * 2.54

# Merge datasets and reshape for plotting
df_near_water <- data.frame(DBH = dbh_near_water, Location = "Near Water")
df_distant_from_water <- data.frame(DBH = dbh_distant_from_water, Location = "Distant from Water")

# Combine datasets
combined_df <- rbind(df_near_water, df_distant_from_water)

# Add a column for biomass
combined_df$"Biomass (kg/tree)" <- (41.173 * combined_df$DBH - 409.5)


# Add a column for Carbon (kg/tree)
combined_df$"Carbon (kg/tree)" <- combined_df$Biomass * 0.45

combined_df$"CO2_per_tree (kg/tree)" <- (combined_df$Carbon * 3.66666666667)
```
:::

::: {.cell}

```{.r .cell-code}
combined_df %>%
  kable(digits = 4) %>%
  kable_styling(bootstrap_options = "striped", "hover")
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:right;"> DBH </th>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> Biomass (kg/tree) </th>
   <th style="text-align:right;"> Carbon (kg/tree) </th>
   <th style="text-align:right;"> CO2_per_tree (kg/tree) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:right;"> 122.428 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 4631.228 </td>
   <td style="text-align:right;"> 2084.0526 </td>
   <td style="text-align:right;"> 7641.526 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 82.042 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 2968.415 </td>
   <td style="text-align:right;"> 1335.7869 </td>
   <td style="text-align:right;"> 4897.885 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 103.124 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 3836.425 </td>
   <td style="text-align:right;"> 1726.3910 </td>
   <td style="text-align:right;"> 6330.100 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 53.340 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1786.668 </td>
   <td style="text-align:right;"> 804.0005 </td>
   <td style="text-align:right;"> 2948.002 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 113.538 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 4265.200 </td>
   <td style="text-align:right;"> 1919.3400 </td>
   <td style="text-align:right;"> 7037.580 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 138.430 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 5290.078 </td>
   <td style="text-align:right;"> 2380.5353 </td>
   <td style="text-align:right;"> 8728.629 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 178.308 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 6931.975 </td>
   <td style="text-align:right;"> 3119.3889 </td>
   <td style="text-align:right;"> 11437.759 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 73.660 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 2623.303 </td>
   <td style="text-align:right;"> 1180.4864 </td>
   <td style="text-align:right;"> 4328.450 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 66.548 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 2330.481 </td>
   <td style="text-align:right;"> 1048.7164 </td>
   <td style="text-align:right;"> 3845.293 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 118.618 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 4474.359 </td>
   <td style="text-align:right;"> 2013.4615 </td>
   <td style="text-align:right;"> 7382.692 </td>
  </tr>
</tbody>
</table>

`````

:::
:::


### Describing the dataset

These measurements were taken March 20th, 2023 at the SNHU Arboretum for part 1 of the stream pollution experiment that will be taking place for the remainder of this semester. The first step was to **gather diameter at breast height for two sets of trees in 15 x 15 foot plot**s**.** This data will be useful when considering additional details about the stream.

-   "near water" was measured between 1 and 5 yards around a seasonal second order stream. Trees were measured at breast height in a cluster of \~ 15 feet\^2.

-   This plot represents the bottom of a small slope seperating the walking path of the arboretum and the highway \~ 1/4 mile away

-   both plots are only a short distance (100 ft at the furthest) from the walking path, likely a highly disturbed part of the forest.

### Comparing averages of the two plots


::: {.cell}

```{.r .cell-code}
combined_df %>%
  group_by(Location) %>%
summarise( "average CO2 (kg CO2/tree)" = mean(`Carbon (kg/tree)`),
           ) %>%
kable(digits = 0) %>%
  kable_styling(bootstrap_options = "striped", "hover")
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> average CO2 (kg CO2/tree) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 1949 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1574 </td>
  </tr>
</tbody>
</table>

`````

:::
:::

::: {.cell}

```{.r .cell-code}
# Plot the data
ggplot(combined_df) +
  geom_point(aes(Location,DBH)) +
  geom_boxplot(aes(Location,DBH)) +
  labs(title = "DBH Comparison: Near Water vs Distant from Water",
       x = "Location",
       y = "Diameter at Breast Height (DBH, cm)") +
  theme_minimal()
```

::: {.cell-output-display}
![](Pollution_Project_Part_1_files/figure-html/unnamed-chunk-5-1.png){width=672}
:::
:::


### Observations: 

Considering the graph, this does seem to support a statistically significant difference between the measurements taken near and far from the stream. Distant from the water, there seems to be a significant amount of deviation from the mean that could account for a much less significant difference between these two groups.


::: {.cell}

```{.r .cell-code}
t.test(dbh_distant_from_water,dbh_near_water)
```

::: {.cell-output .cell-output-stdout}
```

	Welch Two Sample t-test

data:  dbh_distant_from_water and dbh_near_water
t = 0.83622, df = 6.524, p-value = 0.4326
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 -37.81082  78.24762
sample estimates:
mean of x mean of y 
 115.1128   94.8944 
```
:::
:::


### Observations:

Based on the t-test results for these two groups (t = 0.83622, df = 6.524, p-value = 0.4326), there is no significant difference between the mean DBH of trees near water ( mean = 37.36) and distant from water ( mean = 45.32) at the 95% confidence level. The confidence interval for the difference in means ranges from -14.89 to 30.81, which includes zero, further indicating that the true difference in means might be insignificant.

It is likely the small sample size has an impact of the results of this experiment. Expanding the amount of trees observed in each group may provide a more clear deviation between the two groups.
