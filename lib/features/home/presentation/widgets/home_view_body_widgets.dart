import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:travel_app_youtube/features/home/presentation/widgets/widgets.dart';

class HomeViewBodyWidgets extends StatelessWidget {
  const HomeViewBodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 6.w),
          child: Column(
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
                    onPressed: () {
                      context.push('/view');
                    },
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
          ),
        ),
        SizedBox(height: 1.h),
        SizedBox(
          height: 50.h,
          width: double.infinity,
          child: ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => SizedBox(width: 4.w),
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            padding: EdgeInsetsGeometry.symmetric(horizontal: 6.w),
            itemBuilder: (context, index) {
              return DestinationContainerWidget();
            },
          ),
        ),
      ],
    );
  }
}
