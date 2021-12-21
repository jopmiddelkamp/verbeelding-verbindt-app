import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../../../../verbeelding_verbindt_ui.dart';

class CompletedPage extends StatelessWidget {
  const CompletedPage({Key? key}) : super(key: key);

  static const String name = 'route_guide_completed';

  static void go(BuildContext context) => context.goNamed(name);

  BlocProvider<GuideCompletedCubit> _blocProvider(
    WidgetBuilder builder,
  ) {
    return BlocProvider(
      create: (_) {
        return GuideCompletedCubit(
          deleteRouteUseCase: GetIt.instance(),
          getUsersRouteUseCase: GetIt.instance(),
        )..init();
      },
      child: Builder(builder: builder),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return _blocProvider((context) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: const _CloseButton(),
        ),
        body: const _Body(),
      );
    });
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: <Widget>[
        const _Header(),
        Expanded(
          child: Markdown(
            data: context.l10n.pageCompletedText,
            padding: const EdgeInsets.all(PaddingSize.medium),
          ),
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Stack(
        children: [
          Positioned.fill(
            child: Asset.introHeader.toImage(
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: DefaultTextStyle(
              style: context.textTheme.headline6!.copyWith(
                color: Colors.white,
                fontWeight: VVFontWeight.bold,
              ),
              child: Text(
                context.l10n.pageCompletedTitle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<GuideCompletedCubit, GuideCompletedState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 100),
          transitionBuilder: (child, animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: state.map(
            initializing: (_) => const SizedBox.shrink(),
            loaded: (_) => IconButton(
              icon: const Icon(Icons.close),
              onPressed: () async {
                final result = await showConfirmDialog(
                  context,
                  content: context.l10n.pageCompletedPopConfirmMessage,
                );
                if (result) {
                  await context.read<GuideCompletedCubit>().delete();
                  SelectInterestsPage.go(context);
                }
              },
            ),
            failed: (_) => const FailureStateDisplay(),
          ),
        );
      },
    );
  }
}
