# quarkus-native-build-docker-action

Action to build a native executable from your Quarkus app.

A default Dockerfile is used but you can specify a custom Docker via the *dockerfilePath* option.

A *app-runner* binary file will be generated after the execution of this action.

### Parameters

| Argument   | Description |
|--------|-------------|
| outputName  | Name of the resulting executable binary file. _Required_  |
| dockerfilePath  | Path to Dockerfile. _Optional_  |

### Exemple d'utilisation

```
on: [push]

jobs:
  native_build:
    runs-on: ubuntu-latest
    name: Build native Quarkus app
    steps:
      - name: Checkout the code
        uses: actions/checkout@master
      - name: Build native executable and upload it as an artifact
        uses: maxday/quarkus-native-build-docker-action@1
          outputName: myApp-runner
          dockerfilePath: Dockerfile

```
