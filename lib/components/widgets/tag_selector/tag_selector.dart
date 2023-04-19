/*
 * File: tag_selected.dart
 * File Created: Wednesday, 19th April 2023 5:04:05 pm
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 19th April 2023 5:04:11 pm
 * Modified By: Dương Trí
 */

import 'package:flutter/material.dart';

import '../../../core/index.dart';

class TagSelector extends StatefulWidget {
  const TagSelector({super.key, required this.title, required this.data});

  final String title;
  final List<String> data;

  @override
  State<TagSelector> createState() => _TagSelectorState();
}

class _TagSelectorState extends State<TagSelector> {
  String get _title => widget.title;
  List<String> get _data => widget.data;
  @override
  Widget build(BuildContext context) {
    return _buildTagLayout(context, _title, _data);
  }

  Widget _buildTagLayout(BuildContext context, String title, List<String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.fromContext(context).headingH5,
        ),
        const SizedBox(height: 8),
        Wrap(
          children: List.generate(data.length, (index) => _buildItem(data[index], context)),
        ),
      ],
    );
  }

  Widget _buildItem(String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0), color: AppColors.primary),
      child: Text(text.toUpperCase(), style: AppTextStyle.fromContext(context).captionM.copyWith(color: Colors.white)),
    );
  }
}
