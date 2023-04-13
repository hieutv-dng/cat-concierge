/*
 * File: home_page.dart
 * File Created: Thursday, 9th February 2023 8:03:00 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:07:08 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/open_supplements_listview.dart';
import 'widgets/recent_claims_gridview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hello, Jennifer!',
                      maxLines: 1, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Let\'s done your claims do today', maxLines: 1, style: theme.textTheme.labelSmall),
                ],
              ),
            ),
          ),
          _buildNotificationBtn(context)
        ],
      ),
    );
  }

  Widget _buildNotificationBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400),
      ),
      clipBehavior: Clip.hardEdge,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          child: Padding(
            padding: theme.spacing.smallEdgeInsets,
            child: const Icon(Icons.notifications_outlined),
          ),
          onTap: () => Get.toNamed('/notification'),
        ),
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
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            _TileTitleView(
              title: 'Recent Claims',
              onTap: () => Get.toNamed('/open-supplements'),
            ),
            const RecentClaimsGridView(),
            SizedBox(height: Theme.of(context).spacing.base),
            _TileTitleView(
              title: 'Open Supplements',
              onTap: () => Get.toNamed('/open-supplements'),
            ),
            const OpenSupplementsListView(),
          ]),
        ),
      ],
    );
  }
}

class _TileTitleView extends StatelessWidget {
  const _TileTitleView({
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Expanded(
            child: Padding(
          padding: theme.spacing.edgeInsets,
          child: Text(title, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        )),
        OneButton.text(
          label: Text('View All', style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
          onTap: onTap,
        ),
      ],
    );
  }
}
