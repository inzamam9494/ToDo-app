import 'package:flutter/material.dart';

class ColorChoosing extends StatelessWidget {
  void Function()? onTap;
  Color choosingBackgroundColor;
  Color pickupColor;

  ColorChoosing(
      {super.key,
      required this.choosingBackgroundColor,
      required this.pickupColor,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 5),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: choosingBackgroundColor,
            border: Border.all(color: pickupColor),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class ColorChooser extends StatefulWidget {
  final Function(Color) onColorSelected;

  ColorChooser({required this.onColorSelected});

  @override
  _ColorChooserState createState() => _ColorChooserState();
}

class _ColorChooserState extends State<ColorChooser> {
  int selectedColorIndex = 0;

  void _selectColor(int index, Color color) {
    setState(() {
      selectedColorIndex = index;
    });
    widget.onColorSelected(color);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ColorChoosing(
          choosingBackgroundColor: Colors.amber,
          pickupColor: selectedColorIndex == 1 ? Colors.black : Colors.transparent,
          onTap: () {
            _selectColor(1,Colors.amber);
          },
        ),
        ColorChoosing(
          choosingBackgroundColor: Colors.blue.shade200,
          pickupColor: selectedColorIndex == 2 ? Colors.black : Colors.transparent,
          onTap: () {
            _selectColor(2,Colors.blue.shade200);
          },
        ),
        ColorChoosing(
          choosingBackgroundColor: Colors.pink.shade200,
          pickupColor: selectedColorIndex == 3 ? Colors.black : Colors.transparent,
          onTap: () {
            _selectColor(3,Colors.pink.shade200);
          },
        ),
        ColorChoosing(
          choosingBackgroundColor: Colors.greenAccent.shade200,
          pickupColor: selectedColorIndex == 4 ? Colors.black : Colors.transparent,
          onTap: () {
            _selectColor(4,Colors.greenAccent.shade200);
          },
        ),
        ColorChoosing(
          choosingBackgroundColor: Colors.red.shade200,
          pickupColor: selectedColorIndex == 5 ? Colors.black : Colors.transparent,
          onTap: () {
            _selectColor(5,Colors.red.shade200);
          },
        ),
      ],
    );
  }
}
