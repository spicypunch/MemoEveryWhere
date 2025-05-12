import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../colors/default_colors.dart';

class DefaultAlertDialog extends StatelessWidget {
  final VoidCallback onPressed;

  const DefaultAlertDialog({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Delete Memo'),
      content: const Text('Are you sure you want to delete this memo?'),
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
            onPressed();
          },
          child: const Text('Confirm'),
        )
      ],
    );
  }
}
