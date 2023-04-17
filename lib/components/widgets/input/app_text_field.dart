/*
 * File: app_text_filed.dart
 * File Created: Saturday, 15th April 2023 11:33:51 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Saturday, 15th April 2023 11:33:56 pm
 * Modified By: Dương Trí
 */

import 'dart:async';

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.text,
    this.title,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onFocusChanged,
    this.onSubmitted,
    this.onClear,
    this.maxLines = 1,
    this.autofocus = false,
    this.clearable = false,
    this.readOnly = false,
    this.selectionEnable = true,
    this.textAlign = TextAlign.start,
    this.decoration = const InputDecoration(),
    this.inputFormatters,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    this.fillColor,
    this.focusedColor,
    this.borderColor,
    this.suffixColor,
    this.borderRadius,
  });
  final String? title;
  final String? text;
  final String? hintText;
  final String? prefixIcon;
  final String? suffixIcon;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final int maxLines;
  final bool autofocus;
  final bool clearable;
  final bool readOnly;
  final bool selectionEnable;
  final TextAlign textAlign;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? fillColor;
  final Color? focusedColor;
  final Color? borderColor;
  final Color? suffixColor;
  final double? borderRadius;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();
  final _textUpdate = StreamController<String>();
  bool get _isClearVisible => widget.clearable && !widget.readOnly;
  bool get _selectionEnable => widget.selectionEnable;
  String? get _title => widget.title;
  String? get _hintText => widget.hintText;
  String? get _prefixIcon => widget.prefixIcon;
  String? get _suffixIcon => widget.suffixIcon;
  Color? get _fillColor => widget.fillColor;
  Color? get _focusedColor => widget.focusedColor;
  Color? get _borderColor => widget.borderColor;
  Color? get _suffixColor => widget.suffixColor;
  double? get _borderRadius => widget.borderRadius;
  final _hasText = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.text)..addListener(_handleTxtControllerChanged);
    _textUpdate.stream.distinct().forEach(_onChanged);
    _focusNode.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(covariant AppTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.text != null && widget.text != oldWidget.text && widget.text != _controller.text) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller.text = widget.text!;
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTxtControllerChanged);
    _controller.dispose();
    _textUpdate.close();
    _focusNode.removeListener(_handleFocusChanged);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _hasText,
      builder: (context, hasText, child) {
        final theme = Theme.of(context);
        final contentPadding = _isClearVisible && hasText ? theme.spacing.edgeInsets.copyWith(end: 0) : null;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_title != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(_title!, style: AppTextStyle.fromContext(context).headingH5),
              ),
            TextField(
              enableInteractiveSelection: _selectionEnable,
              controller: _controller,
              focusNode: _focusNode,
              onChanged: widget.onChanged,
              onSubmitted: widget.onSubmitted,
              maxLines: widget.maxLines,
              autofocus: widget.autofocus,
              readOnly: widget.readOnly,
              inputFormatters: widget.inputFormatters,
              onTap: widget.onTap,
              textAlign: widget.textAlign,
              textAlignVertical: TextAlignVertical.center,
              keyboardType: widget.keyboardType,
              style: theme.textTheme.bodyMedium,
              obscureText: widget.obscureText,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: _focusedColor ?? AppColors.primary,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(_borderRadius ?? 16)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2.0,
                    color: _borderColor ?? AppColors.lightGrey,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(_borderRadius ?? 16)),
                ),
                contentPadding: widget.decoration.contentPadding ?? contentPadding,
                hintStyle: theme.textTheme.labelMedium?.copyWith(
                  color: AppColors.textHintColor,
                ),
                suffixIcon: _buildSuffixIcon(context, hasText),
                hintText: _hintText,
                filled: true,
                fillColor: _fillColor ?? Colors.white,
                prefixIcon: (_prefixIcon != null)
                    ? InkWell(
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(_prefixIcon!, width: 16, height: 16),
                          ],
                        ),
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget? _buildSuffixIcon(BuildContext context, bool hasText) {
    final sufffixWidget = (_suffixIcon != null)
        ? InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _suffixIcon!,
                  width: 16,
                  height: 16,
                  color: _suffixColor,
                ),
              ],
            ),
          )
        : null;
    if (!_isClearVisible) return sufffixWidget;
    final theme = Theme.of(context);
    return hasText
        ? InkWell(
            onTap: () {
              _controller.clear();
              widget.onClear?.call();
              _focusNode.unfocus();
            },
            borderRadius: theme.shape.borderRadius,
            child: Icon(
              CupertinoIcons.xmark,
              size: theme.iconTheme.size,
              color: theme.iconTheme.color,
            ),
          )
        : sufffixWidget;
  }

  void _handleFocusChanged() {
    if (!mounted) return;
    if (widget.onFocusChanged != null) widget.onFocusChanged!(_focusNode.hasFocus);
  }

  void _handleTxtControllerChanged() {
    if (!mounted) return;
    // final _txtTrim = _controller.text.trim();
    _hasText.value = _controller.text.isNotEmpty;
    _textUpdate.add(_controller.text);
  }

  void _onChanged(String s) {
    if (!mounted) return;
    if (widget.onChanged != null) {
      widget.onChanged!(s);
    }
  }
}
