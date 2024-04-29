import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultBtNaviBtn extends StatelessWidget {
  const DefaultBtNaviBtn({
    super.key,
    this.height = 100,
    required this.onTap,
    required this.label,
  });

  final double height;
  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          alignment: Alignment.center,
          constraints: const BoxConstraints(maxHeight: 50),
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(20)),
          child: Text(label),
        ),
      ),
    );
  }
}
