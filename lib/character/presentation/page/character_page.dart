import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rick_and_morty/character/presentation/bloc/character_bloc.dart';
import 'package:flutter_rick_and_morty/character/presentation/widget/character_widget.dart';
import 'package:get_it/get_it.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I.get<CharacterBloc>()..add(CharacterRequestEvent()),
      child: const CharacterWidget(),
    );
  }
}
