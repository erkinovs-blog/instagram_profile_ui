import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCounts extends StatelessWidget {
  const ProfileCounts({
    required this.text,
    required this.count,
    super.key,
  });
  final String text;
  final String count;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count,
          style: TextStyle(
            overflow: TextOverflow.ellipsis,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
