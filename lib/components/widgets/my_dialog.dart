/*
 * File: my_dialog.dart
 * File Created: Monday, 20th February 2023 11:21:01 am
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Monday, 20th February 2023 11:21:15 am
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class MyDialog extends StatefulWidget {
  const MyDialog({
    Key? key,
    this.title,
    this.msg,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.content,
    this.titleTextAlign = TextAlign.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.msgTextAlign = TextAlign.center,
    this.okBtnAutoPopWhenOnTap = true,
    this.cancelBtnAutoPopWhenOnTap = true,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final String? title;
  final String? msg;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final Widget? content;
  final TextAlign titleTextAlign;
  final TextAlign msgTextAlign;
  final bool okBtnAutoPopWhenOnTap;
  final bool cancelBtnAutoPopWhenOnTap;

  @override
  State<MyDialog> createState() => MyDialogState();

  static void show({
    String? title,
    String? msg,
    String? confirmText,
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    VoidCallback? closeHandler,
    Widget? content,
    TextAlign titleTextAlign = TextAlign.center,
    CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.start,
    TextAlign msgTextAlign = TextAlign.center,
    bool barrierDismissible = false,
    bool okBtnAutoPopWhenOnTap = true,
    bool cancelBtnAutoPopWhenOnTap = true,
  }) {
    Get.generalDialog(
      barrierDismissible: barrierDismissible,
      pageBuilder: (context, animation, secondaryAnimation) {
        return MyDialog(
          title: title ?? 'Alert',
          msg: msg,
          confirmText: confirmText ?? 'OK',
          cancelText: cancelText,
          onConfirm: onConfirm,
          onCancel: onCancel,
          content: content,
          titleTextAlign: titleTextAlign,
          crossAxisAlignment: crossAxisAlignment,
          msgTextAlign: msgTextAlign,
          okBtnAutoPopWhenOnTap: okBtnAutoPopWhenOnTap,
          cancelBtnAutoPopWhenOnTap: cancelBtnAutoPopWhenOnTap,
        );
      },
    );
  }
}

class MyDialogState extends State<MyDialog> {
  bool get _isCancleVisible => widget.cancelText != null || widget.onCancel != null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: theme.shape.borderRadius,
      ),
      elevation: 2,
      shadowColor: Colors.grey,
      insetPadding: EdgeInsets.all(theme.spacing.large),
      child: KeyboardDismissOnTap(
        child: _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(maxHeight: constraints.maxHeight * .8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: widget.crossAxisAlignment,
                        children: [
                          _buildTitle(context),
                          _buildBody(context),
                        ],
                      ),
                    ),
                  ),
                  const Divider(height: 0),
                  _buildBtns(context),
                ],
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: theme.spacing.edgeInsets,
            child: SelectableText(
              widget.title ?? 'Alert',
              style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
              textAlign: widget.titleTextAlign,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final widgets = <Widget>[];
    if (widget.msg != null) {
      widgets.add(SelectableText(
        widget.msg!,
        style: Theme.of(context).textTheme.titleMedium,
        textAlign: widget.msgTextAlign,
      ));
    }

    if (widget.content != null) {
      widgets.add(widget.content!);
    }

    if (widgets.isNotEmpty) {
      return Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacing.base),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...widgets,
              SizedBox(height: theme.spacing.base),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget _buildBtns(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: InkWell(
            child: Padding(
              padding: EdgeInsets.all(theme.spacing.large * .6),
              child: Text(
                widget.confirmText ?? 'OK',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: theme.primaryColor),
              ),
            ),
            onTap: () {
              if (widget.okBtnAutoPopWhenOnTap) Navigator.pop(context, true);
              if (widget.onConfirm != null) {
                widget.onConfirm!();
              }
            },
          ),
        ),
        if (_isCancleVisible) ...[
          const Divider(height: 0),
          SizedBox(
            width: double.infinity,
            child: InkWell(
              child: Padding(
                padding: EdgeInsets.all(theme.spacing.large * .6),
                child: Text(
                  widget.cancelText ?? 'Cancel',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                if (widget.cancelBtnAutoPopWhenOnTap) Navigator.pop(context, false);
                if (widget.onCancel != null) {
                  widget.onCancel!();
                }
              },
            ),
          )
        ],
      ],
    );
  }
}
