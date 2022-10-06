import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:random_cat_facts/components/colors.dart';

import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/pages/home/view/home_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final FactApiClient factApiClient = FactApiClient(Dio());

  final ImageApiClient imageApiClient = ImageApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            CustomColors.flamingo,
            CustomColors.riverBed,
          ],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: HomeView(),
      ),
    );
  }
}
