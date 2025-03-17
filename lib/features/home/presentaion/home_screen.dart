import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/core/utils/contextExtensions.dart';
import 'package:memo_everywhere/features/home/presentaion/home_provider.dart';

import '../../../core/colors/default_colors.dart';
import '../../../core/components/default_layout.dart';
import '../../../core/models/memo.dart';
import '../../auth/presentation/auth_provider.dart';

class HomeScreen extends HookConsumerWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isMobile = Platform.isAndroid || Platform.isIOS;

    if (kIsWeb) {
      isMobile = false;
    }

    final state = ref.watch(homeProvider);

    ref.listen(authProvider, (previous, next) {
      next.whenOrNull(data: (data) {
        if (data.isSignedOut == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar('Sign out successful');
            context.goNamed('signin');
            ref.read(authProvider.notifier).resetState();
          });
        } else if (data.error != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar('Sign out failed');
          });
        }
      });
    });

    return DefaultLayout(
      title: '',
      actions: [
        IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('SignOut'),
                      content: const Text('Are you sure you want to sign out?'),
                      backgroundColor: DefaultColors.grey300,
                      actions: [
                        TextButton(
                          onPressed: () {
                            context.pop();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            ref.read(authProvider.notifier).signOut();
                            context.pop();
                          },
                          child: const Text('Confirm'),
                        )
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.logout_rounded))
      ],
      showFloatingActionButton: true,
      onFloatingActionButtonPressed: () {
        context.pushNamed('add');
      },
      child: SafeArea(
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
      ),
    );
  }

  Widget _buildMobileLayout(List<Memo> memos) {
    return ListView.builder(
      itemCount: memos.length,
      itemBuilder: (context, index) {
        final memo = memos[index];
        return ListTile(
          title: Text(
            memo.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          subtitle: Text(
            memo.content,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          onTap: () {
            context.pushNamed('detail', extra: memo);
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
