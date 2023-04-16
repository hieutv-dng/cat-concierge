/*
 * File: one_text_field.dart
 * File Created: Thursday, 9th February 2023 8:03:00 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:16:53 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'dart:async';

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one/one.dart';

class OneTextField extends StatefulWidget {
  const OneTextField({
    super.key,
    this.text,
    this.onChanged,
    this.onFocusChanged,
    this.onSubmitted,
    this.onClear,
    this.maxLines = 1,
    this.autofocus = false,
    this.clearable = false,
    this.readOnly = false,
    this.textAlign = TextAlign.start,
    this.decoration = const InputDecoration(),
    this.inputFormatters,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
  });

  final String? text;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? onFocusChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final int maxLines;
  final bool autofocus;
  final bool clearable;
  final bool readOnly;
  final TextAlign textAlign;
  final InputDecoration decoration;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  State<OneTextField> createState() => _OneTextFieldState();
}

class _OneTextFieldState extends State<OneTextField> {
  late final TextEditingController _controller;
  final _focusNode = FocusNode();
  final _textUpdate = StreamController<String>();
  bool get _isClearVisible => widget.clearable && !widget.readOnly;
  final _hasText = ValueNotifier(false);

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.text)..addListener(_handleTxtControllerChanged);
    _textUpdate.stream.distinct().forEach(_onChanged);
    _focusNode.addListener(_handleFocusChanged);
  }

  @override
  void didUpdateWidget(covariant OneTextField oldWidget) {
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
        return TextField(
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
          decoration: widget.decoration.copyWith(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2.0,
                color: AppColors.lightGreyDark,
              ),
              borderRadius: theme.shape.borderRadius,
            ),
            contentPadding: widget.decoration.contentPadding ?? contentPadding,
            hintStyle: theme.textTheme.labelMedium?.copyWith(
              color: AppColors.textHintColor,
            ),
            suffixIcon: _buildSuffixIcon(context, hasText),
          ),
        );
      },
    );
  }

  Widget? _buildSuffixIcon(BuildContext context, bool hasText) {
    if (!_isClearVisible) return widget.decoration.suffixIcon;
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
        : widget.decoration.suffixIcon;
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
