import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

import '../verbeelding_verbindt_data_firebase.dart';

Future<DataDependencies> getDependencies(
  EnvironmentVariables environmentVariables,
) async {
  final fireStore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;
  const dataModelFactory = DataModelFactoryImpl();

  return DataDependencies(
    artistRepository: SingletonAsync<ArtistRepository>(
      () async => ArtistRepositoryImpl(
        firestore: fireStore,
        dataModelFactory: dataModelFactory,
      ),
      dispose: (param) => (param as ArtistRepositoryImpl).dispose(),
    ),
    specialityRepository: SingletonAsync<SpecialityRepository>(
      () async => SpecialityRepositoryImpl(
        firestore: fireStore,
      ),
      dispose: (param) => (param as SpecialityRepositoryImpl).dispose(),
    ),
    authRepository: SingletonAsync<AuthRepository>(
      () async => AuthRepositoryImpl(
        firebaseAuth: firebaseAuth,
      ),
      dispose: (param) => (param as AuthRepositoryImpl).dispose(),
    ),
    routeRepository: SingletonAsync<RouteRepository>(
      () async => RouteRepositoryImpl(
        firestore: fireStore,
        dataModelFactory: dataModelFactory,
      ),
      dispose: (param) => (param as RouteRepositoryImpl).dispose(),
    ),
  );
}
