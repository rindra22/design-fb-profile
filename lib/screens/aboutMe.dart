import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  final IconData icon;
  final String text;

  const AboutMe({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Icon(
            icon,
            color: Color.fromARGB(221, 56, 55, 55),
            size: 18,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              text,
              style:
                  TextStyle(fontSize: 17, color: Color.fromARGB(221, 56, 55, 55)),
            ),
          ),
        )
      ],
    );
  }
}
