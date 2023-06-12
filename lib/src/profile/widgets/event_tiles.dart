import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wegift/src/home/model/notifications_settings.dart';

class EventTiles extends StatelessWidget {
  const EventTiles({
    Key? key,
    required this.text,
    required this.isNotifcationSection,
    this.onChanged,
    this.type,
    this.titleStyle = const TextStyle(fontSize: 18, color: Colors.grey),
    required this.value,
  }) : super(key: key);
  final String text;
  final bool isNotifcationSection;
  final NotificationTypes? type;
  final Function(bool)? onChanged;
  final bool value;
  final TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: titleStyle,
          ),
          CupertinoSwitch(
            activeColor: Colors.blue.shade700,
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
