import 'package:flutter/material.dart';

import '../../constants/appcolors.dart';
import '../../constants/app_styles.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final Widget? prefix;
  final ValueChanged<String>? onChange;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final bool isReadOnly;
  final bool autofocus;
  const SearchField({
    Key? key,
    this.hintText,
    this.controller,
    this.prefix,
    this.onChange,
    this.onEditingComplete,
    this.isReadOnly = false,
    this.autofocus = false,
    this.onTap,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Container(
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppStyles.cardRadius,
              boxShadow: AppStyles.primaryShadow),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: widget.controller,
              readOnly: widget.isReadOnly,
              autofocus: widget.autofocus,
              onTap: widget.onTap,
              onChanged:(value)=> widget.onChange!(value),
              onEditingComplete: widget.onEditingComplete,
              decoration: InputDecoration(
                prefixIcon: widget.prefix,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                hintText: widget.hintText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
