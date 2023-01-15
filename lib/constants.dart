import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/models/location_model.dart';

var textStyle16 = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
);

var textStyle16Two = TextStyle(
    fontSize: 16.sp,
    fontFamily: 'Questrial',
    color: Colors.grey[300],
    fontWeight: FontWeight.bold);

var textStyle16Bold = TextStyle(
  fontSize: 16.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var textStyle14 = TextStyle(
  fontSize: 14.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
);

var textStyle14Two = TextStyle(
  fontSize: 14.sp,
  fontFamily: 'Questrial',
  color: Colors.grey[300],
);

var textStyle18 = TextStyle(
  fontSize: 18.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
);

var textStyle20 = TextStyle(
  fontSize: 20.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
);

var textStyle20Bold = TextStyle(
  fontSize: 20.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var textStyle26Bold = TextStyle(
  fontSize: 26.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var textStyleBigTwo = TextStyle(
  fontSize: 72.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

var textStyleBig = TextStyle(
  fontSize: 92.sp,
  fontFamily: 'Questrial',
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

List<LocationModel> locations = [
  LocationModel(
    city: 'Addis Ababa',
    country: 'Ethiopia',
    lat: 8.980603,
    long: 38.757759,
  ),
  LocationModel(
    city: 'Dubai',
    country: 'UAE',
    lat: 25.204849,
    long: 55.270782,
  ),
  LocationModel(
    city: 'Ottawa',
    country: 'Canada',
    lat: 45.421532,
    long: -75.697189,
  ),
  LocationModel(
    city: 'London',
    country: 'UK',
    lat: 51.507351,
    long: -0.127758,
  ),
  LocationModel(
    city: 'San Francisco',
    country: 'USA',
    lat: 37.7,
    long: 122.4,
  ),
];

List customColors = [
  [
    const Color(0xffE3B447),
    const Color(0xffDE7C2F),
    const Color(0xffE3B447).withOpacity(0.5),
  ],
  [
    const Color(0xff009FFD),
    const Color(0xFF2529B1),
    const Color(0xff009FFD).withOpacity(0.3),
  ],
  [
    const Color(0xffB5C0CF),
    const Color(0xff515672),
    const Color(0xffB5C0CF).withOpacity(0.5),
  ],
];
