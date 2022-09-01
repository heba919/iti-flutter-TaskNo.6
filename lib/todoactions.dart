import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todoprovider.dart';
class Todoitems extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //store the value in a variable
    final task = Provider.of<TodoProvider>(context);
    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: ((context, index) => ListTile(
        leading: Checkbox(
          value: task.allTasks[index].check,
          onChanged: ((_) => task.toggleTask(task.allTasks[index])),
        ),
        //show all the task title
        title: Text(task.allTasks[index].todoTitle),
        trailing: IconButton(
            onPressed: () {
              task.deleteTask(task.allTasks[index]);
            },
            icon: const Icon(Icons.delete , color: Colors.red)),
      )),
    );
  }
}