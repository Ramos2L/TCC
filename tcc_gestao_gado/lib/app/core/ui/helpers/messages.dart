import 'package:flutter/material.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/app_colors.dart';
import 'package:tcc_gestao_gado/app/core/ui/styles/text_styles.dart';

mixin Message<T extends StatefulWidget> on State<T> {
  void showError(String message, {bool barrierDismissible = true}) {
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        backgroundColor: context.colors.tertiaryContainer,
        title: Text(
          "messages",
          style: context.textStyles.textMedium.copyWith(
            color: context.colors.primary,
            fontSize: 20,
          ),
        ),
        content: Text(
          message,
          style: context.textStyles.textRegular.copyWith(color: context.colors.onPrimary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "messages",
              style: context.textStyles.textRegular.copyWith(
                color: context.colors.primary,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCustomDialog(
    String title, {
    String? content,
    String? textPrimaryButton,
    String? textSecondaryButton,
    VoidCallback? onPressedPrimaryButton,
    VoidCallback? onPressedSecondaryButton,
    bool barrierDismissible = true,
  }) {
    showDialog(
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => barrierDismissible,
        child: AlertDialog(
          backgroundColor: context.colors.background,
          title: Text(
            title,
            style: context.textStyles.textMedium.copyWith(
              color: context.colors.primary,
              fontSize: 20,
            ),
          ),
          content: Text(
            content ?? "",
            style: context.textStyles.textRegular.copyWith(color: context.colors.onPrimary),
          ),
          actions: [
            if (textSecondaryButton != null)
              TextButton(
                onPressed: onPressedSecondaryButton ?? () => Navigator.pop(context),
                child: Text(
                  textSecondaryButton,
                  style: context.textStyles.textRegular.copyWith(
                    color: context.colors.error,
                    fontSize: 16,
                  ),
                ),
              ),
            if (textPrimaryButton != null)
              TextButton(
                onPressed: onPressedPrimaryButton ?? () => Navigator.pop(context),
                child: Text(
                  textPrimaryButton,
                  style: context.textStyles.textRegular.copyWith(
                    color: context.colors.scrim,
                    fontSize: 16,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void showCustomSnackBar(String message, {Color? color}) {
    final snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: context.textStyles.textRegular.copyWith(color: context.colors.tertiaryContainer),
      ),
      backgroundColor: color ?? context.colors.error.withOpacity(0.8),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
