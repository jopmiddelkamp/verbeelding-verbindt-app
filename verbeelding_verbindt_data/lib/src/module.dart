import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  // Needed for the shared_preferences package
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();
  final fireStore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  return DataDependencies(
    locationRepository: SingletonAsync<LocationRepository>(
      () async => GlLocationRepositoryImpl(),
    ),
    artistRepository: SingletonAsync<ArtistRepository>(
      () async => FirestoreArtistRepository(
        firestore: fireStore,
      ),
      dispose: (param) => param.dispose(),
    ),
    routeRepository: SingletonAsync<RouteRepository>(
      () async => PersistentStorageRouteRepository(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
    specialityRepository: SingletonAsync<SpecialityRepository>(
      () async => FirestoreSpecialityRepository(
        firestore: fireStore,
      ),
      dispose: (param) => param.dispose(),
    ),
    routeGeneratorRepository: SingletonAsync<RouteGeneratorRepository>(
      () async => RouteXlRouteGeneratorRepository(
        http: dio, // Need custom
        baseUrl: environmentVariables.routeXl.baseUrl,
        username: environmentVariables.routeXl.username,
        password: environmentVariables.routeXl.password,
      ),
      dispose: (param) => param.dispose(),
    ),
    authRepository: SingletonAsync<AuthRepository>(
      () async => FirebaseAuthRepository(
        firebaseAuth: firebaseAuth,
      ),
      dispose: (param) => param.dispose(),
    ),
    localeRepository: SingletonAsync<LocaleRepository>(
      () async => PersistentStorageLocaleRepositoryImpl(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
    introRepository: SingletonAsync<IntroRepository>(
      () async => PersistentStorageIntroRepositoryImpl(
        sharedPreferences: sharedPreferences,
      ),
      dispose: (param) => param.dispose(),
    ),
  );
}
