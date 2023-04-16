/*
 * File: recent_claims_gridview.dart
 * File Created: Tuesday, 14th February 2023 6:15:51 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Tuesday, 14th February 2023 6:17:23 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one/one.dart';

class RecentClaimsGridView extends StatefulWidget {
  const RecentClaimsGridView({
    Key? key,
  }) : super(key: key);

  @override
  State<RecentClaimsGridView> createState() => _RecentClaimsGridViewState();
}

class _RecentClaimsGridViewState extends State<RecentClaimsGridView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: theme.spacing.base),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: theme.spacing.small,
        crossAxisSpacing: theme.spacing.small,
        childAspectRatio: 1.65,
      ),
      itemBuilder: (context, index) {
        return const _RecentClaimItemView();
      },
      itemCount: 4,
    );
  }
}

class _RecentClaimItemView extends StatelessWidget {
  const _RecentClaimItemView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      borderRadius: theme.shape.borderRadius,
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacing.base),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2021 SAAB 93', style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
                  SizedBox(height: theme.spacing.small),
                  Row(
                    children: [
                      SvgPicture.asset(MySvgs.ic_user, width: theme.spacing.small * 1.5),
                      Text('June28, 2022', style: theme.textTheme.labelSmall),
                      Text('•', style: theme.textTheme.labelSmall),
                      SvgPicture.asset(MySvgs.ic_user, width: theme.spacing.small * 1.5),
                      Text('16', style: theme.textTheme.labelSmall),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const LinearProgressIndicator(value: .68, color: Colors.green),
                  SizedBox(height: theme.spacing.small),
                  Row(
                    children: [
                      Expanded(child: Text('In Progress', style: theme.textTheme.labelSmall)),
                      Text('68%', style: theme.textTheme.labelSmall),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
