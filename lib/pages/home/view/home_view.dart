import 'package:flutter/material.dart';

import 'package:random_cat_facts/components/buttons.dart';
import 'package:random_cat_facts/components/cat_image.dart';
import 'package:random_cat_facts/components/facts_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            const CatsImages(),
            const FactsView(),
            Column(
              children: const [
                GenerateFactButton(),
                SizedBox(
                  height: 10,
                ),
                HistoryButton(),
              ],
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
