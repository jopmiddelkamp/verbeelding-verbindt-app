import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../common/extensions/build_context_extensions.dart';
import '../../common/services/persistent_storage/persistent_storage_service.dart';
import '../route_guide/pages/select_interests/select_interests_page.dart';
import 'bloc/page_cubit.dart';
import 'bloc/page_state.dart';
import 'widgets/continue_button.dart';
import 'widgets/description.dart';
import 'widgets/header.dart';

final sl = GetIt.instance;

class IntroPage extends StatelessWidget {
  IntroPage._();

  static Widget blocProvider() {
    return BlocProvider(
      create: (context) => PageCubit(
        persistentStorageService: sl<PersistentStorageService>(),
      ),
      child: BlocListener<PageCubit, PageState>(
        listener: (context, state) async {
          if (state.loaded && state.accepted!) {
            await context.navigator.pushNamed(
              SelectInterestsPage.routeName,
            );
          }
        },
        child: IntroPage._(),
      ),
    );
  }

  static MaterialPageRoute route() {
    return MaterialPageRoute(
      builder: (context) => IntroPage.blocProvider(),
    );
  }

  static const String routeName = '/route_guide/intro';

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const Header(),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: const Description(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: const ContinueButton(),
            ),
          ],
        ),
      ),
    );
  }
}
