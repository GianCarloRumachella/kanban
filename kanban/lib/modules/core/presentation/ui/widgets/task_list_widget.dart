import 'package:flutter/material.dart';
import 'package:kanban/modules/core/domain/entities/task_entity.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/task_widget.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required ValueNotifier<List<TaskEntity>> list,
    required String listTitle,
  })  : _list = list,
        _listTitle = listTitle;

  final ValueNotifier<List<TaskEntity>> _list;
  final String _listTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                color: Colors.blue,
                height: 30,
                width: MediaQuery.sizeOf(context).width * .3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.amber,
                      height: 30,
                      width: MediaQuery.sizeOf(context).width * .3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                        child: Center(
                          child: Text(_listTitle),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: SizedBox(
                      height: MediaQuery.sizeOf(context).height * .6,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .3,
                          child: _list.value.isNotEmpty
                              ? ValueListenableBuilder(
                                  valueListenable: _list,
                                  builder: (context, value, child) {
                                    return ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value.length,
                                      itemBuilder: (context, index) {
                                        return TaskWidget(
                                          backgroundColor: TaskStatusEnum.getStatusColor(value[index].taskStatus),
                                          taskName: value[index].name,
                                          id: value[index].id,
                                        );
                                      },
                                      separatorBuilder: (BuildContext context, int index) {
                                        return const SizedBox(height: 8);
                                      },
                                    );
                                  },
                                )
                              : const Text('Lista vazia'),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
