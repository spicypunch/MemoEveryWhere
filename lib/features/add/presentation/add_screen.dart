import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:memo_everywhere/features/add/domain/state/add_state.dart';
import 'package:memo_everywhere/features/add/presentation/add_provider.dart';

import '../../../core/components/default_button.dart';
import '../../../core/components/default_layout.dart';
import '../../../core/components/default_text_form_field.dart';

class AddScreen extends HookConsumerWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<AddState>>(
      addProvider,
      (previous, next) => next.whenOrNull(
        data: (state) {
          if (state.isAdded) {
            context.pop();
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Add Failed')),
            );
          }
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.toString())),
            );
          }
        },
        error: (error, _) => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        ),
      ),
    );

    final titleController = useTextEditingController();
    final contentController = useTextEditingController();

    return DefaultLayout(
      showBackButton: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              DefaultTextFormField(
                label: 'title',
                controller: titleController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20),
              Text(
                'Content',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: DefaultTextFormField(
                  label: 'content',
                  controller: contentController,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                ),
              ),
              SizedBox(height: 20),
              DefaultButton(
                title: 'Submit',
                onTap: () {
                  if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                    ref
                        .read(addProvider.notifier)
                        .addItem(titleController.text, contentController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill in all fields')),
                    );
                  }
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
