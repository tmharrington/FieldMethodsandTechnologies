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
#dbh_near_water <- dbh_near_water * 2.54
#dbh_distant_from_water <- dbh_distant_from_water * 2.54

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
   <td style="text-align:right;"> 48.2 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1575.0386 </td>
   <td style="text-align:right;"> 708.7674 </td>
   <td style="text-align:right;"> 2598.8137 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 32.3 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 920.3879 </td>
   <td style="text-align:right;"> 414.1746 </td>
   <td style="text-align:right;"> 1518.6400 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 40.6 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1262.1238 </td>
   <td style="text-align:right;"> 567.9557 </td>
   <td style="text-align:right;"> 2082.5043 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 21.0 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 455.1330 </td>
   <td style="text-align:right;"> 204.8099 </td>
   <td style="text-align:right;"> 750.9695 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 44.7 </td>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1430.9331 </td>
   <td style="text-align:right;"> 643.9199 </td>
   <td style="text-align:right;"> 2361.0396 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 54.5 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 1834.4285 </td>
   <td style="text-align:right;"> 825.4928 </td>
   <td style="text-align:right;"> 3026.8070 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 70.2 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 2480.8446 </td>
   <td style="text-align:right;"> 1116.3801 </td>
   <td style="text-align:right;"> 4093.3936 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 29.0 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 784.5170 </td>
   <td style="text-align:right;"> 353.0327 </td>
   <td style="text-align:right;"> 1294.4531 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 26.2 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 669.2326 </td>
   <td style="text-align:right;"> 301.1547 </td>
   <td style="text-align:right;"> 1104.2338 </td>
  </tr>
  <tr>
   <td style="text-align:right;"> 46.7 </td>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 1513.2791 </td>
   <td style="text-align:right;"> 680.9756 </td>
   <td style="text-align:right;"> 2496.9105 </td>
  </tr>
</tbody>
</table>

`````

:::
:::


### Describing the dataset

These measurements were taken March 20th, 2023 at the SNHU Arboretum for part 1 of the stream pollution experiment that will be taking place for the remainder of this semester. The first step was to **gather diameter at breast height for two sets of trees in 15 x 15 foot plot**s**.** This data will be useful when considering additional details about the stream.

-   "near water" was measured between 1 and 5 yards around a seasonal second order stream. Trees were measured at breast height in a cluster of \~ 15 feet\^2.

-   This plot represents the bottom of a small slope separating the walking path of the arboretum and the highway \~ 1/4 mile away

-   both plots are only a short distance (100 ft at the furthest) from the walking path, likely a highly disturbed part of the forest.

### Comparing averages of the two plots


::: {.cell}

```{.r .cell-code}
combined_df %>%
  group_by(Location) %>%
summarise("Average Biomass (kg/tree)" = mean(`Biomass (kg/tree)`),
           "Average Carbon (kg/tree)" = mean(`Carbon (kg/tree)`),
           "Average CO2 (kg/tree)" = mean(`CO2_per_tree (kg/tree)`)
           )%>%
kable(digits = 0) %>%
  kable_styling(bootstrap_options = "striped", "hover")
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> Average Biomass (kg/tree) </th>
   <th style="text-align:right;"> Average Carbon (kg/tree) </th>
   <th style="text-align:right;"> Average CO2 (kg/tree) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Distant from Water </td>
   <td style="text-align:right;"> 1456 </td>
   <td style="text-align:right;"> 655 </td>
   <td style="text-align:right;"> 2403 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Near Water </td>
   <td style="text-align:right;"> 1129 </td>
   <td style="text-align:right;"> 508 </td>
   <td style="text-align:right;"> 1862 </td>
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
 -14.88615  30.80615
sample estimates:
mean of x mean of y 
    45.32     37.36 
```
:::
:::


### Observations:

Based on the t-test results for these two groups (t = 0.83622, df = 6.524, p-value = 0.4326), there is no significant difference between the mean DBH of trees near water ( mean = 37.36) and distant from water ( mean = 45.32) at the 95% confidence level. The confidence interval for the difference in means ranges from -14.89 to 30.81, which includes zero, further indicating that the true difference in means might be insignificant.

It is likely the small sample size has an impact of the results of this experiment. Expanding the amount of trees observed in each group may provide a more clear deviation between the two groups.
