# Expo Docker

Expo 開発環境

## Feature

- SSH 接続時のパスワード入力不要
- Expo 開発環境

## Usage

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

# private IP address [automatically generated]
LOCAL_IP_ADDR=
```

2.コンテナ起動 

```
make docker
```

## Package
- Ubuntu 20.04
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