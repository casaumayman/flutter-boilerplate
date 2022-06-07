import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget(
      {Key? key, required this.isLoading, this.message, required this.child})
      : super(key: key);

  final bool isLoading;
  final String? message;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Opacity(opacity: isLoading ? 0.2 : 1, child: child),
      isLoading
          ? Center(
              child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                !(this.message?.isEmpty ?? false)
                    ? Column(children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          this.message ?? '',
                          style: TextStyle(fontSize: 15.0),
                        )
                      ], mainAxisSize: MainAxisSize.min)
                    : Container()
              ],
            ))
          : Container(),
    ]);
  }
}
