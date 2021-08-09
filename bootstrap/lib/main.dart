import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:verbeelding_verbindt_core/aliases.dart';
import 'package:verbeelding_verbindt_core/entities/common/environment_enum.dart';
import 'package:verbeelding_verbindt_core/usecases/locale/get_active_locale_use_case.dart';
import 'package:verbeelding_verbindt_presentation/features/app/pages/app.dart';

import 'bootstrap.dart';

final serviceLocation = GetIt.instance;

Future<void> mainDelegate(
  Environment environment,
) async {
  runZonedGuarded(
    () async {
      await Bootstrap.boot(environment);
      final initialLocale =
          await serviceLocator<GetActiveLocaleUseCase>().handle();
      runApp(
        App.blocProvider(
          initialLocale: initialLocale,
        ),
      );
    },
    (error, stackTrace) => log(
      error.toString(),
      stackTrace: stackTrace,
    ),
  );
}
