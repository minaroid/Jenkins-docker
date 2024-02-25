FROM jenkins/jenkins:2.440.1-alpine-jdk21

# Skip initial setup
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false

# Installing Custom Plugins 
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

# Installing Docker 
USER root
RUN apk add docker

USER jenkins