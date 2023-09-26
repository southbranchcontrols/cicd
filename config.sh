#!/bin/bash

mkdir -p "${HOME}/.ssh"
gpg --quiet --batch --yes --decrypt --passphrase=${SBC_GPG_PASSWORD} --output $HOME/.ssh/id_rsa .github/id_rsa.gpg
gpg --quiet --batch --yes --decrypt --passphrase=${SBC_GPG_PASSWORD} --output $HOME/.ssh/id_rsa.pub .github/id_rsa.pub.gpg
gpg --quiet --batch --yes --decrypt --passphrase=${SBC_GPG_PASSWORD} --output $HOME/.ssh/known_hosts .github/known_hosts.gpg
chmod 600 "${HOME}/.ssh/id_rsa"
chmod 600 "${HOME}/.ssh/id_rsa.pub"
chmod 600 "${HOME}/.ssh/known_hosts"

case "${GITHUB_REF}" in
  "refs/heads/main") SBC_RELEASE="latest" ;;
  "refs/heads/stable") SBC_RELEASE="stable" ;;
esac
export PRODUCT_DEPLOY_PATH=/opt/avn/store/${SBC_RELEASE}/${SBC_PRODUCT}

echo "Build date=$(date)"
echo "GITHUB_REF=${GITHUB_REF}"
echo "PRODUCT_DEPLOY_PATH=${PRODUCT_DEPLOY_PATH}"

echo "JAVA_DISTRO=temurin" >> $GITHUB_ENV
echo "JAVA_PACKAGE=jdk" >> $GITHUB_ENV
echo "JAVADOC_TARGET_PATH=/opt/sbc/web/product/${SBC_PRODUCT}/javadoc" >> $GITHUB_ENV
echo "PRODUCT_DEPLOY_PATH=${PRODUCT_DEPLOY_PATH}" >> $GITHUB_ENV
