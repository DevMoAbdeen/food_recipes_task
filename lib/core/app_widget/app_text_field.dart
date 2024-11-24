import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final String autofillHints;
  final String labelText;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function? onClickSuffix;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;

  const AppTextField({
    super.key,
    required this.keyboardType,
    required this.autofillHints,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onClickSuffix,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      autofillHints: [autofillHints],
      obscureText: obscureText,
      validator: validator,
      textInputAction: TextInputAction.next,
      onChanged: onChanged,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: labelText,
        filled: true,
        fillColor: Theme.of(context).cardColor,
        hintMaxLines: 1,
        errorMaxLines: 2,
        labelStyle: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).hintColor,
        ),
        prefixIcon: prefixIcon,
        prefixIconColor: WidgetStateColor.resolveWith(
              (states) => states.contains(WidgetState.focused)
              ? Theme.of(context).primaryColor
              : Theme.of(context).hintColor,
        ),
        suffixIcon: suffixIcon != null
            ? IconButton(
          onPressed: () {
            if (onClickSuffix != null) {
              onClickSuffix!();
            }
          },
          icon: suffixIcon!,
        )
            : null,
        suffixIconColor: Theme.of(context).hintColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).textTheme.bodyLarge!.color!),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
        alignLabelWithHint: true,
      ),
      onTapOutside: (event) {
        if(FocusManager.instance.primaryFocus!.hasFocus){
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
    );
  }
}
