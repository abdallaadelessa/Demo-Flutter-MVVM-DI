import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()]),
      );
}
