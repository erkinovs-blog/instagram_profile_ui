import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/src/common/constants/app_colors.dart';

import 'profile_counts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.url});
  final String? url;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r, vertical: 10.r),
            child: Column(
              children: [
                SizedBox(
                  width: 650.r,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45.w.clamp(0, 60),
                        backgroundColor: Colors.grey,
                        backgroundImage: widget.url != null
                            ? NetworkImage(widget.url!)
                            : null,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const ProfileCounts(text: "Posts", count: "1,234"),
                          24.horizontalSpace,
                          const ProfileCounts(
                              text: "Followers", count: "5,678"),
                          24.horizontalSpace,
                          const ProfileCounts(
                              text: "Following", count: "9,101"),
                        ],
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ibn.ravshan",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Category/Genre text",
                      style: TextStyle(
                        color: AppColors.categoryTextColor,
                        fontSize: 13.sp,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag",
                      style: TextStyle(
                        fontSize: 13.sp,
                        height: 1.5,
                      ),
                    ),
                    Text(
                      "Link goes here",
                      style: TextStyle(
                          color: AppColors.linkTextColor,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    SizedBox(
                      width: 70.r,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            right: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    10.horizontalSpace,
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.black,
                              overflow: TextOverflow.ellipsis),
                          children: const [
                            TextSpan(text: "Followed by "),
                            TextSpan(
                              text: "username, username ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "and "),
                            TextSpan(
                              text: "100 others",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                15.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        height: 40.r,
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.all(
                            const Radius.circular(3).r,
                          ),
                        ),
                        child: Text(
                          "Edit profile",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 5.r),
                      height: 40.r,
                      width: 40.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          const Radius.circular(3).r,
                        ),
                        color: AppColors.buttonColor,
                      ),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.person_add_outlined,
                        size: 18.r,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 14.r),
              separatorBuilder: (context, index) {
                return 10.horizontalSpace;
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 80.r,
                      height: 80.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.grey, width: 3),
                        color: Colors.transparent,
                      ),
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.accents[index % 15],
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Text(
                      "Text here",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
