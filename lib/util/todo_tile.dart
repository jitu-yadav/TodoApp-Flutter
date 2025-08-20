import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  String taskName;
  bool isTaskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? onDelete;

  TodoTile({
    super.key,
    required this.taskName,
    required this.isTaskCompleted,
    required this.onChanged,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, right: 12, top: 12),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
          ],
        ),

        child: Container(
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(18),
          child: Row(
            children: [
              Checkbox(
                value: isTaskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),

              Text(
                taskName,
                style: TextStyle(
                  decoration: isTaskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
