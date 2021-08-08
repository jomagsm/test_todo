import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_todo/data/server_api/models/card_model.dart';
import 'package:test_todo/screens/task_list/tasks_bloc/tasks_bloc.dart';
import 'package:test_todo/theme/color_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ColorPalette.gray,
            bottom: TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context)!.onHold),
                Tab(text: AppLocalizations.of(context)!.inProgress),
                Tab(text: AppLocalizations.of(context)!.needsRevison),
                Tab(text: AppLocalizations.of(context)!.approved),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text("Car")),
              Center(child: Text("Transit")),
              Center(child: Text("Bike")),
              Center(child: Text("Bike"))
            ],
          ),
        ),
      ),
    ));
  }
}

class _TasksList extends StatelessWidget {
  final List<Cards> cardsList;
  const _TasksList({Key? key, required this.cardsList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: cardsList.length,
        itemBuilder: (_, index) {
          return Container(child: Text(cardsList[index].id.toString()),);
        });
  }
}
