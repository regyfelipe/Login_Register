import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialButton({
    super.key,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      height: 60, 
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12), 
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1, 
        ),
      ),
      child: Center(
        child: Icon(icon, color: color), 
      ),
    );
  }
}
