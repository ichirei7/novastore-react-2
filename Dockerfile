FROM jenkins/jenkins:lts-jdk17

USER root

# Install dependencies + Node 18 via NVM
RUN apt-get update && apt-get install -y curl git build-essential && rm -rf /var/lib/apt/lists/* \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.6/install.sh | bash \
    && export NVM_DIR="$HOME/.nvm" \
    && [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" \
    && nvm install 18 \
    && nvm use 18 \
    && npm install -g pnpm

USER jenkins
