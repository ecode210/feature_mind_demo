import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.hint,
    this.label,
    this.lines = 1,
    this.icon,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatter,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.onSubmitted,
    this.onChanged,
  });

  final String hint;
  final String? label;
  final int? lines;
  final Widget? icon;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFieldTapRegion(
      child: TextField(
        focusNode: focusNode,
        controller: widget.controller,
        cursorColor: Theme.of(context).colorScheme.onSecondary,
        cursorRadius: Radius.circular(100.r),
        cursorHeight: 25.h,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatter,
        maxLines: widget.lines,
        minLines: widget.lines,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        textInputAction: widget.textInputAction,
        onSubmitted: widget.onSubmitted,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: (event) {
          focusNode.unfocus();
        },
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSecondary,
            ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
              width: 1.w,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSecondary,
              width: 1.5.w,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 1.w,
            ),
          ),
          filled: true,
          fillColor: widget.enabled ? Colors.transparent : Theme.of(context).colorScheme.primaryContainer,
          contentPadding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 20.w),
          isDense: true,
          hintText: widget.hint,
          hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.75),
              ),
          labelText: widget.label,
          labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: widget.icon != null
              ? Container(
                  height: 20.h,
                  width: 20.h,
                  alignment: Alignment.center,
                  child: widget.icon,
                )
              : null,
        ),
      ),
    );
  }
}
