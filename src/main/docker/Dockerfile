FROM adoptopenjdk/openjdk8:jdk8u212-b03-alpine

# Install the Atlassian SDK.
# https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/
ENV ATLAS_VERSION=8.0.7
ENV ATLAS_HOME="/opt/atlassian-plugin-sdk-${ATLAS_VERSION}"
ENV ATLAS_OPTS="-Dmaven.repo.local=/m2/repository"
RUN apk add --no-cache bash curl && \
    curl -jkSL -o /opt/sdk.tar.gz \
         https://maven.atlassian.com/content/repositories/atlassian-public/com/atlassian/amps/atlassian-plugin-sdk/${ATLAS_VERSION}/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz && \
         tar -C /opt -xf /opt/sdk.tar.gz && \
         rm /opt/sdk.tar.gz
# https://community.developer.atlassian.com/t/atlassian-plugin-sdk-8-atlas-integration-test/26927
RUN sed -i -e 's/MVN_COMMAND=".*:integration-test"/MVN_COMMAND="integration-test"/g' ${ATLAS_HOME}/bin/atlas-integration-test

# Define volumes for sources and cache.
VOLUME /plugin /m2

# Expose ports for apps and remote debugging
# https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run-standalone/
EXPOSE 1990 2990 5990 5005

# Execute the command in plugin directory.
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh $0 $@

# Define default command.
ENV PATH="${ATLAS_HOME}/bin:${PATH}"
CMD ["atlas-version"]