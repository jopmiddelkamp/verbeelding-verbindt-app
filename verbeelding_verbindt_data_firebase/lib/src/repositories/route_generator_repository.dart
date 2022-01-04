import 'package:cloud_functions/cloud_functions.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';
import 'package:verbeelding_verbindt_data/verbeelding_verbindt_data.dart';

import '../../verbeelding_verbindt_data_firebase.dart';

class RouteGeneratorRepositoryImpl extends RepositoryBase
    implements RouteGeneratorRepository {
  RouteGeneratorRepositoryImpl({
    required this.functions,
  });

  final FirebaseFunctions functions;

  @override
  Future<List<Artist>> generateRoute({
    required final Set<String> artistIds,
    required Geolocation userLocation,
  }) async {
    try {
      final callable = FirebaseFunctions.instance.httpsCallable(
        'generateRoute',
      );
      final input = GenerateRouteRequestDataModel(
        artistIds: artistIds,
        userLocation: userLocation.toDataModel(),
      );
      final temp = input.toJson();
      final resp = await callable(temp);
      final jsonList = resp.jsonData as List;
      final result = jsonList.map((json) {
        return ArtistDataModel.fromJson(json).toEntity();
      }).toList();
      return result;
    } on Exception {
      rethrow;
    }
  }
}
