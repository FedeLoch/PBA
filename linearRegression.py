import pandas as pd
import csv

from sklearn.linear_model import LinearRegression
from sklearn.preprocessing import StandardScaler

print("Path to features csv:")
path = input()
df = pd.read_csv(path)
y = df['execution time (ms)']
X = df.iloc[:, 2:]
X_standard = StandardScaler().fit_transform(X)

regr = LinearRegression()
regr.fit(X_standard, y)
coefs = regr.coef_
intercept = regr.intercept_

lineregfile = open('linear_regression.csv', 'w', newline='')
writer = csv.writer(lineregfile)
writer.writerow(["file", "coefs", "intercept"])
writer.writerow([path, coefs, intercept])
lineregfile.close()