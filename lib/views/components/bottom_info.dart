import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants.dart';

class BottomInfo extends StatelessWidget {
  const BottomInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[900]?.withOpacity(0.5),
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
                      Text('3:55 am', style: textStyle16Bold),
                      SizedBox(height: 20.h),
                      Text('Percipitation', style: textStyle14Two),
                      SizedBox(height: 10.h),
                      Text('10%', style: textStyle16Bold),
                      SizedBox(height: 20.h),
                      Text('Wind', style: textStyle14Two),
                      SizedBox(height: 10.h),
                      Text('11 km/h', style: textStyle16Bold),
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
                      Text('6:15 pm', style: textStyle16Bold),
                      SizedBox(height: 20.h),
                      Text('Humidity', style: textStyle14Two),
                      SizedBox(height: 10.h),
                      Text('42%', style: textStyle16Bold),
                      SizedBox(height: 20.h),
                      Text('Pressure', style: textStyle14Two),
                      SizedBox(height: 10.h),
                      Text('1009 hpa', style: textStyle16Bold),
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
  }
}