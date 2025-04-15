FROM khulenikhil/spark:3.5.5-python3.12

RUN curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.11.704/aws-java-sdk-bundle-1.11.704.jar --output /opt/spark/jars/aws-java-sdk-bundle-1.11.704.jar && \
  curl https://jdbc.postgresql.org/download/postgresql-42.7.5.jar --output /opt/spark/jars/postgresql-42.7.5.jar && \
  curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.1/hadoop-aws-3.3.1.jar --output /opt/spark/jars/hadoop-aws-3.3.1.jar

RUN mkdir /opt/spark/conf && \
  touch /opt/spark/conf/spark-defaults.conf && \
  echo "spark.jars    /opt/spark/jars/*.jar" >> /opt/spark/conf/spark-defaults.conf