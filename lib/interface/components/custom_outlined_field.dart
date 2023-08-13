import 'package:flutter/material.dart';
import 'package:former/interface/utils/app_colors.dart';

class CustomOutlinedField extends StatelessWidget {
  const CustomOutlinedField({
    super.key,
    required this.controller,
    required this.errorMessage,
    this.label = "",
    this.hint = "",
    this.obsecure = false,
    this.obsecureText = "#",
    this.borderRadius = 8,
    this.validator = true,
    this.filled = false,
    this.outlined = true,
    this.enabled = true,
    this.focusNode,
    this.suffix,
    this.prefix,
    this.icon,
    this.length,
    this.textInputType,
    this.onSubmit,
    this.onChanged,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String errorMessage;
  final String label;
  final String hint;
  final bool obsecure;
  final String obsecureText;
  final double borderRadius;
  final bool validator;
  final bool filled;
  final bool outlined;
  final bool enabled;
  final FocusNode? focusNode;
  final Widget? suffix;
  final Widget? prefix;
  final Widget? icon;
  final int? length;
  final TextInputType? textInputType;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.start,
        label: label.isEmpty ? null : Text(label),
        hintText: hint.isEmpty ? null : hint,
        border: outlined
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              )
            : const UnderlineInputBorder(),
        icon: icon,
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 50),
        suffixIcon: suffix,
        fillColor: AppColors.secondary.shade700,
        filled: filled,
      ),
      readOnly: readOnly,
      enabled: enabled,
      onChanged: onChanged,
      keyboardType: textInputType,
      maxLength: length,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      obscureText: obsecure,
      obscuringCharacter: obsecureText,
      onTap: onTap,
      textCapitalization: TextCapitalization.sentences,
      validator: validator
          ? (value) {
              if (value == null || value.trim().isEmpty) {
                return errorMessage;
              }
              return null;
            }
          : null,
    );
  }
}
