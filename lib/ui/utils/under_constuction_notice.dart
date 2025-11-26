import 'package:flutter/material.dart';

class UnderConstructionNotice extends StatelessWidget {
  const UnderConstructionNotice({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
    child: Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('🚧', style: TextStyle(fontSize: 100)),
        Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Text('Under construction', style: TextStyle(fontSize: 32)),
            Text('Send me a heart or a coffee to accelerate development.'),
          ],
        ),
      ],
    ),
  );
}
