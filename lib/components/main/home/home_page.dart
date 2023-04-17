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
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    return AppBackground(
      child: SafeArea(
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
      backgroundColor: Colors.transparent,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacing.small),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Hi, John and Pixel', maxLines: 1, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text('Let’s get learning', maxLines: 1, style: theme.textTheme.labelSmall),
                ],
              ),
            ),
          ),
          _buildProfileBtn(context),
        ],
      ),
    );
  }

  Widget _buildProfileBtn(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: Colors.transparent,
      child: FloatingActionButton.small(
        shape: const CircleBorder(),
        backgroundColor: AppColors.primaryLightest,
        foregroundColor: AppColors.primary,
        child: Padding(
          padding: theme.spacing.smallEdgeInsets,
          child: SvgPicture.asset(
            MySvgs.ic_user,
            colorFilter: ColorFilter.mode(theme.primaryColor, BlendMode.srcIn),
          ),
        ),
        onPressed: () => Get.toNamed('/profile'),
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
      child: Container(margin: const EdgeInsets.only(top: 60), child: _buildContent(context)),
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
