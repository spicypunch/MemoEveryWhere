import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/home/presentaion/home_provider.dart';

import '../../../core/components/default_layout.dart';
import '../domain/entity/memo.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMobile = Platform.isAndroid || Platform.isIOS;

    if (kIsWeb) {
      isMobile = false;
    }

    final state = ref.watch(homeProvider);

    return DefaultLayout(
      showBackButton: true,
      showFloatingActionButton: true,
      onFloatingActionButtonPressed: () {
        context.pushNamed('add');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: state.when(
          data: (data) {
            return isMobile
                ? _buildMobileLayout(data.memos)
                : _buildDesktopLayout(data.memos);
                    },
          error: (error, stackTrace) {
            return Center(child: Text('Error: $error'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout(List<Memo> memos) {
    return ListView.builder(
      itemCount: memos.length,
      itemBuilder: (context, index) {
        final memo = memos[index];
        return ListTile(
          title: Text(memo.title),
          subtitle: Text(memo.content),
          onTap: () {
            context
                .pushNamed('detail', extra: memo);
          },
        );
      },
    );
  }

  Widget _buildDesktopLayout(List<Memo> memos) {
    return Center(
      child: Text('헤응'),
    );
  }
}
