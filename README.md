# Hive - Flutter

## The aim of the solution is to provide a simplified POC to the developers who are working hard to find solution for hive database issues.

[![N|Solid](https://raw.githubusercontent.com/9series-flutter/hive-db-flutter-poc/master/android/app/src/main/res/playstore-icon.png)](https://www.9series.com/)

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://github.com/9series-flutter)

It is a local-storage, mobile-ready, compatible, Flutter-powered Google and Android Studio editor.

- Flutter App
- Using flutter BLOC patterns.
- Using Hive for local data storage

## Features

- Add Product
- Delete Product
- Product List
- Add Product to Cart
- Remove Product from Cart
- Cart List

Flutter is a lightweight markup language based on the formatting conventions that people naturally
use in Mobile App. As [Darshan Vachhani](https://github.com/darshanvachhani08) writes code on the
project. [Linkedin site][df1]

## Tech

It uses a number of open source SDK:

- [flutter] - Flutter enhanced for mobile and web apps!
- [Android Studio Editor] - awesome IDE-based text editor

And of course Probook itself isn't open source with a [public repository][repo]
on GitHub.

## Installation

Probook requires [flutter][flutter] Version flutter_macos_<LATEST> to run.

Install the dependencies and devDependencies and start the server.

```sh
cd ~/development
unzip ~/Downloads/flutter_macos_<LATEST>-stable.zip
export PATH="$PATH:`pwd`/flutter/bin"
```

Run flutter doctor...

```sh
flutter doctor
flutter run
```

## Plugins

ProBook is currently extended with the following plugins. Instructions on how to use them in your
own application are linked below.

| Plugin       | README                    |
|--------------|---------------------------|
| BLOC         | [README.md][bloc]         |
| HIVE         | [README.md][hive]         |
| HIVE_FLUTTER | [README.md][hive_flutter] |

## License

9Series

**App Development Software, [Hello Yeah](https://www.9series.com/contact-us.html)!**


[df1]: <https://www.linkedin.com/in/darshan-solid/>

[Android Studio Editor]: <https://developer.android.com/%E2%88%9A?gclid=Cj0KCQjw1a6EBhC0ARIsAOiTkrFKeGq_xJIBQkPbzkLmpPJF8p6Vf1prohQqbacOkv7DioZKkaLqtwQaAvzHEALw_wcB&gclsrc=aw.ds>


[flutter]: <https://flutter.dev/>


[bloc]: <https://pub.dev/packages/flutter_bloc>

[hive]: <https://pub.dev/packages/hive>

[hive_flutter]: <https://pub.dev/packages/hive_flutter>

