import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DestinationContainerWidget extends StatefulWidget {
  final String assets;
  final String title;
  final String locations;

  const DestinationContainerWidget({
    super.key,
    required this.assets,
    required this.title,
    required this.locations,
  });

  @override
  State<DestinationContainerWidget> createState() =>
      _DestinationContainerWidgetState();
}

class _DestinationContainerWidgetState
    extends State<DestinationContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 77.w,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        shadows: [
          BoxShadow(
            color: Color(0x1EB3BCC8),
            blurRadius: 16,
            offset: Offset(0, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          context.push('/details');
        },
        child: Column(
          children: [
            Container(
              width: 31.h,
              height: 37.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                image: DecorationImage(
                  image: AssetImage(widget.assets),
                  fit: BoxFit.fill,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              child: Align(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                  maxRadius: 17.sp,
                  backgroundColor: const Color.fromARGB(114, 158, 158, 158),
                  child: Icon(Icons.bookmark_outline, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 1.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          color: const Color(0xFF1B1E28),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          height: 1.33,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svg/star.svg', width: 16.sp),
                          Text(
                            '4.7',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: const Color(0xFF1B1E28),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/locations.svg',
                        width: 15.sp,
                      ),
                      SizedBox(width: 1.w),
                      Text(
                        widget.locations,
                        style: TextStyle(
                          color: const Color(0xFF7C838D),
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.30,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Image.asset('assets/images/avatar.png', width: 20.w),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
