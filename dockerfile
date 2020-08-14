FROM ubuntu:18.04
RUN  apt-get update && apt-get install -y git
RUN  apt-get install -y openjdk-8-jdk
RUN  apt-get install -y wget
RUN  apt-get install -y curl
RUN  apt-get install -y unzip

#CMD mkdir /gradleapp
#CMD cd ./gradle
WORKDIR ./gradle
RUN pwd

RUN curl -L https://services.gradle.org/distributions/gradle-6.5.1-bin.zip -o gradle-6.5.1-bin.zip
RUN unzip gradle-6.5.1-bin.zip
ENV GRADLE_HOME=/gradle/gradle-6.5.1
ENV PATH=$PATH:$GRADLE_HOME/bin
RUN gradle --version

#RUN mkdir app
#CMD cd ./app

RUN ls -ltr /usr/lib/jvm/java-8-openjdk-amd64/

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/
RUN export JAVA_HOME
ENV PATH=$PATH:$JAVA_HOME/bin

RUN git clone https://github.com/murlikjha/gs-gradle.git
RUN chmod -R a+rX *

WORKDIR /gradle/gs-gradle/complete
RUN gradle --version
RUN pwd
RUN ls -lt /gradle/gs-gradle/complete
#RUN gradle build /gradle/gs-gradle/complete
#RUN ls -lt ./gs-gradle/complete
RUN ./gradlew run
RUN ls -ltr
