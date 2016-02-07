FROM alpine:3.3
MAINTAINER Gravebot

# Setup system deps
# RUN apk add --update fontconfig git libxml2-dev nodejs python build-base curl bash
RUN apk add --update fontconfig git nodejs curl bash

# Fix PhantomJS
RUN curl -o glibc-2.22-r5.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/14/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/builder/x86_64/glibc-2.22-r5.apk"
RUN curl -o glibc-bin-2.22-r5.apk "https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/14/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/builder/x86_64/glibc-bin-2.22-r5.apk"
RUN apk add --allow-untrusted glibc-2.22-r5.apk glibc-bin-2.22-r5.apk
RUN rm glibc-2.22-r5.apk glibc-bin-2.22-r5.apk
RUN /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib
RUN ln -s /lib/libz.so.1 /usr/lib/libz.so.1 && ln -s /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2

# TODO Pull this from build variables
# RUN npm install -g npm@3.7.1
RUN mkdir /app
WORKDIR /app/
RUN npm install phantomjs-prebuilt


# Copy bot
# COPY . /app/
# WORKDIR /app/
#
# # Install node deps
# RUN npm install --production
# # For some reason postinstall fails when done through npm install
# RUN npm run postinstall
#
# # Cleanup
# RUN rm -rf tests/ src/
# RUN apk del git python build-base libxml2-dev curl
# RUN rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
#
# ENV PREFIX !
# ENV PORT 5000
# EXPOSE $PORT

# CMD ["npm", "start"]
