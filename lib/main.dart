import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty/home/presentation/page/home_page.dart';
import 'package:flutter_rick_and_morty/injection.dart';
import 'package:flutter_rick_and_morty/shared/theme/application_theme.dart';
import 'package:flutter_rick_and_morty/shared/theme/data/cubit/theme_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'details/presentation/page/details_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(
    DevicePreview(
      builder: (_) {
        return const RickAndMortyApp();
      },
    ),
  );
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (_) => GetIt.I.get<ThemeCubit>(),
      child: const _App(),
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomePage(),
        routes: <RouteBase>[
          GoRoute(
            name: 'details',
            path: 'details/:id',
            builder: (context, state) => DetailsPage(
              characterId: state.params['id'] ?? '1',
            ),
          )
        ])
  ],
);

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, String>(
      builder: (_, state) => MaterialApp.router(
        routerConfig: _router,
        theme: ApplicationTheme.byName(state)?.themeData,
      ),
    );
  }
}
