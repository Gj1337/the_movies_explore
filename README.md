# 🎬 The Movies Explore 🍿

## ℹ️ About

### Description
<div>
<img src="https://github.com/user-attachments/assets/b3df6418-7ee3-4955-b48f-beea2c4af805" width="200" align="left"/>

Discover the best and latest movies with *The movie explore* , available on both Android and iOS! Whether you're a fan of action, romance, thrillers, or documentaries, our app has something for everyone. Easily search by movie name, browse through genres, or explore curated top picks and the latest releases. Bookmark your favorite titles to build your personal watchlist and access them anytime, even without an internet connection, thanks to our built-in caching feature. Enjoy a fast, reliable, and user-friendly interface designed to make exploring movies a seamless experience. Stay updated with new additions and trending films, all at your fingertips!
</div>

***

### Screenshots and video
<div align="center">
	<img src="https://github.com/user-attachments/assets/9c04a569-da8f-4ff7-951b-2741e6b8ef25" width="250"/>
	<img src="https://github.com/user-attachments/assets/132b6387-05dd-40eb-8527-2f709f896027" width="250"/>
	<img src="https://github.com/user-attachments/assets/153708b8-6b07-4fc0-9c59-d9d5028a2770" width="250"/>
	<video src='https://github.com/user-attachments/assets/ff8df736-556e-4858-8a65-2f5975b3bb3c' width=250/>
</div>

## ⚙️ Stack 

* **Framework and PL** - [Flutter][Flutter] & [Dart][Dart] ❤️
* **State managment** - [Bloc][Bloc]
* **Data classes** - [Freezed][Freezed]
* **Inversion of Control and DI** - [GetIt][GetIt] & [injectable][injectable]
* **Storage** - [Shared prefernces][Shared_prefernces] (is about to [Drift][Drift] migration)
* **Network requests(http)** - [Retorfit][Retorfit] 
* **localization** - [intl][intl]
* **Navigation** - [Go router][Go_router]
* **Test** - [test][test] & [Mockito][Mockito] 

## 🛠️ Setup

### Flutter version
[FVM][FVM] has been setted up for the project, it is advisable to use it. 
Otherwise, you must use the version of flutter specified in [.fvmrc](./.fvmrc).

### Codogeneration

This project uses codogeneration, but generated files **AREN'T** pushed to repository, you have to generated them by yourself via next command 

```
flutter pub get && dart run build_runner build
```
### API token
Also, this project uses environment params for passing **API Read Access Token**, please, pass your **API Read Access Token** by env.param with name ApiReadAccessToken.


For example
```
    flutter run --dart-define=ApiReadAccessToken=Your API Read Access Token
```

Or check an appropriate way of setting up enviroment parameters for your IDE through this [link][Env_setup].

The **API Read Access Token** can be gained [here][API_token_source].

## ⬇️ Download
Currently, the project is ongoing and it hasn't been released to AppStore or PlayStore.

You can upload last version by following sources:

[<img src="https://raw.githubusercontent.com/ismartcoding/plain-app/main/assets/get-it-on-github.png" alt='Get it on GitHub' height="80">](GitHubDownload)

 <!--Links-->
[Flutter]: https://docs.flutter.dev
[Dart]: https://dart.dev/guides
[Bloc]: https://bloclibrary.dev
[Freezed]: https://pub.dev/packages/freezed
[GetIt]: https://pub.dev/packages/get_it
[injectable]: https://pub.dev/packages/injectable
[Shared_prefernces]: https://pub.dev/packages/shared_preferences
[Drift]: https://drift.simonbinder.eu
[Retorfit]: https://pub.dev/packages/retrofit
[intl]: https://pub.dev/packages/intl
[Go_router]: https://pub.dev/packages/go_router
[test]: https://pub.dev/packages/test
[Mockito]: https://pub.dev/packages/mockito
[API_token_source]: https://developer.themoviedb.org/docs/getting-started
[FVM]: https://fvm.app
[Env_setup]: https://dart.dev/guides/environment-declarations
[GitHubDownload]: https://github.com/Gj1337/the_movies_explore/releases/latest

