import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/character_details_bloc.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({Key? key, required String characterId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterDetailsBloc, CharacterDetailsState>(
      builder: (context, state) {
        return Stack(
          children: [
            if (state is CharacterDetailsErrorState) ...{
              const Text('Ops, error')
            } else if (state is CharacterDetailsResultState) ...{
              const Text(';)')
            } else ...{
              const Text('Loading')
            }
          ],
        );
      },
    );
  }
}
