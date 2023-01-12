import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.center,
                    child: Text('Selected location', style: textStyle16Bold)),
                SizedBox(height: 10.h),
                Align(
                    alignment: Alignment.center,
                    child: Text('Addis Ababa', style: textStyle26Bold)),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  child:
                      Divider(height: 1.h, color: Colors.white, thickness: 1),
                ),
                Padding(
                  padding: EdgeInsets.all(15.r),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.r),
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 5.h,
                                  margin: EdgeInsets.only(top: 15.h, bottom: 25.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40.r),
                                  ),
                                ),
                                for(var i in locations)...[
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 5.h),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(i.city, style: textStyle16Bold),
                                          subtitle: Text(i.country, style: textStyle14,),
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        Divider(height: 1.h, color: Colors.white)
                                      ],
                                    ),
                                  )
                                ]
                              ],
                            ),
                          );
                        },
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      primary: Colors.black,
                      padding: EdgeInsets.all(15.r),
                    ),
                    child: Text(
                      'Change Location',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(5.r),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
