import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

/// NetworkStreamWidget handles and displays streaming of network events
class NetworkStreamWidget extends StatefulWidget {
  /// Initialize NetworkStreamWidget with [key].
  const NetworkStreamWidget({Key? key}) : super(key: key);

  @override
  State<NetworkStreamWidget> createState() => _NetworkStreamWidgetState();
}

class _NetworkStreamWidgetState extends State<NetworkStreamWidget> {
  // final _eventChannel =
  //     const EventChannel('platform_channel_events/connectivity');

  final networkStream =
      const EventChannel('platform_channel_events/connectivity')
          .receiveBroadcastStream()
          .distinct()
          .map((dynamic event) => intToConnection(event as int));

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
