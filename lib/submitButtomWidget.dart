import 'package:flutter/material.dart';
import 'package:my_profile/theme/colors_palette.dart';

class Submitbuttomwidget extends StatefulWidget {
  const Submitbuttomwidget({super.key});

  @override
  State<Submitbuttomwidget> createState() => _SubmitbuttomwidgetState();
}

class _SubmitbuttomwidgetState extends State<Submitbuttomwidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: ColorsPalette.blue2),

      onPressed: () {},
      child: Center(
        child: Text(
          'Salvar Alterações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
