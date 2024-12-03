FROM python:3.9-slim
WORKDIR /app
COPY data.py .
RUN pip install --no-cache-dir boto3 mysql-connector-python
ENV AWS_DEFAULT_REGION=us-east-1
CMD ["python", "data.py"]
