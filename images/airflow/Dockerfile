FROM apache/airflow:2.10.5-python3.12

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-17-jdk gcc git \
    && rm -rf /var/lib/apt/lists/*

# Download JDBC and other JARs
RUN mkdir -p ${AIRFLOW_HOME}/jars && \
    curl -L -o ${AIRFLOW_HOME}/jars/postgresql-jdbc.jar https://jdbc.postgresql.org/download/postgresql-42.7.1.jar && \
    curl -L -o ${AIRFLOW_HOME}/jars/aws-java-sdk.jar https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.698/aws-java-sdk-bundle-1.12.698.jar && \
    curl -L -o ${AIRFLOW_HOME}/jars/hadoop-aws.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.6/hadoop-aws-3.3.6.jar

ENV SPARK_JARS="/opt/airflow/jars/postgresql-jdbc.jar,/opt/airflow/jars/aws-java-sdk.jar,/opt/airflow/jars/hadoop-aws.jar"

COPY ./requirements.txt requirements.txt

USER airflow

RUN pip install --no-cache-dir -r requirements.txt
