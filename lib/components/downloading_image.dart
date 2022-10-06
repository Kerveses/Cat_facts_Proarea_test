import 'package:flutter/material.dart';

class DownloadingImage extends StatelessWidget {
  const DownloadingImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 300.0,
      decoration: BoxDecoration(
        image: const DecorationImage(
          alignment: Alignment.center,
          matchTextDirection: true,
          repeat: ImageRepeat.repeat,
          image: AssetImage("assets/dancing-kitten.gif"),
        ),
        border: Border.all(
          color: Colors.black,
          width: 8,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
