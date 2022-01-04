import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data_firebase.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final functions = FirebaseFunctions.instance;
  const dataModelFactory = DataModelFactoryImpl();

  if (environmentVariables.environment.isDevelopment) {
    // functions.useFunctionsEmulator('192.168.2.8', 5001);
  }

  return DataDependencies(
    artistRepository: SingletonAsync<ArtistRepository>(
      () async => ArtistRepositoryImpl(
        firestore: firestore,
        dataModelFactory: dataModelFactory,
      ),
      dispose: (param) => (param as ArtistRepositoryImpl).dispose(),
    ),
    specialityRepository: SingletonAsync<SpecialityRepository>(
      () async => SpecialityRepositoryImpl(
        firestore: firestore,
      ),
      dispose: (param) => (param as SpecialityRepositoryImpl).dispose(),
    ),
    authRepository: SingletonAsync<AuthRepository>(
      () async => AuthRepositoryImpl(
        firebaseAuth: auth,
      ),
      dispose: (param) => (param as AuthRepositoryImpl).dispose(),
    ),
    routeRepository: SingletonAsync<RouteRepository>(
      () async => RouteRepositoryImpl(
        firestore: firestore,
        dataModelFactory: dataModelFactory,
      ),
      dispose: (param) => (param as RouteRepositoryImpl).dispose(),
    ),
    routeGeneratorRepository: SingletonAsync<RouteGeneratorRepository>(
      () async => RouteGeneratorRepositoryImpl(
        functions: functions,
      ),
      dispose: (param) => (param as RouteGeneratorRepositoryImpl).dispose(),
    ),
  );
}
