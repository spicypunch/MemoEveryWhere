import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/presentaion/home_provider.dart';

import '../../../core/components/default_layout.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMobile = Platform.isAndroid || Platform.isIOS;

    if (kIsWeb) {
      isMobile = false;
    }

    return DefaultLayout(
      showBackButton: true,
      showFloatingActionButton: true,
      onFloatingActionButtonPressed: () {
        context.pushNamed('add');
      },
      child: Center(child: ElevatedButton(onPressed: ref.read(homeProvider.notifier).getMemos, child: Text('123')))
      // Padding(
      //   padding: EdgeInsets.symmetric(
      //     horizontal: 20.0,
      //   ),
      //   child: isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
      // ),

    );
  }

  // Widget _buildMobileLayout() {
  //   return ListView.builder(
  //     itemCount: memos.length,
  //     itemBuilder: (context, index) {
  //       return ListTile(
  //         title: Text(memos[index].title),
  //         onTap: () {
  //           context
  //               .pushNamed('detail', pathParameters: {'id': index.toString()});
  //         },
  //       );
  //     },
  //   );
  // }

  Widget _buildDesktopLayout() {
    return Center(
      child: Text('마루'),
    );
  }
}
