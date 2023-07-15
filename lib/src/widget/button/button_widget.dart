import 'package:fl_auth/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType {
  primary,
  outlined,
  icon,
}

class ButtonWidget extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final Function()? onTap;
  final bool isLoading;
  final Widget? prefix;
  final bool _isEnabled;

  const ButtonWidget({
    super.key,
    required this.buttonType,
    required this.text,
    this.onTap,
    this.isLoading = false,
    this.prefix,
    bool? isEnabled,
  }) : _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.primary({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.primary,
        _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.outlined({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.text,
    this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.outlined,
        _isEnabled = isEnabled ?? onTap != null;

  const ButtonWidget.icon({
    super.key,
    this.onTap,
    this.isLoading = false,
    required this.prefix,
    bool? isEnabled,
  })  : buttonType = ButtonType.icon,
        text = "",
        _isEnabled = isEnabled ?? onTap != null;

  Color getColor() => _isEnabled
      ? buttonType == ButtonType.primary
          ? AppColor.blue
          : Colors.transparent
      : AppColor.darkGrey;

  Color getFocusColor() =>
      buttonType == ButtonType.primary ? AppColor.blue : AppColor.darkGrey;

  bool get isPrimary => buttonType == ButtonType.primary;
  bool get isOutlined => buttonType == ButtonType.outlined;
  bool get isIcon => buttonType == ButtonType.icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: getColor(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: isOutlined || isIcon
            ? const BorderSide(
                color: AppColor.blue,
                width: 1,
              )
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: _isEnabled && !isLoading ? onTap : null,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: isOutlined
              ? const BorderSide(
                  color: AppColor.white,
                  width: 0.4,
                )
              : BorderSide.none,
        ),
        overlayColor: MaterialStateProperty.all(getFocusColor()),
        focusColor: getFocusColor(),
        child: isIcon
            ? SizedBox(
                height: AppSizes.customHeight(52),
                width: AppSizes.customHeight(52),
                child: prefix,
              )
            : Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.w28,
                  vertical: AppSizes.h16,
                ),
                child: Center(
                  child: isLoading
                      ? SizedBox(
                          height: AppSizes.customHeight(22),
                          width: AppSizes.customHeight(22),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).colorScheme.primary),
                          ),
                        )
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (prefix != null) ...[
                              prefix!,
                              Gap.w8,
                            ],
                            Text(
                              text,
                              style: _isEnabled
                                  ? Theme.of(context).textTheme.bodyLarge
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                        color: AppColor.darkGrey,
                                      ),
                            )
                          ],
                        ),
                ),
              ),
      ),
    );
  }
}
