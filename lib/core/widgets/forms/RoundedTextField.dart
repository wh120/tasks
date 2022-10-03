import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/appcolors.dart';

class RoundedTextField extends StatefulWidget {
  final String? helperText;
  final FormFieldValidator<String>? validator;
  final String? hintText;
  final String? initialValue;
  final GestureTapCallback? onTap;
  final bool? readOnly;
  final TextEditingController? controller;
  final String? labelText;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final int? maxLines;
  final bool? isPhoneNumber;
  final ValueChanged<String>? onChange;
  final List<Object>? values;

  const RoundedTextField(
      {Key? key,
      this.hintText,
      this.initialValue,
      this.onTap,
      this.readOnly = false,
      this.controller,
      this.labelText,
      this.keyboardType,
      this.validator,
      this.prefix,
      this.helperText,
      this.inputFormatters,
      this.maxLength,
      this.maxLines,
      this.suffixIcon,
      this.isPhoneNumber = false,
      this.values,
      this.onChange})
      : super(key: key);

  @override
  _RoundedTextFieldState createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(color: AppColors.greySwatch[40]),
        autovalidateMode: AutovalidateMode.onUserInteraction,

        onChanged: widget.onChange,
        // textAlign: TextAlign.center,
        maxLines: widget.maxLines ?? 1,
        // maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        onTap: widget.onTap,
        //  textAlign: TextAlign.end,
        readOnly: widget.readOnly ?? false,
        keyboardType: widget.keyboardType,
        initialValue: widget.initialValue,
        decoration: InputDecoration(
          prefix: widget.suffixIcon,
          helperText: widget.helperText,
          // suffixIcon: widget.suffixIcon,
          // contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          enabledBorder: OutlineInputBorder(
            // width: 0.0 produces a thin "hairline" border
            borderRadius: BorderRadius.circular(5.0),
            borderSide:
                BorderSide(color: AppColors.greySwatch[20]!, width: 1.0),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
         // hintText: widget.hintText,hintStyle: TextStyle(fontWeight: FontWeight.bold),
          labelText: widget.hintText,
        ),
        validator: widget.validator,
      ),
    );
  }
}
