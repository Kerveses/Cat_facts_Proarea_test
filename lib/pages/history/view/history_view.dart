import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:random_cat_facts/database/fact_record.dart';
import 'package:random_cat_facts/main.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<FactRecord> records = recordsService.getRecords();
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.separated(
        itemCount: records.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Text(
                "${records[index].text} (Created: ${DateFormat('dd-MM-yyyy').format(DateTime.fromMicrosecondsSinceEpoch(records[index].creationDateTime))})",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const Divider(
            height: 2,
            color: Colors.black,
          );
        },
      ),
    );
  }
}
