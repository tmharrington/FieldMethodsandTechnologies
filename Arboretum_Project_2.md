---
title: "Soil Testing"
author: "Trevor Harrington"
format: html
editor: visual
keep-md: TRUE
prefer-html: TRUE
code-fold: TRUE
bibliography: references.bib
---


::: {.cell}

:::


# Soil Carbon Content Analysis

## Field Research Part Two

------------------------------------------------------------------------

## Introduction

This project aims to acquire expertise in collecting and performing calculations necessary for creating a soil profile and estimating the carbon content sequestered using a standardized method that accounts for the range of soil conditions. This report will utilize data obtained from a soil core sampler, which offers a standardized volume of soil that can be analyzed for carbon content percentage to determine bulk density. The soil samples in this report as collected from the top 20cm of the soil; assuming this sample was collected from a relatively standard soil sample that has not experienced significant erosion, it likely contains samples from the O, A, and B horizons. These three horizons offer valuable insights into soil health, as they contain the humus and living biomass necessary for decomposing and recycling organic residues, thereby maintaining a thriving ecosystem.

### Soil Profiles

Typical soil profiles consist of several layers with varying thicknesses, which can be observed using a profile sampler. The first layer encountered is the Organic horizon, usually relatively thin and composed of recently deposited organic residues in the initial stages of decomposition. Plant debris, animal droppings, leaf litter, and living microorganisms vital for breaking down organic matter create a nutrient-rich and dense layer of humus. This layer is crucial for soil fertility, water retention, and erosion prevention.

Beneath the O horizon lies the topsoil or A Horizon, which comprises a blend of organic components and inorganic minerals weathered from below. These elements are essential for supporting sustainable root systems. Although the A horizon is lighter than the O horizon, it exhibits a darker coloration than the lower soil layers due to the presence of organic components filtered through the O horizon.

Subsequently, the B horizon is characterized by the accumulation of finer particles such as clay and sand and minerals, and humus transported downward by subsurface drainage. This layer is influenced by the composition of the Parent material underlying the soil profile, which can vary based on geological features.

Finally, the C horizon, or soil base, represents the last layer before bedrock and is the least weathered. However, it determines many of the chemical and physical properties of the overlying soil layers.

### Soil carbon stock

Soil carbon stock is a valuable measurement

------------------------------------------------------------------------

## Materials and Methods

For the field study portion of this report, the SNHU arboretum was utilized to observe a soil profile in person. A soil profile sampler was used to sample two plots selected on parameters such as distance from a water source, elevation, and proximity to a previously measured tree stand. The area of the Arboretum used for this field study was

------------------------------------------------------------------------

## Results

### Inputting the data


::: {.cell}

```{.r .cell-code}
carbon_concentration <- c(5.4,6.1,4.9)
soil_dry_mass <- c(310,250,290)
sample_depth <- 20
radius <- 2.5


# Create a data frame with the data
measurements <- data.frame(
  "Carbon Concentration (%)" = carbon_concentration,
  "Soil Dry Mass (g) "= soil_dry_mass,
  "Sample Depth (cm)" = rep(sample_depth, length(carbon_concentration)),
  "Radius (cm)" = rep(radius, length(carbon_concentration))
)

# Transpose the data frame
transposed_data_frame <- as.data.frame(t(measurements))

# Reset row names and add a new 'Variable' column
transposed_data_frame <- transposed_data_frame %>%
  rownames_to_column("Measurements") %>%
  rename_all(list(~gsub("V", "Location ", .)))

# Print the transposed data frame
transposed_data_frame %>%
  kable(digits = 2) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Measurements </th>
   <th style="text-align:right;"> Location 1 </th>
   <th style="text-align:right;"> Location 2 </th>
   <th style="text-align:right;"> Location 3 </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> Carbon.Concentration.... </td>
   <td style="text-align:right;"> 5.4 </td>
   <td style="text-align:right;"> 6.1 </td>
   <td style="text-align:right;"> 4.9 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Soil.Dry.Mass..g.. </td>
   <td style="text-align:right;"> 310.0 </td>
   <td style="text-align:right;"> 250.0 </td>
   <td style="text-align:right;"> 290.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Sample.Depth..cm. </td>
   <td style="text-align:right;"> 20.0 </td>
   <td style="text-align:right;"> 20.0 </td>
   <td style="text-align:right;"> 20.0 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> Radius..cm. </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 2.5 </td>
   <td style="text-align:right;"> 2.5 </td>
  </tr>
</tbody>
</table>

`````

:::
:::


### Calculating Bulk Density


::: {.cell}

```{.r .cell-code}
# Providing the variables 
carbon_concentration <- c(5.4,6.1,4.9)
soil_dry_mass <- c(310,250,290)
sample_depth <- 20
radius <- 2.5

#Calculating Volume of ring/sample
sample_volume <- pi * (radius^2) * sample_depth

# Calculating the bulk density for each sample
bulk_density <- soil_dry_mass / sample_volume

bulk_density_df <- data.frame(bulk_density)

# Rename the column to the desired name, for example: "New_Column_Name"
bulk_density_df <- bulk_density_df %>%
  mutate("Bulk Density" = bulk_density) %>%
  select(-bulk_density)

bulk_density_df$Location <- c(" 1", " 2", "3")

# Reorder the columns so that "Location" is the first column
bulk_density_df <- bulk_density_df[, c("Location", "Bulk Density")]

# Display the table with the new column name
bulk_density_df %>%
kable(digits = 2) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> Bulk Density </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 0.79 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 0.64 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 0.74 </td>
  </tr>
</tbody>
</table>

`````

:::
:::


### Calculating Soil Carbon Content


::: {.cell}

```{.r .cell-code}
# Create the new variable using the provided equation
soc <- carbon_concentration * bulk_density * sample_depth
soc_df <- data.frame(soc)

# Rename the column to the desired name
soc_df <- soc_df %>%
  mutate("Soil Carbon Content" = soc) %>%
  select(-soc)

# Create a data frame with SOC
soc_df <- data.frame(SOC = soc)

# Add the Location column
soc_df$Location <- c(" 1", " 2", " 3")

# Reorder the columns so that "Location" is the first column
soc_df <- soc_df[, c("Location", "SOC")]

# Rename the column to the desired name
## tC/h = tons of carbon per hectare

soc_df <- soc_df %>%
  mutate(`Soil Carbon Content (tC/h)` = SOC) %>%
  select(-SOC)

# Display the table using kable
soc_df %>%
  kable(digits = 1) %>%
  kable_styling(bootstrap_options = c("striped", "hover"))
```

::: {.cell-output-display}

`````{=html}
<table class="table table-striped table-hover" style="margin-left: auto; margin-right: auto;">
 <thead>
  <tr>
   <th style="text-align:left;"> Location </th>
   <th style="text-align:right;"> Soil Carbon Content (tC/h) </th>
  </tr>
 </thead>
<tbody>
  <tr>
   <td style="text-align:left;"> 1 </td>
   <td style="text-align:right;"> 85.3 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 2 </td>
   <td style="text-align:right;"> 77.7 </td>
  </tr>
  <tr>
   <td style="text-align:left;"> 3 </td>
   <td style="text-align:right;"> 72.4 </td>
  </tr>
</tbody>
</table>

`````

:::
:::


### Summary