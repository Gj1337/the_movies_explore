# The movies explore

<div align="center">
	<img src="doc/example.gif" width="300"/>
</div>


### Setup
This project uses codogeneration, but generated files **AREN'T** pushed to repository, you have generated them yourself by next command 

```
flutter pub get && dart run build_runner build
```

Also this project uses environment params for passing **API Read Access Token**, please pass your **API Read Access Token** by env.param with name ApiReadAccessToken.

For example
```
    flutter run --dart-define=ApiReadAccessToken=Your API Read Access Token
```