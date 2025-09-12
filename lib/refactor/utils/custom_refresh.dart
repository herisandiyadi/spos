import 'dart:io';

import 'package:flutter/material.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class PlatformAwareRefreshControl extends StatelessWidget {
  final Future<void> Function()? onRefresh;
  final Widget listViewContent;

  const PlatformAwareRefreshControl({super.key, this.onRefresh, required this.listViewContent});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? _buildIOSRefreshControl() : _buildAndroidRefreshControl(context);
  }

  Widget _buildIOSRefreshControl() {
    return listViewContent;
  }

  Widget _buildAndroidRefreshControl(BuildContext context) {
    return RefreshIndicator(
      color: primaryColor,
      onRefresh: onRefresh!,
      child: listViewContent,
    );
  }
}