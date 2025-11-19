import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeViewAppBarWidgets extends StatelessWidget {
  const HomeViewAppBarWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Color(0xFFFF7029)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 1.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 36.w,
            height: 7.h,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),

            child: Row(
              children: [
                CircleAvatar(
                  foregroundImage: AssetImage('assets/images/person.png'),
                  backgroundColor: Color(0xffFFEADF),
                  maxRadius: 20.sp,
                ),
                SizedBox(width: 2.w),
                Text(
                  'Leonardo',
                  style: TextStyle(
                    color: const Color(0xFF1B1E28),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 10.w,
            height: 7.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFFFF7029)),
            ),
            padding: EdgeInsets.all(10.sp),
            child: SvgPicture.asset('assets/svg/Notifications.svg'),
          ),
        ],
      ),
    );
  }
}
