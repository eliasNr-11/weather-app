import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/controllers/search_controller.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchController>(builder: (_) {
      return Container(
        color: customColors[_.currentColorIndex][1],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Text('Sunrise', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text(
                            DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(_.result!.city!.sunrise! * 1000)),
                            style: textStyle16Bold),
                        SizedBox(height: 20.h),
                        Text('Pressure', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text('${_.result?.list?[0]?.main?.pressure} hpa', style: textStyle16Bold),
                        SizedBox(height: 20.h),
                        Text('Wind', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text('${_.result?.list?[0]?.wind?.speed} km/h', style: textStyle16Bold),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Text('Sunset', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text(DateFormat('h:mm a').format(DateTime.fromMillisecondsSinceEpoch(_.result!.city!.sunset! * 1000)), style: textStyle16Bold),
                        SizedBox(height: 20.h),
                        Text('Humidity', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text('${_.result?.list?[0]?.main?.humidity}%', style: textStyle16Bold),
                        SizedBox(height: 20.h),
                        Text('Decription', style: textStyle14Two),
                        SizedBox(height: 10.h),
                        Text('${_.result?.list?[0]?.weather?[0]?.description}', style: textStyle16Bold),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
