
/*
 * File: result_page.dart
 * File Created: Monday, 17th April 2023 12:04:13 am
 * Author: Hieu Tran
 * -----
 * Last Modified: Monday, 17th April 2023 12:04:22 am
 * Modified By: Hieu Tran
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/result_card_item.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [_buildSliverAppBar(context)];
          },
          body: _buildBody(context),
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final theme = Theme.of(context);
    return SliverAppBar(
      pinned: false,
      floating: true,
      stretch: true,
      title: Row(
        children: [
          Text(
            'Results',
            style: theme.textTheme.headlineLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      header: const MySmartRefreshHeader(),
      onRefresh: () {
        _refreshController.refreshCompleted();
        // _controller.loadData();
      },
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: PersistentHeaderDelegate(
            minHeight: 72,
            maxHeight: 72,
            child: Material(
              child: Padding(
                padding: theme.spacing.edgeInsets,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'All tests',
                        style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    OneButton.outlined(
                      onTap: () {},
                      label: Text('Sort', style: theme.textTheme.bodySmall),
                      icon: const Icon(Icons.sort),
                      padding: theme.spacing.smallEdgeInsets,
                    ),
                    SizedBox(width: theme.spacing.small),
                    OneButton.outlined(
                      onTap: () {},
                      label: Text('Edit', style: theme.textTheme.bodySmall),
                      icon: const Icon(Icons.edit_outlined),
                      padding: theme.spacing.smallEdgeInsets,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: theme.spacing.base),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: theme.spacing.base),
                  child: ResultCardItem(
                    title: '2 Mar, 2023',
                    subtitle: '5:27 PM',
                    onTap: () {},
                  ),
                );
              },
              // childCount: 4,
            ),
          ),
        ),
      ],
    );
  }
}
