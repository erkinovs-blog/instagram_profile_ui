import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/src/common/services/api_service.dart';
import 'package:instagram_clone/src/feature/instagram/repository/photo_repository.dart';

import '../../../common/constants/app_colors.dart';
import '../models/photo_model.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/profile_view.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late ScrollController scrollController;
  late IPhotoRepository repository;
  int page = 1;
  List<PhotoModel> photos = [];

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    scrollController = ScrollController();
    repository = PhotoRepositoryImpl(APIService());
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 40.h),
        child: const CustomAppBar(),
      ),
      body: NestedScrollView(
        controller: scrollController,
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, isScrolled) {
          return [
            SliverAppBar(
              backgroundColor: AppColors.white,
              snap: false,
              pinned: false,
              floating: false,
              collapsedHeight: 0.58.sh,
              expandedHeight: 0.58.sh,
              flexibleSpace: ProfileView(url: photos.firstOrNull?.urls?.thumb),
            ),
            SliverPersistentHeader(
              delegate: MySliver(
                TabBar(
                  controller: tabController,
                  tabs: const [
                    Tab(
                        icon: Icon(
                      Icons.grid_on,
                    )),
                    Tab(
                        icon: Icon(
                      Icons.video_collection_outlined,
                    )),
                    Tab(
                        icon: Icon(
                      Icons.account_box_outlined,
                    )),
                  ],
                  indicatorColor: AppColors.red,
                  unselectedLabelColor: AppColors.grey,
                  labelColor: AppColors.black,
                ),
              ),
              pinned: true,
              floating: true,
            ),
          ];
        },
        body: FutureBuilder(
          future: repository.paginationPhotos(page++),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              photos = snapshot.data!;
              return TabBarView(
                controller: tabController,
                children: [
                  GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: photos.length,
                    itemBuilder: (context, index) {
                      PhotoModel photoModel = photos[index];
                      return Card(
                        color: AppColors.white,
                        elevation: 0,
                        child: Image(
                          image: NetworkImage(photoModel.urls?.thumb ?? ""),
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  Container(),
                  Container(),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class MySliver extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  MySliver(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return ColoredBox(
      color: AppColors.white,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
