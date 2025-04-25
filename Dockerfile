FROM apache/airflow:3.0.0-python3.12

# Set environment variables
LABEL org.opencontainers.image.source=https://github.com/radio-check/workflows
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DEBIAN_FRONTEND=noninteractive

USER root

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends openjdk-17-jdk \
    && rm -rf /var/lib/apt/lists/*

ENV SPARK_JARS="/opt/airflow/jars/postgresql-jdbc.jar,/opt/airflow/jars/aws-java-sdk.jar,/opt/airflow/jars/hadoop-aws.jar"

RUN mkdir -p ${AIRFLOW_HOME}/dags ${AIRFLOW_HOME}/include ${AIRFLOW_HOME}/logs ${AIRFLOW_HOME}/plugins ${AIRFLOW_HOME}/config

USER airflow

COPY ./requirements.txt ${AIRFLOW_HOME}/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

COPY ./dags ${AIRFLOW_HOME}/dags
COPY ./plugins ${AIRFLOW_HOME}/plugins
COPY ./include ${AIRFLOW_HOME}/include
COPY ./config ${AIRFLOW_HOME}/config
