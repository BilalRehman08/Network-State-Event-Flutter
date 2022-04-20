import 'package:flutter/material.dart';

/// NetworkStreamWidget handles and displays streaming of network events
class NetworkStreamWidget extends StatelessWidget {
  /// Initialize NetworkStreamWidget with [key].
  const NetworkStreamWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _NetworkStateWidget(
      message: 'Not setup',
      color: Colors.red,
    );
  }
}

class _NetworkStateWidget extends StatelessWidget {
  final String message;
  final Color color;

  const _NetworkStateWidget({required this.message, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: color,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      duration: kThemeAnimationDuration,
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
