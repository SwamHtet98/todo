import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import 'package:todo/model/todo.dart';

class TodoItem extends StatelessWidget {
  Todo? todo;
  final onToDoChanged;
  final onDeleteItem;
// final todoList = Todo.todoList();
  TodoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            onToDoChanged(todo);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white,
          leading: (todo?.isDone ?? false)
              ? const Icon(
                  Icons.check_box,
                  color: tdBlue,
                )
              : const Icon(
                  Icons.check_box_outline_blank,
                  color: tdBlue,
                ),
          title: Text(
            todo?.todoText ?? '',
            style: TextStyle(
                fontSize: 16,
                color: tdBlack,
                decoration: (todo?.isDone ?? false)
                    ? TextDecoration.lineThrough
                    : null),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              color: Colors.white,
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                onDeleteItem(todo?.id ?? '');
              },
            ),
          ),
        ));
  }
}
