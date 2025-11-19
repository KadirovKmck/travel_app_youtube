import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

import '../widgets/home_view_appbar_widgets.dart';

class HomeMain extends StatefulWidget {
  const HomeMain({super.key});

  @override
  State<HomeMain> createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPlus(
      horizontal: 6.w,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          HomeViewAppBarWidgets(),
          SizedBox(height: 3.h),
          HomeViewBodyWidgets(),
        ],
      ),
    );
  }
}

class HomeViewBodyWidgets extends StatelessWidget {
  const HomeViewBodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
      ],
    );
  }
}

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
            right: 7.w,
            child: SvgPicture.asset("assets/svg/explore.svg", width: 32.w),
          ),
        ],
      ),
    );
  }
}
