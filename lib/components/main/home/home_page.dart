/*
 * File: home_page.dart
 * File Created: Thursday, 9th February 2023 8:03:00 pm
 * Author: Bruce Blake (hieutv)
 * -----
 * Last Modified: Thursday, 9th February 2023 8:07:08 pm
 * Modified By: Bruce Blake (hieutv)
 */

import 'dart:io';

import 'package:cat_concierge/components/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'widgets/scan_test_cardview.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _refreshController = RefreshController();
  File? _file;

  Future<void> _openCameraScan() async {
    final filePath = await Navigator.of(context).push<String?>(MaterialPageRoute(
      builder: (context) {
        return const CameraScanPage();
      },
    ));
    if (filePath?.isNotEmpty ?? false) {
      setState(() {
        _file = File(filePath!);
      });
    }
  }

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
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi, John and Pixel',
                      maxLines: 1, style: theme.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Let’s get learning', maxLines: 1, style: theme.textTheme.labelSmall),
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
            ScanTestCardView(onTapScanTest: _openCameraScan),
            if (_file != null) Image.file(_file!),
          ]),
        ),
      ],
    );
  }
}
