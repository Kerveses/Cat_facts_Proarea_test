import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat_facts/bloc/rand_fact_bloc.dart';
import 'package:random_cat_facts/components/colors.dart';
import 'package:random_cat_facts/pages/history/history_page.dart';

class GenerateFactButton extends StatelessWidget {
  const GenerateFactButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: CustomColors.thunderbird,
        shadowColor: Colors.black,
      ),
      onPressed: () {
        context.read<FactBloc>().add(FactEventPressed());
      },
      child: const Text(
        'Generate a Random Fact about cat !',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class HistoryButton extends StatelessWidget {
  const HistoryButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: CustomColors.eastBay,
        shadowColor: Colors.black,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HistoryPage()),
        );
      },
      child: const Text(
        'Go To History..!',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
