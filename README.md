# WindSpeedModeling

## Overview

This repository is dedicated to modeling wind speed based on several predictors using various regression techniques in R. The included models cover simple linear regression, multiple regression, interaction effects, non-linear transformations, and the use of qualitative predictors in regression. The goal of this project is to provide a comprehensive exploration and implementation of different regression models for accurate wind speed modeling.

A detailed commentary on all attempts and findings is provided in an R Markdown document [wind_speed_modeling](wind_speed_modeling.Rmd) and its corresponding compiled HTML file [wind_speed_modeling_compiled](wind_speed_modeling.html).

## Models

- **Simple Linear Regression:** [simple_linear_regression](simple_linear_regression.R) utilizes basic linear regression to establish a foundation for wind speed modeling. 

- **Non-Linear Transformation:** [non_linear_transformations Text](non_linear_transformations.R) explores non-linear transformations to capture complex patterns in wind speed data.

- **Multiple Regression:** [multiple_linear_regression Text](multiple_linear_regression.R) incorporates multiple independent variables to enhance the accuracy of wind speed predictions.

- **Interaction Effects:** [interaction_effectText](interaction_effect.R) accounts for interaction effects between variables, providing a more nuanced understanding of the relationships involved.

- **Qualitative Predictors** [qualitative_predictors](qualitative_predictors.R) is used to incorporate qualitative factors relevant to the wind speed prediction, mainly the dates of the data collection.


## Data Attributes

The following weather measurements were recorded every 10 minutes for several years:

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

Initial inspection of the data revealed the existence of data anomalies that disrupted the wind velocity scale. Correlations were examined after the elimination of these values, revealing relatively significant correlations between wind velocity and other predictors, most notably with the relative humidity. 

A relatively large number of outliers was also detected for both wind velocity and relative humidity measures.

![image](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/8885e24e-cf66-465b-9250-a67f54d5f018)
![image](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/b21d8449-6277-4557-885e-ff588a62a43e)

The impact of outlier removal on correlations was investigated, underscoring the importance of these outliers in maintaining correlations with other measures.

## Results 

Several regression models were constructed achieving slightly improved results progressively. 
The data was then mutated to be segregated over the months, to get a better representation of the evolution of the correlations between the metrics over the months. 

![image](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/99ad2403-5d45-4af9-b954-2fedd52b62b0)
![image](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/57f14b80-0a28-4ac3-aa27-dae1302027e0)

The separate plots revealed that months could be grouped into 3 main categories based on the identified pattern of wind velocity and relative humidity correlation. The data was further mutated to account for this observation. 

### Accuracy

The examination of the results of several different regression models allowed for the identification of the final model below accounting for the interactions between multiple meteorological factors with the relative humidity taken in its quadratic form.

```R 
final = lm(wv~I(rh^2)*Vpmax*temperature*pressure*rho*wd,mutated_data)
```

This final model achieved an accuracy significantly better than that achieved by the initial simple regression model. The results for both models are captured in the plots below.

![initial](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/289b9a3a-fb94-44d0-b785-54ba6871b3fc)
![final](https://github.com/yazid-hoblos/WindSpeedModeling/assets/125372209/86defc51-621a-4b4a-aafc-a5bccaf9ed1a)

This performance improvement was also confirmed by the MSE (mean squared error) measure for both models 2.14 for the initial model to 1.25 for the final one (~41% decrease).

```R
mean(summary(model1)$residuals^2)
mean(summary(final)$residuals^2)
```



