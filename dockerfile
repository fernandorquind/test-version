# Utiliza una imagen base con Ubuntu 20.04
FROM ubuntu:20.04

# Actualiza el sistema y se asegura de tener los paquetes más recientes
RUN apt-get update -y && apt-get upgrade -y

# Instala dependencias necesarias para la descarga de JDK
RUN apt-get install -y wget

# Descarga y extrae JDK 15
RUN mkdir /usr/lib/jvm && \
    wget -q https://download.java.net/java/GA/jdk15/779bf45e88a44cbd9ea6621d33e33db1/36/GPL/openjdk-15_linux-x64_bin.tar.gz -O /tmp/openjdk-15.tar.gz && \
    tar -xzf /tmp/openjdk-15.tar.gz -C /usr/lib/jvm && \
    rm /tmp/openjdk-15.tar.gz

# Configura las variables de entorno para Java
ENV JAVA_HOME /usr/lib/jvm/jdk-15
ENV PATH $PATH:$JAVA_HOME/bin
