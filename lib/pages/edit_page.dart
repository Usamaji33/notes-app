import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EditPage extends StatelessWidget {
  const EditPage({
    super.key,
    required this.titleController,
    required this.textController,
    required this.onSave,
  });

  final TextEditingController titleController;
  final TextEditingController textController;
  final Function()? onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              textController.clear();
            },
            child: Icon(
              Icons.clear_all_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: onSave,
            child: Icon(
              Icons.save_rounded,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              "Note It!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            decoration: BoxDecoration(
              color: const Color(0x88888888),
              border: Border.all(
                color: Theme.of(context).colorScheme.primary,
                width: 3,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: TextField(
              controller: titleController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: "Title it!",
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.w600,
              ),
              cursorColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                color: const Color(0x88888888),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 2,
                ),
              ),
              child: TextField(
                controller: textController,
                minLines: null,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  hintText: "Write it!",
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.w500,
                ),
                scrollPhysics: const BouncingScrollPhysics(),
                cursorColor: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
