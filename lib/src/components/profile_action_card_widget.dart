import 'package:flutter/material.dart';

class ProfileActionCardWidget extends StatelessWidget {
  const ProfileActionCardWidget({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  final String title;
  final Color bgColor;
  final Widget icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: bgColor,
          ),
          child: ListTile(
            leading: icon,
            title: Text(title),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ),
      ),
    );
  }
}
