import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app_youtube/features/home/presentation/widgets/widgets.dart';

class HomeViewBodyWidgets extends StatelessWidget {
  const HomeViewBodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WorldTextWidgets(),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Best Destination',
              style: TextStyle(
                color: const Color(0xFF1B1E28),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                height: 1.40,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: const Color(0xFFFF7029),
                  fontSize: 16.sp,
                  fontFamily: 'SF UI Display',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Container(
          width: 60.w,
          height: 40.h,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            shadows: [
              BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 16,
                offset: Offset(0, 6),
                spreadRadius: 0,
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 240,
                height: 286,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
