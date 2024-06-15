import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/app_bottomsheet_widget.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/app_radio_buttons_status_widget.dart';
import 'package:kanban/modules/home/presentation/controllers/home_controller.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.backgroundColor, required this.taskName, required this.id, required this.status});

  final Color backgroundColor;
  final String taskName;
  final int id;
  final TaskStatusEnum status;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("abrindo as opções da tarefa $taskName - id: $id");
        AppBottomsheetWidget.bottomsheet(
          context: context,
          body: <Widget>[
            Text(taskName),
            AppRadioButtonsStatusWidget(
              initialState: status,
            ),
            ElevatedButton(
              onPressed: () {
                debugPrint("salvando");
                Modular.get<HomeController>().updateTask();
                Modular.to.pop();
              },
              child: const Text("Salvar"),
            ),
          ],
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.4,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.all(8),
              color: backgroundColor,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(taskName, textAlign: TextAlign.start),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
