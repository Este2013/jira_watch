import 'package:flutter/material.dart';

Future<bool?> requestConfirmation(BuildContext context, String message) => showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: Text('🤨 Are you sure?'),
    content: Text(message),
    actions: [
      TextButton(onPressed: Navigator.of(context).pop, child: Text('Cancel')),
      FilledButton(
        onPressed: () => Navigator.of(context).pop(true),
        style: FilledButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.errorContainer,
          foregroundColor: Theme.of(context).colorScheme.onErrorContainer,
        ),
        child: Text('I know what I am doing'),
      ),
    ],
  ),
);

class CancelButton extends StatelessWidget {
  const CancelButton({super.key, this.requestConfirmationMessage});

  final String? requestConfirmationMessage;

  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: () {
      if (requestConfirmationMessage == null) {
        return Navigator.pop(context);
      }
      requestConfirmation(context, requestConfirmationMessage!).then(
        (value) {
          if (value ?? false) {
            // ignore: use_build_context_synchronously
            Navigator.pop(context);
          }
        },
      );
    },
    child: Text('Cancel'),
  );
}
