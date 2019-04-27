FROM centos

# Install the JDK.
RUN yum install -y java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/

# Install the Atlassian SDK.
# https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/
COPY artifactory.repo /etc/yum.repos.d/
RUN yum -y install atlassian-plugin-sdk-8.0.7

# Define volumes for sources and cache.
VOLUME /plugin /m2

# Expose port for confluence
# https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run-standalone/
EXPOSE 1990

# Expose port for jira
# https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run-standalone/
EXPOSE 2990

# Expose port for debugger
# https://developer.atlassian.com/server/framework/atlassian-sdk/creating-a-remote-debug-target/
EXPOSE 5005

# Execute the command in plugin directory.
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT cd /plugin && /entrypoint.sh $0 $@

# Define default command.
CMD ["atlas-version"]