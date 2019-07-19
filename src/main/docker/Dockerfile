FROM adoptopenjdk/openjdk8:jdk8u212-b03-alpine

# Install the Atlassian SDK.
# https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/
ENV ATLAS_VERSION=8.0.16
ENV ATLAS_HOME="/opt/atlassian-plugin-sdk-${ATLAS_VERSION}"
ENV ATLAS_OPTS="-Dmaven.repo.local=/m2/repository"
RUN apk add --no-cache bash curl && \
    curl -jkSL -o /opt/sdk.tar.gz \
         https://maven.atlassian.com/content/repositories/atlassian-public/com/atlassian/amps/atlassian-plugin-sdk/${ATLAS_VERSION}/atlassian-plugin-sdk-${ATLAS_VERSION}.tar.gz && \
         tar -C /opt -xf /opt/sdk.tar.gz && \
         rm /opt/sdk.tar.gz

# https://github.com/AdoptOpenJDK/openjdk-docker/issues/75
RUN apk add --no-cache fontconfig
RUN ln -s /usr/lib/libfontconfig.so.1 /usr/lib/libfontconfig.so && \
    ln -s /lib/libuuid.so.1 /usr/lib/libuuid.so.1 && \
    ln -s /lib/libc.musl-x86_64.so.1 /usr/lib/libc.musl-x86_64.so.1
ENV LD_LIBRARY_PATH /usr/lib
RUN mkdir /usr/share/fonts

# Install google font.
RUN curl https://fonts.google.com/download?family=Roboto -L -o roboto.zip && \
    unzip roboto.zip -d /usr/share/fonts && \
    rm roboto.zip

# Define volumes for sources and cache.
VOLUME /plugin /m2

# Expose ports for apps and remote debugging
# https://developer.atlassian.com/server/framework/atlassian-sdk/atlas-run-standalone/
EXPOSE 1990 2990 5990 5005

# Define entrypoint.
COPY entrypoint*.sh /
RUN chmod +x /entrypoint*.sh
ENTRYPOINT /entrypoint.sh $0 $@

# Define default command.
ENV PATH="${ATLAS_HOME}/bin:${PATH}"
CMD ["atlas-version"]