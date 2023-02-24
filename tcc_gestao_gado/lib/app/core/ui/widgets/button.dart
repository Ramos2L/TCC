import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/button_styles.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';

class Button extends StatefulWidget {
  final ButtonStyle style;
  final TextStyle labelStyle;
  final String label;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final bool outline;

  const Button({
    super.key,
    required this.style,
    required this.labelStyle,
    required this.label,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
    this.outline = false,
  });

  Button.primary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
  })  : style = ButtonStyles.i.primaryButton,
        labelStyle = TextStyles.i.textMedium.copyWith(
          color: AppColors.i.onPrimary,
          fontSize: 18,
        ),
        outline = false;

  Button.secondary({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.padding,
    this.onPressed,
  })  : style = ButtonStyles.i.secondaryButton,
        labelStyle = TextStyles.i.textMedium.copyWith(
          color: AppColors.i.primary,
          fontSize: 18,
        ),
        outline = false;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: widget.padding,
      child: widget.outline
          ? OutlinedButton(
              onPressed: widget.onPressed,
              style: widget.style,
              child: FittedBox(
                child: Text(
                  widget.label.toUpperCase(),
                  style: widget.labelStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          : ElevatedButton(
              onPressed: widget.onPressed,
              style: widget.style,
              child: FittedBox(
                child: Text(
                  widget.label.toUpperCase(),
                  style: widget.labelStyle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
    );
  }
}
