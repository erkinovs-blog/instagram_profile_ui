import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/src/feature/instagram/mixin/my_snackbar.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> with MySnackbar {
  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0.5,
      surfaceTintColor: AppColors.white,
      centerTitle: false,
      backgroundColor: AppColors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "ibn.ravshan",
            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 4.r),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            height: 18.r,
            width: 28.r,
            alignment: Alignment.center,
            child: Text(
              "10+",
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () =>
              showCustomSnackBar(context: context, text: "Add icon pressed"),
          child: SizedBox(
            width: 24.r,
            height: 24.r,
            child: const Image(
              image: AssetImage(AppIcons.add),
            ),
          ),
        ),
        SizedBox(width: 24.r),
        GestureDetector(
          onTap: () =>
              showCustomSnackBar(context: context, text: "Menu icon pressed"),
          child: SizedBox(
            width: 24.r,
            height: 24.r,
            child: const Image(
              image: AssetImage(AppIcons.menu),
            ),
          ),
        ),
        SizedBox(
          width: 14.r,
        )
      ],
    );
  }
}
