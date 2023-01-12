import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/views/components/app_drawer.dart';
import 'package:weather_app/views/components/bottom_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent[400]!,
            Colors.orange[900]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.orangeAccent[400],
          centerTitle: true,
          leading: Builder(builder: (scaffoldContext) {
            return IconButton(
              splashRadius: 22.r,
              icon: Icon(Icons.menu,
                  color: isOpened ? Colors.transparent : Colors.white),
              onPressed: () {
                Scaffold.of(scaffoldContext).openDrawer();
              },
            );
          }),
          title: Text(DateFormat('EEE, MMMM M').format(DateTime.now()),
              style: textStyle18),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.all(10.r),
                  minimumSize: Size.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r)),
                ),
                child: Text('°C', style: textStyle18),
              ),
            ),
          ],
        ),
        onDrawerChanged: (isOpen) {
          setState(() {
            isOpened = isOpen;
          });
        },
        drawer: const AppDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
                            child: Text('Addis Ababa', style: textStyle20),
                          ),
                          Divider(
                            height: 1.h,
                            color: Colors.white,
                            endIndent: 200.w,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Stack(
                              children: [
                                Text('28°', style: textStyleBig),
                                Positioned(
                                  bottom: 0.h,
                                  child: Row(
                                    children: [
                                      Icon(Icons.arrow_upward,
                                          color: Colors.white, size: 16.sp),
                                      Text('29°', style: textStyle16),
                                      Icon(Icons.arrow_downward,
                                          color: Colors.white, size: 16.sp),
                                      Text('18°', style: textStyle16),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text('Sunny', style: textStyle20Bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 40.h),
                            child:
                                Text('Feels like 29°', style: textStyle14Two),
                          ),
                        ],
                      ),
                      Positioned(
                        right: -160.w,
                        child: Container(
                          padding: EdgeInsets.all(40.r),
                          decoration: BoxDecoration(
                            color: Colors.orange[500]?.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.sunny,
                              size: 240.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Divider(height: 1.h, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      5,
                      (index) => Column(
                        children: [
                          Text('Now', style: textStyle14Two),
                          Text('28°', style: textStyle20Bold),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child: Divider(height: 1.h, color: Colors.white),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  child: Column(
                    children: List.generate(
                      6,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tuesday', style: textStyle16Bold),
                            Icon(Icons.cloud_outlined,
                                size: 18.sp, color: Colors.white),
                            Row(
                              children: [
                                Text('28', style: textStyle14),
                                SizedBox(width: 15.w),
                                Text('17', style: textStyle14Two),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const BottomInfo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}