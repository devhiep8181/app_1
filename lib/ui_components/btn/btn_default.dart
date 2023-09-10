// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_1/feature/theme/color_palettes.dart';
import 'package:app_1/feature/theme/typhography.dart';
import 'package:flutter/material.dart';

class BtnDefault extends StatelessWidget {
  final String? title;
  final Widget? customChild;
  final BtnDefaultType type;

  /// Inkwell
  final void Function()? onTap;
  final void Function()? onDoubleTap;
  final void Function()? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final void Function(TapUpDetails)? onTapUp;
  final void Function()? onTapCancel;
  final void Function(bool)? onHighlightChanged;
  final void Function(bool)? onHover;
  final MouseCursor? mouseCursor;
  final Color? focusColor;
  final Color? hoverColor;
  final Color? highlightColor;
  final MaterialStateProperty<Color?>? overlayColor;
  final Color? splashColor;
  final InteractiveInkFeatureFactory? splashFactory;
  final double? radius;
  final BorderRadius? borderRadius;
  final ShapeBorder? customBorder;
  final bool? enableFeedback;
  final bool excludeFromSemantics;
  final FocusNode? focusNode;
  final bool canRequestFocus;
  final void Function(bool)? onFocusChange;
  final bool autofocus;
  final MaterialStatesController? statesController;

  ///Ink
  final EdgeInsetsGeometry? customPadding;
  final Color? fillColor;
  final Decoration? customDecoration;
  final double? width;
  final double? height;

  const BtnDefault({
    Key? key,
    this.type = BtnDefaultType.primary,
    this.title,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
    this.onHighlightChanged,
    this.onHover,
    this.mouseCursor,
    this.focusColor,
    this.hoverColor,
    this.highlightColor,
    this.overlayColor,
    this.splashColor,
    this.splashFactory,
    this.radius,
    this.borderRadius,
    this.customBorder,
    this.enableFeedback = true,
    this.excludeFromSemantics = false,
    this.focusNode,
    this.canRequestFocus = true,
    this.onFocusChange,
    this.autofocus = false,
    this.statesController,
    this.customPadding,
    this.fillColor,
    this.customDecoration,
    this.width,
    this.height,
    this.customChild,
  })  : assert(!(title != null && customChild != null)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      enableFeedback: enableFeedback,
      excludeFromSemantics: excludeFromSemantics,
      canRequestFocus: canRequestFocus,
      autofocus: autofocus,
      onTap: onTap,
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      onHighlightChanged: onHighlightChanged,
      onHover: onHover,
      mouseCursor: mouseCursor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      highlightColor: highlightColor,
      overlayColor: overlayColor,
      splashColor: splashColor,
      splashFactory: splashFactory,
      radius: radius,
      borderRadius: borderRadius,
      customBorder: customBorder,
      focusNode: focusNode,
      onFocusChange: onFocusChange,
      statesController: statesController,
      child: Ink(
        width: width ?? double.infinity,
        height: height,
        padding: customPadding ??
            const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        decoration: customDecoration ?? buildDecoration(),
        child: customChild ??
            Center(
              child: Text(
                title ?? "",
                style: buildTitleStyle(),
              ),
            ),
      ),
    );
  }

  BoxDecoration buildDecoration() {
    switch (type) {
      case BtnDefaultType.secondary:
        return BoxDecoration(
          color: ColorPalettes.whiteColor,
          border: Border.all(color: ColorPalettes.primaryColor),
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        );
      default:
        return BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
          color: fillColor ?? ColorPalettes.primaryColor,
        );
    }
  }

  TextStyle buildTitleStyle() {
    switch (type) {
      case BtnDefaultType.secondary:
        return AppTextStyle.buttonMedium(color: ColorPalettes.darkColor);
      default:
        return AppTextStyle.buttonMedium(color: ColorPalettes.whiteColor);
    }
  }
}

enum BtnDefaultType {
  primary,
  secondary,
}
