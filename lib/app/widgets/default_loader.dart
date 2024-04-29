import 'package:flutter/cupertino.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({super.key, this.height = 100});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: const Center(
        child: CupertinoActivityIndicator(),
      ),
    );
  }
}
