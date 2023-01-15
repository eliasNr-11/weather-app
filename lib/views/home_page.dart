import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/controllers/search_controller.dart';
import 'package:weather_app/views/components/app_drawer.dart';
import 'package:weather_app/views/components/bottom_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final SearchController searchController = Get.put(SearchController());

  @override
  void initState() {
    Get.find<SearchController>().fetchWeather();
    super.initState();
  }

  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(
      builder: (_) {
        return _.isLoading
            ? Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF002145),
                      Color(0xFF000811),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Center(
                  child: Transform.scale(
                      scale: 2,
                      child: const CircularProgressIndicator(
                          color: Colors.white, strokeWidth: 2)),
                ),
              )
            : _.isError
                ? Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF002145),
                          Color(0xFF000811),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Scaffold(
                      onDrawerChanged: (isOpen) {
                        SchedulerBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          setState(() {
                            isOpened = isOpen;
                          });
                        });
                      },
                      backgroundColor: Colors.transparent,
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(Icons.paragliding_outlined,
                              color: Colors.white, size: 96.sp),
                          SizedBox(height: 20.h),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Oops!', style: textStyleBigTwo),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 40.w),
                            child: Text(
                              'We couldn\'t connect you to the page you are looking for.',
                              style: textStyle16Two,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 60.w, vertical: 20.h),
                            child: TextButton(
                              onPressed: () {
                                _.changeError();
                                _.fetchWeather();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                primary: Colors.black,
                                padding: EdgeInsets.all(14.r),
                              ),
                              child: Text(
                                'Try again',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          customColors[_.currentColorIndex][0],
                          customColors[_.currentColorIndex][1],
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
                        surfaceTintColor: customColors[_.currentColorIndex][0],
                        centerTitle: true,
                        leading: Builder(builder: (scaffoldContext) {
                          return IconButton(
                            splashRadius: 22.r,
                            icon: Icon(Icons.menu,
                                color: isOpened
                                    ? Colors.transparent
                                    : Colors.white),
                            onPressed: () {
                              Scaffold.of(scaffoldContext).openDrawer();
                            },
                          );
                        }),
                        title: Text(
                            DateFormat('EEE, MMMM M').format(DateTime.now()),
                            style: textStyle18),
                        actions: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: TextButton(
                              onPressed: () {
                                _.changeUnit();
                                _.fetchWeather();
                              },
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                padding: EdgeInsets.all(10.r),
                                minimumSize: Size.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              ),
                              child: Text(_.isMetric ? '°C' : '°F',
                                  style: textStyle18),
                            ),
                          ),
                        ],
                      ),
                      onDrawerChanged: (isOpen) {
                        SchedulerBinding.instance
                            .addPostFrameCallback((timeStamp) {
                          setState(() {
                            isOpened = isOpen;
                          });
                        });
                      },
                      drawer: AppDrawer(cont: _),
                      body: RefreshIndicator(
                        color: customColors[_.currentColorIndex][1],
                        displacement: 50.h,
                        onRefresh: () {
                          _.fetchWeather();
                          return Future.delayed(Duration(seconds: 2));
                        },
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.h),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 30.w),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                top: 40.h, bottom: 10.h),
                                            child: Text(
                                                _.result?.city?.name as String,
                                                style: textStyle20),
                                          ),
                                          Divider(
                                            height: 1.h,
                                            color: Colors.white,
                                            endIndent: 200.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 20.h),
                                            child: Stack(
                                              children: [
                                                Text(
                                                    '${_.result?.list?[0]?.main?.temp?.toStringAsFixed(0)}°',
                                                    style: textStyleBig),
                                                Positioned(
                                                  bottom: 0.h,
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.arrow_upward,
                                                          color: Colors.white,
                                                          size: 16.sp),
                                                      Text(
                                                          '${_.result?.list?[0]?.main?.tempMax?.toStringAsFixed(0)}°',
                                                          style: textStyle16),
                                                      SizedBox(width: 5.w),
                                                      Icon(Icons.arrow_downward,
                                                          color: Colors.white,
                                                          size: 16.sp),
                                                      Text(
                                                          '${_.result?.list?[0]?.main?.tempMin?.toStringAsFixed(0)}°',
                                                          style: textStyle16),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 10.h),
                                            child: Text(
                                                '${_.result?.list?[0]?.weather?[0]?.main}',
                                                style: textStyle20Bold),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 40.h),
                                            child: Text(
                                                'Feels like ${_.result?.list?[0]?.main?.feelsLike?.toStringAsFixed(0)}°',
                                                style: textStyle14Two),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: -160.w,
                                        child: Container(
                                          padding: EdgeInsets.all(40.r),
                                          decoration: BoxDecoration(
                                            color: customColors[
                                                _.currentColorIndex][2],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                              _.weatherIcon(_.result!.list![0]!
                                                  .weather![0]!.icon!),
                                              size: 240.sp,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child:
                                      Divider(height: 1.h, color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Row(
                                    mainAxisAlignment: _.todaysTemp.length >= 5
                                        ? MainAxisAlignment.spaceBetween
                                        : MainAxisAlignment.start,
                                    children: List.generate(
                                      _.todaysTemp.length > 5
                                          ? 5
                                          : _.todaysTemp.length,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(
                                            right: _.todaysTemp.length >= 5
                                                ? 0
                                                : 54.w),
                                        child: Column(
                                          children: [
                                            Text(
                                                index == 0
                                                    ? 'Now'
                                                    : DateFormat('h a').format(_
                                                        .todaysTemp[index]
                                                        .dtTxt!),
                                                style: textStyle14Two),
                                            Text(
                                                '${_.todaysTemp[index].main?.temp?.toStringAsFixed(0)}°',
                                                style: textStyle20Bold),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.h),
                                  child:
                                      Divider(height: 1.h, color: Colors.white),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30.w, vertical: 10.h),
                                  child: Column(
                                    children: List.generate(
                                      _.weekDaysTemp.length - 1,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(bottom: 15.h),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                                width: 120.w,
                                                child: Text(
                                                    DateFormat('EEEE').format(_
                                                        .weekDaysTemp[index + 1]
                                                        .dtTxt!),
                                                    style: textStyle16Bold)),
                                            Expanded(
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 56.w),
                                                  child: Icon(
                                                    _.weatherIcon(_
                                                        .weekDaysTemp[index + 1]
                                                        .weather![0]!
                                                        .icon!),
                                                    size: 18.sp,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 40.w,
                                                  child: Text(
                                                      '${_.weekDaysTemp[index + 1].main?.tempMin?.toStringAsFixed(0)}',
                                                      style: textStyle14),
                                                ),
                                                Text(
                                                    '${_.weekDaysTemp[index + 1].main?.tempMax?.toStringAsFixed(0)}',
                                                    style: textStyle14Two),
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
                    ),
                  );
      },
    );
  }
}
