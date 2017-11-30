FROM ubuntu:16.04

RUN mv /etc/apt/sources.list  /etc/apt/sources.list.bak
ADD ./conf/sources.list  /etc/apt/

RUN apt-get update -y
RUN apt-get install wget curl vim  -y 

ADD ./lib/jdk-8u152-linux-x64.tar.gz     /usr/local/lib/
ADD ./lib/apache-maven-3.5.2-bin.tar.gz  /usr/local/lib/
ADD ./lib/nexus-3.6.1-02-unix.tar.gz     /usr/local/lib

ADD ./script/   /data/script/

ENV JAVA_HOME="/usr/local/lib/jdk1.8.0_152"
ENV CLASSPATH="${JAVA_HOME}/jre/lib/rt.jar:${JAVA_HOME}/lib/dt.jar:${JAVA_HOME}/lib/tools.jar"
ENV MAVEN_HOME="/usr/local/lib/apache-maven-3.5.2"
ENV NEXUS_HOME="/usr/local/lib/nexus-3.6.1-02"
ENV PATH=".:${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${CLASSPATH}:${PATH}"

RUN echo "run_as_user=root" >>${NEXUS_HOME}/bin/nexus.rc
RUN sed -i '/INSTALL4J_JAVA_HOME/aINSTALL4J_JAVA_HOME_OVERRIDE=/usr/local/lib/jdk1.8.0_152/' ${NEXUS_HOME}/bin/nexus


CMD ["/data/script/startup.sh"]


EXPOSE 7890
EXPOSE 8081
EXPOSE 8085
