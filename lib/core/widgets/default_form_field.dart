import 'package:flutter/material.dart';
import 'package:physical_therapy_app/core/utils/constances.dart';


class DefaultFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final VoidCallback? onTap;
  final String? labelText;
  final TextInputType keyboardType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onEditingComplete;
  final void Function(String)? onChanged;
  final bool obscureText;
  final bool enabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? initialValue;
  final String? hintText;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? labelColor;
  final Color? cursorColor;
  final double radius;
  final double? height;
  final int? maxLines;
  final double horizontalPadding;
  final InputBorder? inputBorder;
  final InputBorder? inputEnabledBorder;
  final InputBorder? inputFocusedBorder;
  final InputBorder? inputDisabledBorder;
  final EdgeInsetsGeometry? contentPadding;
  final AlignmentGeometry? containerAlignment;
  final BoxConstraints? suffixIconConstraints;
  final bool readOnly;
  final int? maxLength;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final FocusNode? focusNode;

   const DefaultFormField(
      {Key? key,
        required this.controller,
        this.focusNode,
        this.validator,
        this.onTap,
        this.labelText,
        required this.keyboardType,
        this.onFieldSubmitted,
        this.onEditingComplete,
        this.onChanged,
        this.obscureText = false,
        this.prefixIcon,
        this.suffixIcon,
        this.initialValue,
        this.hintText,
        this.backgroundColor,
        this.height,
        this.radius = 30.0,
        this.maxLines,
        this.enabled = true,
        this.inputBorder =
        const OutlineInputBorder(borderSide: BorderSide(width: 1,)),
        this.inputEnabledBorder,
        this.inputFocusedBorder,
        this.inputDisabledBorder,
        this.horizontalPadding = 0,
        this.textColor,
        this.labelColor = kPrimaryColor,
        this.contentPadding,
        this.containerAlignment,
        this.suffixText,
        this.suffixTextStyle,
        this.suffixIconConstraints,
        this.readOnly = false,
        this.cursorColor,
        this.maxLength,
        this.textDirection = TextDirection.ltr,
        this.textAlign = TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: containerAlignment,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius)),
      child: TextFormField(
        focusNode: focusNode,
        maxLength: maxLength,
        readOnly: readOnly,
        cursorColor: cursorColor,
        enabled: enabled,
        textAlignVertical: TextAlignVertical.center,
        textAlign: textAlign,
        maxLines: maxLines,
        textDirection: textDirection,
        initialValue: initialValue,
        controller: controller,
        validator: (data){ if (data!.isEmpty) {
          return 'من فضلك ادخل البيانات';
        } return null;
        },
        keyboardType: keyboardType,
        onFieldSubmitted: onFieldSubmitted,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: obscureText,
        style: TextStyle(
          color: textColor,
        ),
        decoration: InputDecoration(
          counterText: '',
          suffixStyle: suffixTextStyle,
          suffixText: suffixText,
          contentPadding: contentPadding,
          isDense: true,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIconConstraints: suffixIconConstraints,
          labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
            color: labelColor,
          ),
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: inputEnabledBorder,
          disabledBorder: inputDisabledBorder,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                width: 2,
                color: kPrimaryColor,
              )),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          hintTextDirection: TextDirection.rtl,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}