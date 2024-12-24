# Determination of Key Factors Influencing Insurance Claim Activity Using Multiple Regression: Applications to Sri Lanka and Beyond

This analysis identifies key socio-economic and environmental factors influencing insurance claim activity (INVOLACT), providing actionable insights for improving the Sri Lankan insurance sector and beyond.

---

## Abstract

The study investigates factors influencing insurance claim activity across 47 Chicago zip codes using multiple regression analysis. Significant predictors include:

- **Race** and **Fire Rates**: Strong positive effect.
- **Theft Rates**: Negative correlation.
- **Housing Age**: Moderate positive impact.
- **Income Levels**: Statistically insignificant (excluded from the final model).

Regression assumptions (e.g., normal residuals, homoscedasticity) are validated. The findings offer applications for risk profiling, premium optimization, and policy equity in the Sri Lankan insurance market.

---

## Introduction

### Study Context

The study aims to help insurance companies manage risks and pricing strategies by examining:

- Demographic, socio-economic, and environmental factors influencing claims.
- Variables like race, fire/theft incidents, housing age, income levels, and location.

### Research Questions

1. How do socio-economic factors influence INVOLACT?
2. What roles do fire and theft rates play?
3. How does housing age affect claims?
4. What is the impact of income levels and geographical location?

### Objectives

- Identify significant predictors of INVOLACT.
- Develop regression models with robust validation.
- Apply findings to the Sri Lankan insurance sector.

---

## Methodology

### Research Approach

Quantitative analysis using multiple regression to assess INVOLACT against six independent variables.

### Regression Assumptions

- Residuals are normally distributed.
- Linear relationships between predictors and response.
- No multicollinearity among predictors.
- Residuals exhibit homoscedasticity (constant variance).

### Data Set

- **Source**: Julian J. Faraway’s *Linear Models with R*.
- **Sample**: 47 zip codes in Chicago.

---

## Results

### Final Model (Model 03)

- **Race**: β = 0.0081, p < 0.0001 (Strong positive effect).
- **Fire Rates**: β = 0.0366, p < 0.0001 (Strong positive effect).
- **Theft Rates**: β = -0.0096, p = 0.0024 (Negative impact).
- **Housing Age**: β = 0.0072, p = 0.0046 (Moderate positive effect).

---

## Discussion and Applications

### Key Findings

- Race and fire rates are dominant factors.
- Theft rates negatively influence claims, reflecting policyholder behavior.
- Older housing correlates with higher risk exposure.

### Applications to Sri Lanka

Predictive modeling for disaster-prone or high-density areas supports:

- **Risk-adjusted premium pricing**.
- **Equitable access to tailored insurance coverage** for underserved populations.

---

## Conclusion

### Summary

Race and fire rates significantly influence claims, while income levels are statistically insignificant. Demographic and environmental factors outweigh economic status in predicting INVOLACT.

### Implications

- **Insurers**: Enhanced risk profiling and premium optimization.
- **Policymakers**: Data-driven strategies for equitable policy access.
- **Researchers**: Extend regression modeling to diverse fields.

---
