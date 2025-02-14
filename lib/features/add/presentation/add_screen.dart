import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/core/components/default_layout.dart';

class AddScreen extends HookConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(showBackButton: true,title: 'Add', child: Center(child: Text('Add'),));
  }
}
