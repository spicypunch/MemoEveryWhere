import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:memo_everywhere/core/colors/default_colors.dart';
import 'package:memo_everywhere/core/components/default_button.dart';
import 'package:memo_everywhere/core/components/default_layout.dart';
import 'package:memo_everywhere/core/components/default_text_field.dart';

import '../../../core/models/memo.dart';
import 'detail_provider.dart';

class DetailScreen extends HookConsumerWidget {
  final Memo memo;

  const DetailScreen({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoState = useState(memo);
    final isEditing = useState(false);
    final isFirstRender = useState(true);
    final titleController = useTextEditingController(text: memoState.value.title);
    final contentController = useTextEditingController(text: memoState.value.content);

    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final formattedDate = dateFormat.format(memoState.value.createdAt);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(detailProvider.notifier).resetState();
      });
      return null;
    }, []);

    final state = ref.watch(detailProvider);

    useEffect(() {
      if (!isFirstRender.value) {
        state.whenData((data) {
          if (data.updateSuccess == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Update successful'),
                ),
              );

              memoState.value = memoState.value.copyWith(
                title: titleController.text,
                content: contentController.text,
              );
            });
            isEditing.value = false;
          } else if (data.updateSuccess == false && data.error != null) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Update failed: ${data.error}'),
                ),
              );
            });
          }
        });
      } else {
        isFirstRender.value = false;
      }
      return null;
    }, [state]);

    return DefaultLayout(
      showBackButton: true,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Title',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              isEditing.value
                  ? DefaultTextField(
                label: '',
                controller: titleController,
                height: 50,
                fontSize: 18,
                filledColor: DefaultColors.white,
                radius: 12,
              )
                  : Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: DefaultColors.grey400,
                  border: Border.all(color: DefaultColors.grey500),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: DefaultColors.grey700.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  memoState.value.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Content',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: isEditing.value
                    ? DefaultTextField(
                  label: '',
                  controller: contentController,
                  expands: true,
                  fontSize: 16,
                  filledColor: DefaultColors.white,
                  radius: 12,
                )
                    : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 16.0),
                  decoration: BoxDecoration(
                    color: DefaultColors.grey400,
                    border: Border.all(color: DefaultColors.grey500),
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: DefaultColors.grey700.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Text(
                      memoState.value.content,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Created at:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              DefaultButton(
                title: isEditing.value ? 'Save' : 'Update',
                onTap: () {
                  if (isEditing.value) {
                    ref.read(detailProvider.notifier).updateItem(
                      memoState.value.id,
                      titleController.text,
                      contentController.text,
                    );
                  } else {
                    titleController.text = memoState.value.title;
                    contentController.text = memoState.value.content;
                    isEditing.value = true;
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}