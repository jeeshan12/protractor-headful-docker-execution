FROM node:12.22.3-buster

RUN apt-get update; apt-get clean

# Install xvfb.
RUN apt-get install -y xvfb
# Install fluxbox.
RUN apt-get install -y fluxbox
# Install wget.
RUN apt-get install -y wget
# Install wmctrl.
RUN apt-get install -y wmctrl

WORKDIR /app

ARG CHROME_VERSION="google-chrome-stable"
RUN rm -rf /var/lib/apt/lists/* && apt update
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install \
    ${CHROME_VERSION:-google-chrome-stable} --force-yes \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Install app dependencies
COPY package.json /app/
RUN npm install --quiet

COPY . /app

RUN chmod +x entrypoint.sh

ENTRYPOINT sh entrypoint.sh
