import '../../entities/common/locale.dart';
import '../../repositories/locale_repository.dart';
import '../use_case_base.dart';
import 'lookup_maps/locale_lookup_map.dart';

class GetInactiveLocalesUseCase extends UseCase<List<LocaleEntity>> {
  GetInactiveLocalesUseCase({
    required LocaleRepository localeRepository,
  }) : _localeRepository = localeRepository;

  final LocaleRepository _localeRepository;

  @override
  Future<List<LocaleEntity>> handle() async {
    final activeIsoLanguge = await _localeRepository.getActiveIsoLanguage();
    return localesLookup.entries
        .where((entry) => entry.key != activeIsoLanguge)
        .map((entry) => entry.value)
        .toList();
  }
}
