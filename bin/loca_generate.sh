#!/usr/bin/env bash

# enable arb_utils globally on machine
# if already enabled, this will download latest version, if one is available
dart pub global activate arb_utils

# generate from csv
dart run arb_generator

# sort arbs
pub global run arb_utils:sort assets_dev/l10n/l10n_en.arb

# generate localization delegates
flutter pub get