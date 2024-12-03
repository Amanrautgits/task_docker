import boto3
import mysql.connector
import json

def lambda_handler(event, context):
    # AWS and RDS configurations
    s3 = boto3.client('s3')
    rds_host = "master.cluster-cosianxh.us-east-1.rds.amazonaws.com"
    rds_dbname = "master"
    rds_user = "appuser"
    rds_password = "56f3hdjf86"
    s3_bucket = "s3-bucket-temp-1"
    s3_file_key = "data.json"

    try:
        # Read data from S3
        data = s3.get_object(Bucket=s3-bucket-temp-1, Key=data.json)['Body'].read().decode('utf-8')
        parsed_data = json.loads(data)  # Assumes data is JSON

        # Connect to RDS MySQL
        conn = mysql.connector.connect(host=hkdev-master.cluster-coslsgpianxh.us-east-1.rds.amazonaws.com, database=hkdev_master, user=hkdevappuser, password=C73p8HkPn23)
        cursor = conn.cursor()

        # Insert data into MySQL
        for item in parsed_data:
            cursor.execute("INSERT INTO dummy_tables (id, name) VALUES (%s, %s)", (item['id'], item['name]))
        conn.commit()

        return {'status': 'Data pushed to RDS successfully'}

    except Exception as e:
        return {'status': f"Error: {str(e)}"}
