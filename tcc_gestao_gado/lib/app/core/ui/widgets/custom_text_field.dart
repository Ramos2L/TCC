import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? initialValue;
  final String? hintText;

  final TextStyle? labelStyle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Color? fillColor;
  final EdgeInsets? padding;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputDecoration? inputDecoration;
  final int? maxLength;
  final bool? enabled;
  final Function(String)? onFieldSubmitted;
  final Widget? suffixIcon;
  final FocusNode? focusNode;

  const CustomTextField({
    this.label,
    this.labelStyle,
    this.controller,
    this.fillColor,
    this.obscureText = false,
    this.validator,
    this.padding,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.inputDecoration,
    this.maxLength,
    this.enabled,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.focusNode,
    super.key,
    this.initialValue,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(left: 5, bottom: 5),
              child: Text(label!, style: labelStyle),
            ),
          TextFormField(
            initialValue: initialValue,
            enabled: enabled,
            controller: controller,
            obscureText: obscureText,
            validator: validator,
            onChanged: onChanged,
            inputFormatters: inputFormatters,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onFieldSubmitted: onFieldSubmitted,
            focusNode: focusNode,
            decoration: inputDecoration?.copyWith(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: context.colors.secondary),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: context.colors.secondary),
                borderRadius: BorderRadius.circular(15),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: context.colors.secondary),
                borderRadius: BorderRadius.circular(15),
              ),
              hintText: hintText,
              suffixIcon: suffixIcon,
              // fillColor: enabled ?? true
              //     ? context.colors.background
              //     : context.colors.primary.withOpacity(0.7),
            ),
            maxLength: maxLength,
          ),
        ],
      ),
    );
  }
}
