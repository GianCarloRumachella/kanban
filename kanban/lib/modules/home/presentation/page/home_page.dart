import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:kanban/modules/core/domain/enums/task_status_enum.dart';
import 'package:kanban/modules/core/presentation/ui/widgets/task_widget.dart';
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
                      children: [
                        ElevatedButton(
                          child: const Text('Load tasks'),
                          onPressed: () {
                            _controller.getTasks();
                          },
                        ),
                        SizedBox(width: MediaQuery.sizeOf(context).width * 1.5),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * .3,
                          child: _controller.taskList.value.isNotEmpty
                              ? ValueListenableBuilder(
                                  valueListenable: _controller.taskList,
                                  builder: (context, value, child) {
                                    return ListView.separated(
                                      physics: const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: value.length,
                                      itemBuilder: (context, index) {
                                        return TaskWidget(
                                          backgroundColor: TaskStatusEnum.getStatusColor(value[index].taskStatus),
                                          taskName: value[index].name,
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
                        Container(
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height,
                          color: Colors.red,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height,
                          color: Colors.blue,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height,
                          color: Colors.yellow,
                        ),
                        Container(
                          width: MediaQuery.sizeOf(context).width * .4,
                          height: MediaQuery.sizeOf(context).height,
                          color: Colors.green,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // body: SafeArea(
        //   child: Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16),
        //     child: Row(
        //       children: [
        //         Expanded(
        //           child: Column(
        //             children: [
        //               ElevatedButton(
        //                 child: const Text('Load tasks'),
        //                 onPressed: () {
        //                   _controller.getTasks();
        //                 },
        //               ),
        //               SizedBox(
        //                 child: _controller.taskList.value.isNotEmpty
        //                     ? ValueListenableBuilder(
        //                         valueListenable: _controller.taskList,
        //                         builder: (context, value, child) {
        //                           return ListView.separated(
        //                             physics: const NeverScrollableScrollPhysics(),
        //                             shrinkWrap: true,
        //                             itemCount: value.length,
        //                             itemBuilder: (context, index) {
        //                               return TaskWidget(
        //                                 backgroundColor: TaskStatusEnum.getStatusColor(value[index].taskStatus),
        //                                 taskName: value[index].name,
        //                               );
        //                             },
        //                             separatorBuilder: (BuildContext context, int index) {
        //                               return const SizedBox(height: 8);
        //                             },
        //                           );
        //                         },
        //                       )
        //                     : const Text('Lista vazia'),
        //               ),
        //               const SizedBox(height: 16),
        //             ],
        //           ),
        //         ),
        //         Expanded(
        //           child: Column(
        //             children: [
        //               Container(color: Colors.teal),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
