import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:random_cat_facts/bloc/rand_fact_bloc.dart';
import 'package:random_cat_facts/components/colors.dart';

class FactsView extends StatelessWidget {
  const FactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();

    var date = DateFormat('HH:mm').format(now);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: CustomColors.eastBay,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<FactBloc, RandFactState>(
          builder: (context, state) {
            if (state is Loading) {
              return JumpingDotsProgressIndicator(
                fontSize: 60.0,
                color: Colors.white,
              );
            } else if (state is Loaded) {
              return Column(
                children: [
                  Text(
                    state.fact.fact,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    softWrap: true,
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    softWrap: true,
                  )
                ],
              );
            } else if (state is Failure) {
              return const Text(
                'An error occurred.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                softWrap: true,
              );
            } else {
              return const Text(
                'Generate a random fact by clicking on the button below.',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
              );
            }
          },
        ),
      ),
    );
  }
}
