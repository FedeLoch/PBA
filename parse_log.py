import re
import pandas as pd
from io import StringIO
import sys

if len(sys.argv) < 3:
    print("Usage: python parse_log.py <log file> <output csv file>") 
    sys.exit(1) 

input_file = sys.argv[1]
output_file = sys.argv[2]

with open(input_file,'r',encoding="utf-8") as f:
    data = f.read()

blocks = re.split(r"Analyzing (\d+)\s+Intermediate result:", data)[1:]

rows = []

for i in range(0, len(blocks), 2):
    label = blocks[i].strip()
    csv_data = blocks[i + 1].strip()

    csv_data = re.sub(r'^\t+', '', csv_data, flags=re.M)
    csv_data = "\n".join([line for line in csv_data.splitlines() if line.strip()])

    df = pd.read_csv(StringIO(csv_data), header=None, names=["metric", "value"])

    row = {"": label}
    row.update(dict(zip(df["metric"], df["value"])))
    rows.append(row)

result_df = pd.DataFrame(rows)
result_df.to_csv(output_file, index=False)
