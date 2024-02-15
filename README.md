# WindSpeedModeling

## Overview

This repository is dedicated to modeling wind speed based on a number of predictors using various regression techniques in R. The included models cover simple linear regression, multiple regression, interaction effects, non-linear transformations, and the use of qualitative predictors in regression. The goal of this project is to provide a comprehensive exploration and implementation of different regression models for accurate wind speed modeling.

## Models

- **Simple Linear Regression:** [Link Text](simple_linear_regression.R) utilizes basic linear regression to establish a foundation for wind speed modeling. 

- **Non-Linear Transformation:** [Link Text](non_linear_transformations.R) explores non-linear transformations to capture complex patterns in wind speed data.

- **Multiple Regression:** [Link Text](multiple_linear_regression.R) incorporates multiple independent variables to enhance the accuracy of wind speed predictions.

- **Interaction Effects:** [Link Text](interaction_effect.R) accounts for interaction effects between variables, providing a more nuanced understanding of the relationships involved.

- **Qualitative Predictors** [Link Text](qualitative_predictors.R) is used to incorporate qualitative factors relevant to the wind speed prediction, mainly the dates of the data collection.


## Data Attributes

The following weather measurments were recored each 10 minutes for several years:

- **Date.Time:** Date-time reference for the recording.

- **Pressure (mbar):** Internal pressure.

- **Temperature (degC):** Temperature in Celsius.

- **Temperature (K):** Temperature in Kelvin.

- **Tdew (degC):** Temperature in Celsius relative to humidity. Dew Point is a measure of the absolute amount of water in the air.

- **Relative Humidity (%):** How saturated the air is with water vapor.

- **Vpmax (mbar):** Saturation vapor pressure.

- **Vpact (mbar):** Vapor pressure.

- **Vpdef (mbar):** Vapor pressure deficit (Vpmax-Vpact).

- **Specific Humidity (g/kg):** The mass of water vapor per unit mass of air.

- **Water Vapor Concentration (mmol/mol):** Water vapor concentration in the air.

- **Airtight (g/m^3):** Air density.

- **Wind Speed (m/s):** Wind speed.

- **Maximum Wind Speed (m/s):** Maximum wind speed.

- **Wind Direction (deg):** Wind direction in degrees.

## Exploratory Analysis


