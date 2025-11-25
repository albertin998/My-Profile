import 'package:flutter/material.dart';

class CustomToggleSwitch extends StatefulWidget {
  final Function(int) onToggle;
  final int SelectedIndex;

  CustomToggleSwitch({
    super.key,
    required this.SelectedIndex,
    required this.onToggle,
  });

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 58,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.grey[100],
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => widget.onToggle(0),

              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.infinite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    bottomLeft: Radius.circular(35),
                  ),
                ),
              ),
              child: Text(
                'Perfil',
                style: TextStyle(
                  color: widget.SelectedIndex == 0
                      ? Colors.blue
                      : Colors.grey[700],
                ),
              ),
            ),
          ),

          Container(
            width: 1,
            decoration: const BoxDecoration(color: Color(0XFFE1E1EF)),
          ),

          Expanded(
            child: ElevatedButton(
              onPressed: () => widget.onToggle(1),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.infinite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.only(
                    bottomRight: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
              ),

              child: Text(
                'Acesso',
                style: TextStyle(
                  color: widget.SelectedIndex == 1 ? Colors.blue : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
