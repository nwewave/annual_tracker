import 'dart:ui';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor, double? opacity) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    opacity = opacity ?? 1.0;
    String convertedOpacity = ((opacity * 255).round()).toRadixString(16);

    if (hexColor.length == 6) {
      hexColor = "$convertedOpacity$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor({
    required this.hexColor,
    double opacity = 1.0,
  }) : super(_getColorFromHex(hexColor, opacity));

  final String hexColor;
}

// class DefaultLoader extends StatelessWidget {
//   const DefaultLoader({super.key, this.height = 100});

//   final double height;

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: const Center(
//         child: CupertinoActivityIndicator(),
//       ),
//     );
//   }
// }
