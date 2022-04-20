import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

/// ImageStreamWidget handles and displays streaming of image bytes
class ImageStreamWidget extends StatefulWidget {
  /// Initialize ImageStreamWidget with [key].
  const ImageStreamWidget({Key? key}) : super(key: key);

  @override
  _ImageStreamWidgetState createState() => _ImageStreamWidgetState();
}

class _ImageStreamWidgetState extends State<ImageStreamWidget> {
  final imageBytes = <int>[];
  int? imageSize;
  StreamSubscription<dynamic>? imageSubscription;
  bool streamComplete = false;

  @override
  Widget build(BuildContext context) {
    final imageStreamUnbegun = imageSize == null && !streamComplete;
    final imageStreamInProgress = imageSize != null && !streamComplete;
    final imageStreamEnded = imageSize != null && streamComplete;

    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      alignment: Alignment.center,
      child: Builder(builder: (c) {
        if (imageStreamUnbegun) {
          return ElevatedButton(
            onPressed: startImageStream,
            child: const Text('Stream Image'),
          );
        }

        if (imageStreamInProgress) {
          double progress;
          if (imageBytes.isEmpty || imageSize == 0) {
            progress = 0.0;
          } else {
            progress = (imageBytes.length / imageSize!);
          }

          return SizedBox(
            width: 100,
            height: 100,
            child: CircularProgressIndicator(
              value: progress,
              strokeWidth: 3,
            ),
          );
        }

        if (imageStreamEnded) {
          return Image.memory(Uint8List.fromList(imageBytes));
        }

        return const SizedBox();
      }),
    );
  }

  @override
  void dispose() {
    imageSubscription?.cancel();
    super.dispose();
  }

  void startImageStream() {}
}
