import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ErrorPlaceHolder extends StatelessWidget {
  final String errorMessage;
  final Function retryAction;

  ErrorPlaceHolder({this.errorMessage, this.retryAction});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        MaterialButton(
          onPressed: retryAction,
          child: new Text(
            "Retry",
            style: new TextStyle(
              fontSize: 20.0,
              color: Colors.redAccent,
            ),
          ),
        )
      ]),
    );
  }
}
