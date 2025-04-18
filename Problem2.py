import pandas as pd
import statsmodels.api as sm

# Load the World Indicators data from "World Indicators.csv"


# Your code starts after this line

data_frame = pd.read_csv('World Indicators.csv')

# Your code ends before this line

# Create a linear model between year and population in the US

# Your code starts after this line
us_dt = data_frame[data_frame['Country/Region'] == 'United States']
us_dt = us_dt.dropna(subset=['Year', 'Population Total'])

X_us = sm.add_constant(us_dt['Year'])  # Add constant for intercept
y_us = us_dt['Population Total']

us_model = sm.OLS(y_us, X_us).fit()

 
# Your code ends before this line

# Predict the expected population in the US in 2015

# Your code starts after this line
year_input = pd.DataFrame({'const': [1], 'Year': [2015]})
us_pred = us_model.predict(year_input)

print(f"Predicted US population in 2015: {round(us_pred.iloc[0], 2)}")

# Your code ends before this line

# For the data from Europe
# Create a linear model between Life Expectancy Female and the significant predictors among
#  Birth Rate
#  GDP
#  Health Exp % GDP
#  Infant Mortality Rate
#  Life Expectancy Male

# Summarize your model (only the final one)

# Hint: if you hit an issue with NaNs in the values consider using this: missing='drop'

# Your code starts after this line
euro_dt = data_frame[data_frame['Region'] == 'Europe']

predictors = ['Birth Rate', 'GDP', 'Health Exp % GDP', 'Infant Mortality Rate', 'Life Expectancy Male']
target = 'Life Expectancy Female'

euro_dt = euro_dt.dropna(subset=predictors + [target])

X_europe = sm.add_constant(euro_dt[predictors])
y_europe = euro_dt[target]

europe_model = sm.OLS(y_europe, X_europe).fit()

print("\nEurope Model Summary:")
print(europe_model.summary())


# Your code ends before this line

# Predict the Expected Life Expectancy Female of a country with this characteristics
#  Birth Rate = 3%
#  GDP = 1 billion
#  Health Exp % GDP = 4%
#  Infant Mortality Rate = 5%
#  Life Expectancy Male = 80
# Round the prediction to two decimal points

# Your code starts after this line
r_squared = europe_model.rsquared
print("R^2 Value:", r_squared)

data_frame[data_frame['Region'] == 'Europe']['Life Expectancy Female'].dropna()

new_country = pd.DataFrame({
    'const': [1],
    'Birth Rate': [0.03],
    'GDP': [1000000000],
    'Health Exp % GDP': [0.04],
    'Infant Mortality Rate': [0.05],
    'Life Expectancy Male': [80]
})
life_expectancy_female_pred = europe_model.predict(new_country)
print("Predicted Life Expectancy Female:", round(life_expectancy_female_pred[0], 2))

# Your code ends before this line