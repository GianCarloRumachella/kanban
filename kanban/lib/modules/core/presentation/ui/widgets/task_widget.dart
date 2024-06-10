import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.backgroundColor, required this.taskName, required this.id});

  final Color backgroundColor;
  final String taskName;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint("abrindo as opções da tarefa $taskName - id: $id");
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
