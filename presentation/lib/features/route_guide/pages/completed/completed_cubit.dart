import 'package:rxdart/rxdart.dart';
import 'package:verbeelding_verbindt_core/repositories/page_content_repository.dart';

import '../../../../shared/bloc/cubit_base.dart';
import 'completed_state.dart';

class CompletedCubit extends CubitBase<CompletedState> {
  CompletedCubit({
    required PageContentRepository pageContentRepository,
  })  : _pageContentRepository = pageContentRepository,
        super(CompletedState.initialize()) {
    _init();
  }

  final PageContentRepository _pageContentRepository;

  Future<void> _init() async {
    await _pageContentRepository
        .getRouteCompletedPageContent()
        .takeUntil(dispose$)
        .listen((pageContent) {
      // TODO: Handle no data found
      if (pageContent == null) {
        return;
      }
      emit(CompletedState.load(
        content: pageContent,
      ));
    });
  }
}
