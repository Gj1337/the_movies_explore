import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExtension on BuildContext {
  AppLocalizations get localizations =>
      AppLocalizations.of(this) ??
      (throw Exception('Can\'t get AppLocalization'));
}
