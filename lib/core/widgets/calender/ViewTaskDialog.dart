import 'package:flutter/material.dart';
import 'package:task/core/utils/extensions/date_time_extensions.dart';

import 'data/event_model.dart';

class ViewTaskDialog extends StatefulWidget {
  final Event event;
  const ViewTaskDialog({Key? key, required this.event}) : super(key: key);

  @override
  State<ViewTaskDialog> createState() => _ViewTaskDialogState();
}

class _ViewTaskDialogState extends State<ViewTaskDialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text('Title'),subtitle: Text(widget.event.name),),
        ListTile(title: Text('Date'),subtitle: Text(widget.event.dateTime.printDateTime()),),
      ],
    );
  }
}
