import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/app_snackbar_widget.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/app_textformfield_widget.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/task_create_alert_widget.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/task_list_widget.dart';
import 'package:kanban/modules/core/validators/validator.dart';
import 'package:kanban/modules/home/presentation/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    _controller = Modular.get<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Kanban'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          child: const Text('Load tasks'),
                          onPressed: () {
                            _controller.getTasks(context);
                          },
                        ),
                        ElevatedButton(
                          child: const Text('Add Task'),
                          onPressed: () {
                            TaskCreateAlertWidget.alert(
                              context: context,
                              title: "Nova Tarefa",
                              body: <Widget>[
                                Form(
                                  key: _controller.createTaskKey,
                                  child: AppTextFormField(
                                    controller: _controller.titleController,
                                    validator: (value) {
                                      return Validator.isEmpty(value ?? '');
                                    },
                                  ),
                                ),
                              ],
                              buttons: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Modular.to.pop();
                                    },
                                    child: const Text("Cancelar"),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_controller.validateForm()) {
                                        _controller.createNewTask(context);
                                      } else {
                                        AppSnackbarWidget.snackBar(context: context, message: "Nome da tarefa não pode ser vazio");
                                      }
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TaskList(
                          list: _controller.notStartedList,
                          listTitle: TaskStatusEnum.notStarted.name,
                        ),
                        const SizedBox(width: 12),
                        TaskList(
                          list: _controller.startedList,
                          listTitle: TaskStatusEnum.started.name,
                        ),
                        const SizedBox(width: 12),
                        TaskList(
                          list: _controller.doingList,
                          listTitle: TaskStatusEnum.doing.name,
                        ),
                        const SizedBox(width: 12),
                        TaskList(
                          list: _controller.finishedList,
                          listTitle: TaskStatusEnum.finished.name,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
