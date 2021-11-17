# messenger

[![codecov](https://codecov.io/gh/defuncart/messenger/branch/main/graph/badge.svg?token=A4NK1ZBPON)](https://codecov.io/gh/defuncart/messenger)

A messaging application for mobile and desktop.

## Getting Started

To build the app locally, the following tools are required:

- Flutter stable >= 2.5
- Dart >= 2.14
- macOS:
    - Xcode >= 12.4
    - CocoaPods >= 1.11.0
- Web:
    - Chrome

Also you need to create a Firebase project and [integrate it](https://firebase.google.com/docs/flutter/setup).

Note that to speed up development build times, a [pre-compiled version of Firestore](https://github.com/invertase/firestore-ios-sdk-frameworks#supported-firebase-ios-sdk-versions) on iOS and macOS is used.

## Code Generation

### Localizations

To add new localizations, update `assets_dev/loca/loca.csv` and run

```sh
sh bin/loca_generate.sh
```

## Credits

This application is developed for personal use, and is inspired by Messenger Lite, Telegram and WhatsApp.

## Raising Issues and Contributing

Please report bugs and issues, and raise feature requests [here](https://github.com/defuncart/messenger/issues).

To contribute, submit a PR with a detailed description and tests, if applicable.
