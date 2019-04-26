FROM centos

RUN yum install -y java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/

# Set up the Atlassian SDK repositories.
COPY artifactory.repo /etc/yum.repos.d/

# Run the installation.
RUN yum -y install atlassian-plugin-sdk-8.0.7

# Verify that you have set up the SDK correctly.
VOLUME /plugin /m2
ENV ATLAS_OPTS "-Dmaven.repo.local=/m2/repository"
WORKDIR /plugin
CMD ["atlas-version"]