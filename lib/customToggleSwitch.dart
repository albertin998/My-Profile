import 'package:flutter/material.dart';
import 'package:my_profile/theme/colors_palette.dart';

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
      width: 160,
      height: 58,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        // color: Colors.grey[100],
        border: Border.all(width: 1, color: Colors.grey.shade300),
      ),

      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => widget.onToggle(0),

              style: ElevatedButton.styleFrom(
                overlayColor: ColorsPalette.blue1,
                elevation: 0,
                backgroundColor: widget.SelectedIndex == 0
                    ? Colors.white
                    : const Color(0XFFF8FAFE),
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
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: widget.SelectedIndex == 0
                      ? ColorsPalette.blue2
                      : ColorsPalette.navyBlue2,
                ),
              ),
            ),
          ),

          // Container(
          //   width: 1,
          //   decoration: const BoxDecoration(color: Color(0XFFE1E1EF)),
          // ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => widget.onToggle(1),
              style: ElevatedButton.styleFrom(
                overlayColor: ColorsPalette.blue1,
                elevation: 0,
                backgroundColor: widget.SelectedIndex == 1
                    ? Colors.white
                    : const Color(0XFFF8FAFE),
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
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: widget.SelectedIndex == 1
                      ? ColorsPalette.blue2
                      : ColorsPalette.navyBlue2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
