import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../bloc/rand_fact_bloc.dart';
import 'downloading_image.dart';

class CatsImages extends StatelessWidget {
  const CatsImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FactBloc, RandFactState>(builder: (context, state) {
      if (state is Loading) {
        return const DownloadingImage();
      } else if (state is Loaded) {
        print('image loaded');
        return Container(
          height: 250,
          width: 300.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(state.image.imageUrl),
              fit: BoxFit.cover,
            ),
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        );
      } else if (state is Loading) {
        return JumpingDotsProgressIndicator(
          fontSize: 20.0,
          color: Colors.white,
        );
      } else if (state is Failure) {
        return const Text(
          'An error occurred.',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          softWrap: true,
        );
      } else {
        return Container(
          height: 250,
          width: 300.0,
          decoration: BoxDecoration(
            image: const DecorationImage(
              alignment: Alignment.center,
              matchTextDirection: true,
              repeat: ImageRepeat.noRepeat,
              image: NetworkImage("https://cataas.com/cat"),
            ),
            color: Colors.black,
            border: Border.all(
              color: Colors.black,
              width: 8,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }
    });
  }
}
