import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:random_cat_facts/database/services/CatFactsRecordsService.dart';
import 'package:random_cat_facts/repository/image_repository.dart';

import 'package:random_cat_facts/pages/home/home_page.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/repository/fact_repository.dart';

import 'package:hive_flutter/hive_flutter.dart';

import 'bloc/rand_fact_bloc.dart';

late Box box;
late CatFactsRecordsService recordsService = CatFactsRecordsService();

Future<void> main() async {
  await Hive.initFlutter();
  await recordsService.init();

  final factRepository = FactRepository(factApiClient: FactApiClient(Dio()));
  final imageRepository =
      ImageRepository(imageApiClient: ImageApiClient(Dio()));

  runApp(MyApp(repository: factRepository, imageRepository: imageRepository));
}

class MyApp extends StatelessWidget {
  final FactRepository repository;
  final ImageRepository imageRepository;

  const MyApp(
      {Key? key, required this.repository, required this.imageRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: RepositoryProvider.value(
          value: (context) {
            return [repository, imageRepository];
          },
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => FactBloc(
                  factRepository: repository,
                  imageRepository: imageRepository,
                ),
              ),
            ],
            child: HomePage(),
          ),
        ),
      ),
    );
  }
}
