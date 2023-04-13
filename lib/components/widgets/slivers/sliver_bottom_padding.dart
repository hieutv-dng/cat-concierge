/*
 * File: sliver_bottom_padding.dart
 * File Created: Thursday, 22nd December 2022 12:03:15 pm
 * Author: Hieu Tran
 * -----
 * Last Modified: Thursday, 22nd December 2022 12:03:29 pm
 * Modified By: Hieu Tran
 */

import 'package:flutter/widgets.dart';

class SliverBottomPadding extends StatelessWidget {
  const SliverBottomPadding({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SliverToBoxAdapter(
      child: SizedBox(height: mediaQuery.padding.bottom),
    );
  }
}
