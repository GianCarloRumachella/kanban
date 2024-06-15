import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/home/presentation/controllers/home_controller.dart';

class AppRadioButtonsStatusWidget extends StatefulWidget {
  final TaskStatusEnum initialState;

  const AppRadioButtonsStatusWidget({super.key, required this.initialState});

  @override
  State<AppRadioButtonsStatusWidget> createState() => _AppRadioButtonsStatusWidgetState();
}

class _AppRadioButtonsStatusWidgetState extends State<AppRadioButtonsStatusWidget> {
  TaskStatusEnum? status;

  @override
  void initState() {
    super.initState();
    status = widget.initialState;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<TaskStatusEnum>(
          title: const Text('Not Started'),
          value: TaskStatusEnum.notStarted,
          groupValue: status,
          onChanged: (TaskStatusEnum? value) {
            setState(() {
              status = value;
              Modular.get<HomeController>().status = value ?? TaskStatusEnum.notStarted;
            });
          },
        ),
        RadioListTile<TaskStatusEnum>(
          title: const Text('Started'),
          value: TaskStatusEnum.started,
          groupValue: status,
          onChanged: (TaskStatusEnum? value) {
            setState(() {
              status = value;
              Modular.get<HomeController>().status = value ?? TaskStatusEnum.notStarted;
            });
          },
        ),
        RadioListTile<TaskStatusEnum>(
          title: const Text('Doing'),
          value: TaskStatusEnum.doing,
          groupValue: status,
          onChanged: (TaskStatusEnum? value) {
            setState(() {
              status = value;
              Modular.get<HomeController>().status = value ?? TaskStatusEnum.notStarted;
            });
          },
        ),
        RadioListTile<TaskStatusEnum>(
          title: const Text('Finished'),
          value: TaskStatusEnum.finished,
          groupValue: status,
          onChanged: (TaskStatusEnum? value) {
            setState(() {
              status = value;
              Modular.get<HomeController>().status = value ?? TaskStatusEnum.notStarted;
            });
          },
        ),
      ],
    );
  }
}
