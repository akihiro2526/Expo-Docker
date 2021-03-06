# Expo Docker

Expo 実行環境

## Feature

- Expo 実行環境
- SSH 接続時のパスワード入力不要

## Usage

事前に秘密鍵と公開鍵を作成しておく
```
ssh-keygen
```
※ `id_rsa` 以外の場合は `Makefile` を変更

1.環境変数を設定

```
# username [default - user]
USERNAME=

# ssh port [default - 8022]
SSH_PORT=

# Nodejs version [default - Active LTS version]
NODE_VERSION=

# Yarn version [default - Latest version]
YARN_VERSION=

# expo-cli version [default - Latest version]
EXPO_VERSION=

# private IP address [Automatically generated]
LOCAL_IP_ADDR=
```

2.コンテナ起動 

```
make docker
```

## Distribution
Ubuntu 20.04

## Package
- zip
- curl
- dpkg
- gnupg
- git
- sudo
- openssh-server
- build-essential
- g++
- nvm
- node
- npm
- yvm
- yarn
- expo
- expo-cli