import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:random_cat_facts/components/colors.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/pages/history/view/history_view.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Center(
            child: Text(
              "History",
            ),
          ),
          backgroundColor: CustomColors.flamingo,
        ),
        body: const HistoryView(),
      ),
    );
  }
}
