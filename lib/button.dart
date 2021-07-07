import 'package:flutter/material.dart';

class ExpandedDivider extends StatelessWidget {
  const ExpandedDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(),
    );
  }
}
