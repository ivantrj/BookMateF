import 'package:bookmate/database/book_database.dart';
import 'package:flutter/material.dart';
import 'package:bookmate/models/book.dart';

class AddBookWidget extends StatefulWidget {
  final Book? book;
  final ValueChanged<String> onSubmit;

  const AddBookWidget({super.key, this.book, required this.onSubmit});

  @override
  State<AddBookWidget> createState() => _AddBookWidgetState();
}

class _AddBookWidgetState extends State<AddBookWidget> {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    controller.text = widget.book?.title ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.book != null;
    return AlertDialog(
      title: Text(isEditing ? 'Edit Book' : 'Add Book'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              widget.onSubmit(controller.text);
              Navigator.of(context).pop();
            }
          },
          child: Text(isEditing ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
