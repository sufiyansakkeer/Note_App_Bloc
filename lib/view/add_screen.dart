import 'package:flutter/material.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(),
            TextField(),
            FilledButton(onPressed: () {}, child: Text('add')),
          ],
        ),
      ),
    );
  }
}
