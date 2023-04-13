/*
 * File: open_supplements_listview.dart
 * File Created: Tuesday, 14th February 2023 6:43:14 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 6:43:56 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';

class OpenSupplementsListView extends StatefulWidget {
  const OpenSupplementsListView({
    Key? key,
  }) : super(key: key);

  @override
  State<OpenSupplementsListView> createState() => _OpenSupplementsListViewState();
}

class _OpenSupplementsListViewState extends State<OpenSupplementsListView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: theme.spacing.small),
      itemBuilder: (context, index) {
        return Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: const _OpenSupplementItemView(),
        );
      },
      itemCount: 6,
    );
  }
}

class _OpenSupplementItemView extends StatelessWidget {
  const _OpenSupplementItemView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: theme.shape.borderRadius,
      child: Card(
        child: Padding(
          padding: theme.spacing.edgeInsets,
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        LayoutBuilder(builder: (context, constrains) {
                          return SizedBox(
                            width: constrains.maxWidth * .5,
                            child: Divider(height: 0, color: Colors.yellow, thickness: theme.spacing.small * .5),
                          );
                        }),
                        Text('2020 Ford Mustang',
                            style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SvgPicture.asset(MySvgs.ic_more_vert),
                ],
              ),
              SizedBox(height: theme.spacing.base),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text('Amica Insurance Company', style: theme.textTheme.bodySmall)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(.15),
                      borderRadius: BorderRadius.circular(theme.spacing.small * .5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Text('Completed', style: theme.textTheme.labelSmall?.copyWith(color: Colors.green)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
