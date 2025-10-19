import boto3
import pandas as pd
import os

bucket = "cc-arqnuvem-2307-us-east-1"
s3 = boto3.client("s3")
local = "data/sales.csv"

# RAW
s3.upload_file(local, bucket, "raw/sales.csv")

# TRUSTED
df = pd.read_csv(local).dropna()
df.columns = [c.strip().lower().replace(" ", "_") for c in df.columns]
df.to_csv("trusted_sales.csv", index=False)
s3.upload_file("trusted_sales.csv", bucket, "trusted/sales.csv")

# CLIENT
client = df[['order_id', 'amount']]
client.to_csv("client_sales.csv", index=False)
s3.upload_file("client_sales.csv", bucket, "client/sales.csv")

print("Pipeline executado com sucesso!")
