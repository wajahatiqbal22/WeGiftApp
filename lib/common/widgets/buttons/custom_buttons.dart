// Flutter imports:

import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wegift/common/colors.dart';

// Project imports:

const double _defaultWidth = 350;
const double _defaultHeight = 50;
const _defaultColor = Colors.white;
const _defaultTextColor = Colors.black;

/// This Widget Creates Main Button
///
class RoundedButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final double bottomMargin;
  final VoidCallback? onPressed;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final double? elevation;

  const RoundedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.width = _defaultWidth,
    this.height = _defaultHeight,
    this.bottomMargin = 10,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      padding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              onPressed == null ? Colors.grey : color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          elevation: MaterialStateProperty.all(elevation),
        ),
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.inter(
              textStyle: Theme.of(context).textTheme.headline4,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class RoundedButtonIcon extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final double width;
  final double height;
  final double bottomMargin;
  final Function onPressed;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final dynamic icon;

  const RoundedButtonIcon({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.width = _defaultWidth,
    this.height = _defaultHeight,
    this.bottomMargin = 10,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: bottomMargin),
      padding: EdgeInsets.only(
          top: paddingTop,
          right: paddingRight,
          bottom: paddingBottom,
          left: paddingLeft),
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: () => onPressed(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        icon: icon,
        label: Text(
          text,
          style: GoogleFonts.inter(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class RoundedButtonIcon2 extends StatelessWidget {
  final Widget text;
  final Widget icon;
  final Color backgroundColor;
  final double elevation;
  final double borderRadius;
  final double width;
  final double height;
  final EdgeInsets padding;
  final Color shadowColor;

  const RoundedButtonIcon2({
    super.key,
    required this.text,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.elevation = 1,
    this.borderRadius = 10,
    this.width = double.infinity,
    this.height = 50,
    this.padding = const EdgeInsets.all(0),
    this.shadowColor = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: icon,
        label: text,
        style: ElevatedButton.styleFrom(
          //TODO: Uncomment blow line
          // backgroundColor: backgroundColor,
          shadowColor: shadowColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: const BorderSide(
                width: 0.5, color: Color.fromRGBO(0, 0, 0, 0.1)),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}

class RoundedButtonSvg extends StatelessWidget {
  final String text;
  final dynamic svg;
  final Color color;
  final Color textColor;
  final double height;
  final double width;
  final double paddingLeft;
  final double paddingRight;
  final double paddingTop;
  final double paddingBottom;
  final dynamic onPressed;
  final double marginTop;
  final double marginBottom;
  final double marginLeft;
  final double marginRight;
  final Color shadowColor;
  final BoxDecoration decoration;

  const RoundedButtonSvg({
    super.key,
    required this.text,
    required this.svg,
    required this.onPressed,
    this.color = _defaultColor,
    this.textColor = _defaultTextColor,
    this.height = _defaultHeight,
    this.width = _defaultWidth,
    this.paddingLeft = 0.0,
    this.paddingRight = 0.0,
    this.paddingTop = 0.0,
    this.paddingBottom = 0.0,
    this.marginBottom = 0.0,
    this.marginLeft = 0.0,
    this.marginRight = 0.0,
    this.marginTop = 0.0,
    this.shadowColor = Colors.transparent,
    this.decoration = const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Color(0x0D000000),
        spreadRadius: 2,
        blurRadius: 5,
        offset: Offset(0, 4),
      ),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      height: height,
      width: width,
      padding: EdgeInsets.only(
          left: paddingLeft,
          right: paddingRight,
          top: paddingTop,
          bottom: paddingBottom),
      margin: EdgeInsets.only(
          left: marginLeft,
          right: marginRight,
          top: marginTop,
          bottom: marginBottom),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: Color(0xFFD3DCE4),
                width: 0.5,
              ),
            ),
          ),
          shadowColor: MaterialStateProperty.all(shadowColor),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            svg,
            Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: textColor,
              ),
            ),
            Opacity(
              opacity: 0,
              child: svg,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomNavBarIcons extends StatelessWidget {
  final String asset;
  final double width;
  final Function() onPressed;

  const CustomNavBarIcons({
    super.key,
    required this.onPressed,
    required this.asset,
    this.width = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.white,
      child: IconButton(
        onPressed: onPressed,
        icon: SvgPicture.asset(
          asset,
          width: width,
        ),
      ),
    );
  }
}

// class CustomGridButton extends StatelessWidget {
//   final String text;
//   final bool isFocused;

//   const CustomGridButton({
//     super.key,
//     required this.text,
//     this.isFocused = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     Color textColor = Colors.black;
//     FontWeight fontWeight = FontWeight.normal;
//     Color borderColor = CustomColors.grey25Black;

//     if (isFocused) {
//       textColor = CustomColors.blue;
//       borderColor = CustomColors.blue;
//       fontWeight = FontWeight.w600;
//     }

//     return Container(
//       margin: const EdgeInsets.only(right: 12),
//       child: OutlinedButton(
//         onPressed: () {},
//         style: OutlinedButton.styleFrom(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           side: BorderSide(
//             color: borderColor,
//             width: 1,
//           ),
//         ),
//         child: InterText(
//           text: text,
//           color: textColor,
//           fontWeight: fontWeight,
//         ),
//       ),
//     );
//   }
// }

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const CustomOutlinedButton({
    super.key,
    required this.onPressed,
    this.text = "Join",
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: const BorderSide(
            color: CustomColors.grey25Black,
            width: 1,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10)),
      child: Text(text,
          style: const TextStyle(
            color: CustomColors.blue,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          )),
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({Key? key}) : super(key: key);

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16,
      height: 16,
      child: Checkbox(
        side: const BorderSide(
          width: 1,
          color: CustomColors.grey50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        value: _isChecked,
        onChanged: (bool? isChecked) {
          setState(() {
            _isChecked = isChecked!;
          });
        },
      ),
    );
  }
}

/// TODO:
/// - fix isChecked (is inverted)
class CustomRadioButton extends StatefulWidget {
  final bool isChecked;
  const CustomRadioButton({
    Key? key,
    this.isChecked = true,
  }) : super(key: key);

  @override
  State<CustomRadioButton> createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Radio<bool>(
      value: widget.isChecked,
      groupValue: _isChecked,
      onChanged: (isChecked) {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      toggleable: true,
      activeColor: CustomColors.blue,
    );
  }
}

// class CustomFlutterSwitch extends StatefulWidget {
//   const CustomFlutterSwitch({Key? key}) : super(key: key);

//   @override
//   State<CustomFlutterSwitch> createState() => _CustomFlutterSwitchState();
// }

// class _CustomFlutterSwitchState extends State<CustomFlutterSwitch> {
//   bool _makePrivateStatus = false;

//   @override
//   Widget build(BuildContext context) {
//     return FlutterSwitch(
//       value: _makePrivateStatus,
//       width: 35,
//       height: 20,
//       padding: 2,
//       toggleSize: 15,
//       activeColor: CustomColors.blue,
//       inactiveColor: CustomColors.grey25Black,
//       onToggle: (val) {
//         setState(() {
//           _makePrivateStatus = val;
//         });
//       },
//     );
//   }
// }

// class CustomDropdownButton extends StatefulWidget {
//   final List<String> list;
//   const CustomDropdownButton({
//     Key? key,
//     required this.list,
//   }) : super(key: key);

//   @override
//   State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
// }

// class _CustomDropdownButtonState extends State<CustomDropdownButton> {
//   @override
//   Widget build(BuildContext context) {
//     String dropdownValue = widget.list.first;
//     return DropdownButtonFormField<String>(
//       value: dropdownValue,
//       icon: const Icon(Iconsax.arrow_down_1),
//       elevation: 16,
//       style: const TextStyle(color: CustomColors.grey75),
//       isExpanded: true,
//       decoration: InputDecoration(
//         fillColor: CustomColors.blue50,
//         filled: true,
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: const BorderSide(
//             width: 2,
//             color: CustomColors.blue,
//           ),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10.0),
//           borderSide: const BorderSide(
//             color: CustomColors.grey25Black,
//             width: 0.5,
//           ),
//         ),
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//       borderRadius: BorderRadius.circular(10.0),
//       onChanged: (String? value) {
//         // This is called when the user selects an item.
//         setState(() {
//           dropdownValue = value!;
//         });
//       },
//       items: widget.list.map<DropdownMenuItem<String>>((String value) {
//         return DropdownMenuItem<String>(
//           value: value,
//           child: Text(value),
//         );
//       }).toList(),
//     );
//   }
// }
