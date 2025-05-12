import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:memo_everywhere/core/components/default_alert_dialog.dart';
import 'package:memo_everywhere/core/components/default_layout.dart';
import 'package:memo_everywhere/core/components/default_text_field.dart';
import 'package:memo_everywhere/core/utils/contextExtensions.dart';

import '../../../core/colors/default_colors.dart';
import '../../../core/models/memo.dart';
import 'detail_provider.dart';

class DetailDesktop extends HookConsumerWidget {
  final Memo memo;

  const DetailDesktop({super.key, required this.memo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memoState = useState<Memo>(memo);
    final isEditing = useState(false);
    final titleController = useTextEditingController(text: memo.title);
    final contentController = useTextEditingController(text: memo.content);

    useEffect(() {
      memoState.value = memo;
      titleController.text = memo.title;
      contentController.text = memo.content;
      return null;
    }, [memo.id]);

    final dateFormat = DateFormat('yyyy-MM-dd HH:mm');
    final formattedDate = dateFormat.format(memo.createdAt);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(detailProvider.notifier).resetState();
      });
      return null;
    }, []);

    ref.listen(detailProvider, (previous, next) {
      next.whenData((data) {
        if (data.updateSuccess == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar('Update successful');
            memoState.value = memoState.value.copyWith(
              title: titleController.text,
              content: contentController.text,
            );
          });
          isEditing.value = false;
        }
        if (data.deleteSuccess == true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar('Delete successful');
          });
        }
        if (data.error != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            context.showSnackBar('Update failed: ${data.error}');
          });
        }
      });
    });

    return DefaultLayout(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: isEditing.value
                      ? DefaultTextField(
                          label: '',
                          controller: titleController,
                        )
                      : Text(
                          memoState.value.title,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                ),
                Text(
                  formattedDate,
                  style: const TextStyle(
                    fontSize: 14,
                    color: DefaultColors.grey700,
                  ),
                ),
                const SizedBox(width: 16),
                if (isEditing.value)
                  IconButton(
                    onPressed: () {
                      ref.read(detailProvider.notifier).updateItem(
                            memoState.value.id,
                            titleController.text,
                            contentController.text,
                          );
                      isEditing.value = false;
                    },
                    icon: const Icon(Icons.save),
                  )
                else
                  IconButton(
                    onPressed: () {
                      isEditing.value = true;
                    },
                    icon: const Icon(Icons.edit),
                  ),
                if (isEditing.value)
                  IconButton(
                    onPressed: () {
                      isEditing.value = false;
                    },
                    icon: const Icon(Icons.cancel),
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.delete_forever),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext dialogContext) {
                          return DefaultAlertDialog(
                            onPressed: () {
                              ref
                                  .read(detailProvider.notifier)
                                  .deleteItem(memoState.value.id);
                              Navigator.of(dialogContext).pop();
                            },
                          );
                        },
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Expanded(
              child: isEditing.value
                  ? DefaultTextField(
                      label: '',
                      controller: contentController,
                      keyboardType: TextInputType.multiline,
                      expands: true,
                    )
                  : SingleChildScrollView(
                      child: SelectableText(
                        memoState.value.content,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
