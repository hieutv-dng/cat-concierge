/*
 * File: feedback_page.dart
 * File Created: Wednesday, 19th April 2023 8:58:39 am
 * Author: Dương Trí
 * -----
 * Last Modified: Wednesday, 19th April 2023 9:17:47 am
 * Modified By: Dương Trí
 */

import 'package:cat_concierge/components/index.dart';
import 'package:cat_concierge/core/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:one/one.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  Answer answer = Answer.yes;
  int _rate = 0;

  final listFav = [
    Options(name: 'Easy to use', isSelected: false),
    Options(name: 'helpful', isSelected: false),
    Options(name: 'Convenient', isSelected: false),
    Options(name: 'Looks good', isSelected: false),
  ];
  final listCon = [
    Options(name: 'From friends', isSelected: false),
    Options(name: 'Telegram', isSelected: false),
    Options(name: 'Advertising', isSelected: false),
    Options(name: 'Facebook', isSelected: false),
    Options(name: 'Instagram', isSelected: false),
  ];
  final listImp = [
    Options(name: 'Text', isSelected: false),
    Options(name: 'Text', isSelected: false),
    Options(name: 'Text', isSelected: false),
    Options(name: 'Text', isSelected: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
        actions: [
          OneButton.text(
            label: const Text('Edit'),
            onTap: () => {},
          ),
        ],
      ),
      body: SafeArea(child: _buildBody(context)),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    final style = AppTextStyle.fromContext(context);
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: theme.spacing.edgeInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Dear John! We hope you enjoyed doing the test with us!', style: style.headingH2),
                SizedBox(height: theme.spacing.small),
                Text('Help us be better, please.', style: style.bodyL),
                SizedBox(height: theme.spacing.base),
                Text('How would you rate the Cat Concierge App?', style: style.headingH5),
                SizedBox(height: theme.spacing.small),
                _buildRate(),
                SizedBox(height: theme.spacing.base),
                AppTextField(
                  readOnly: true,
                  focusedColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  borderColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  fillColor: answer == Answer.yes ? AppColors.primaryLightest : null,
                  prefixIcon: answer == Answer.yes ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'Yes',
                  label: 'Sterilized',
                  onTap: () {
                    setState(() {
                      answer = Answer.yes;
                    });
                  },
                ),
                SizedBox(height: theme.spacing.small),
                AppTextField(
                  readOnly: true,
                  focusedColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  borderColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  fillColor: answer == Answer.no ? AppColors.primaryLightest : null,
                  prefixIcon: answer == Answer.no ? MySvgs.ic_radio_true : MySvgs.ic_radio_false,
                  text: 'No',
                  onTap: () {
                    setState(() {
                      answer = Answer.no;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TagSelector(title: 'What did you like about it?', data: listFav),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TagSelector(title: 'How did you hear about us?', data: listCon),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TagSelector(title: 'What could be improved?', data: listImp),
                ),
                SizedBox(height: theme.spacing.base),
                const AppTextField(
                  label: 'Anything else?',
                  text: 'Placeholder',
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: theme.spacing.edgeInsets,
          child: _buildSendBtn(context),
        ),
      ],
    );
  }

  Widget _buildRate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
            onTap: () => setState(() {
                  _rate = 1;
                }),
            child: SvgPicture.asset(_rate > 0 ? MySvgs.ic_star_filled : MySvgs.ic_star_outline)),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: () => setState(() {
                  _rate = 2;
                }),
            child: SvgPicture.asset(_rate > 1 ? MySvgs.ic_star_filled : MySvgs.ic_star_outline)),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: () => setState(() {
                  _rate = 3;
                }),
            child: SvgPicture.asset(_rate > 2 ? MySvgs.ic_star_filled : MySvgs.ic_star_outline)),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: () => setState(() {
                  _rate = 4;
                }),
            child: SvgPicture.asset(_rate > 3 ? MySvgs.ic_star_filled : MySvgs.ic_star_outline)),
        const SizedBox(width: 4),
        GestureDetector(
            onTap: () => setState(() {
                  _rate = 5;
                }),
            child: SvgPicture.asset(_rate > 4 ? MySvgs.ic_star_filled : MySvgs.ic_star_outline)),
      ],
    );
  }

  Widget _buildSendBtn(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OneButton.elevated(
        label: const Text('Send Feedback', style: TextStyle(color: Colors.white)),
        onTap: () {
          Get.toNamed('/feedback-finish');
        },
      ),
    );
  }
}
