import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultTryAgainWidget extends StatelessWidget {
  const DefaultTryAgainWidget({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: onPressed,
              child: const Text('Try again'),
            ),
          ],
        ),
      );
}
