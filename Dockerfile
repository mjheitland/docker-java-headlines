# docker build -t mjheitland/printheadliens:java .
# docker run mjheitland/printheadliens:java
FROM openjdk:13

# add a new system user "java" without login access and use this user to run the container (rather than using root)
RUN adduser -r java 
WORKDIR /src
RUN chown java /src
USER java

# download jsoup packages = reading DOM tree of HTML document
ENV JSOUP_VER 1.12.1
RUN curl -SL https://jsoup.org/packages/jsoup-$JSOUP_VER.jar -o jsoup-$JSOUP_VER.jar

# copy java source and build a jar file; -cp = classpath
COPY printheadlines.java /src/
RUN javac -verbose -cp /src/jsoup-$JSOUP_VER.jar:. printheadlines.java

# run printheadlines when container starts
CMD java -cp jsoup-$JSOUP_VER.jar:. printheadlines
