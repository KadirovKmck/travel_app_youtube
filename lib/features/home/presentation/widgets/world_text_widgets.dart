import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WorldTextWidgets extends StatelessWidget {
  const WorldTextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 13.3.h,
      child: Stack(
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Explore the   ',
                  style: TextStyle(
                    color: const Color(0xFF2D323D),
                    fontSize: 27.sp,
                    fontWeight: FontWeight.w300,
                    height: 1.4,
                  ),
                ),
                TextSpan(
                  text: 'Beautiful ',
                  style: TextStyle(
                    color: const Color(0xFF1B1E28),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
                TextSpan(
                  text: 'world!',
                  style: TextStyle(
                    color: const Color(0xFFFF7029),
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 10.w,
            child: SvgPicture.asset("assets/svg/explore.svg", width: 32.w),
          ),
        ],
      ),
    );
  }
}
