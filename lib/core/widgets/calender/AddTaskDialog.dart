import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/widgets/calender/data/event_model.dart';



import '../../constants/AppTheme.dart';
import '../../utils/navigation/navigation.dart';

import '../forms/RoundedDateTimeField.dart';
import '../forms/RoundedTextField.dart';
import 'domain/cubits/calender_cubit.dart';

class AddTaskDialog extends StatefulWidget {
  final DateTime initialDateTime;
  const AddTaskDialog({Key? key, required this.initialDateTime}) : super(key: key);

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  TextEditingController titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late DateTime selectedDateTime;

  initState(){
    selectedDateTime = widget.initialDateTime;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Add Task' , style: AppTheme.headline4,),
            ),
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: RoundedTextField(
                hintText: 'Title',
                controller: titleController,
                validator: (value){
                  if(value == null || value!.isEmpty) return 'Empty title';
                },


              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: RoundedDateTimeField(
                labelText: 'Date',
                onPress: (DateTime dateTime) {
                  selectedDateTime=dateTime;
                },
                initialDate: widget.initialDateTime,
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OutlinedButton(
                      child: const Text("Cancel"),
                      onPressed: () {
                        Navigation.pop();

                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      child: const Text("Save"),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                          BlocProvider.of<CalenderCubit>(context, listen: false).addEvent(
                              Event(name: titleController.text, dateTime: selectedDateTime)
                          );

                          Navigation.pop();
                        }


                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
