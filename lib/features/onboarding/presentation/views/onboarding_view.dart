import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController controller = PageController();
  int _currentPage = 0;

  final List<_OnboardingPageData> _pages = const [
    _OnboardingPageData(
      image: 'assets/images/on1.png',
      titlePart1: 'Life is short and the world is ',
      titleHighlight: 'wide',
      description:
          'At Friends tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world',
      highlightSvg: 'assets/svg/wide.svg',
    ),
    _OnboardingPageData(
      image: 'assets/images/on2.png',
      titlePart1: 'It’s a big world out there go ',
      titleHighlight: 'explore',

      description:
          'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
      highlightSvg: 'assets/svg/explore.svg',
    ),
    _OnboardingPageData(
      image: 'assets/images/on3.png',
      titlePart1: 'People don’t take trips, trips take ',
      titleHighlight: 'people',
      description:
          'To get the best of your adventure you just need to leave and go where you like. we are waiting for you',
      highlightSvg: 'assets/svg/people.svg',
    ),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _onGetStartedTap() {
    if (_currentPage < _pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      context.go('/navbar');
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return ScaffoldPlus(
      top: false,
      backgroundColor: const Color(0xffFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            width: double.infinity,
            child: PageView.builder(
              controller: controller,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) {
                final item = _pages[index];
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 4.h),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Column(
              children: [
                SizedBox(
                  height: 11.6.h,
                  child: Stack(
                    children: [
                      Center(
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: page.titlePart1,
                                style: TextStyle(
                                  color: const Color(0xFF1B1E28),
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                              TextSpan(
                                text: page.titleHighlight,
                                style: TextStyle(
                                  color: const Color(0xFFFF7029),
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w400,
                                  height: 1.20,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      if (page.highlightSvg != null)
                        Positioned(
                          bottom: 0,
                          right: 17.w,
                          child: SvgPicture.asset(
                            page.highlightSvg!,
                            width: 20.w,
                          ),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  page.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF7C838D),
                    fontSize: 16.sp,
                    fontFamily: 'Gill Sans MT',
                    fontWeight: FontWeight.w400,
                    height: 1.50,
                  ),
                ),
                SizedBox(height: 2.h),

                TravenorPageIndicator(
                  controller: controller,
                  count: _pages.length,
                ),
                SizedBox(height: 2.h),

                GestureDetector(
                  onTap: _onGetStartedTap,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    decoration: ShapeDecoration(
                      color: const Color(0xFF24BAEC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Get Started',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'SF UI Display',
                          fontWeight: FontWeight.w600,
                          height: 1.25,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPageData {
  final String image;
  final String titlePart1;
  final String titleHighlight;
  final String description;
  final String? highlightSvg;

  const _OnboardingPageData({
    required this.image,
    required this.titlePart1,
    required this.titleHighlight,
    required this.description,
    this.highlightSvg,
  });
}

// ТОЧНЫЙ индикатор как на твоей фотке
class TravenorPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const TravenorPageIndicator({
    super.key,
    required this.controller,
    this.count = 3,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final page = controller.hasClients
            ? (controller.page ?? controller.initialPage.toDouble())
            : 0.0;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(count, (index) {
            final distance = (page - index).abs();

            const double height = 10.0;
            const double bigWidth = 50.0;
            const double mediumWidth = 18.0;
            const double smallWidth = 10.0;

            final double width = distance < 0.5
                ? bigWidth
                : (distance < 1.5 ? mediumWidth : smallWidth);

            const activeColor = Color(0xFF5AB8E7);
            const inactiveColor = Color(0xFFD0E9FD);

            final color = distance < 0.5 ? activeColor : inactiveColor;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              margin: EdgeInsets.only(right: index == count - 1 ? 0 : 12),
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(height / 2),
              ),
            );
          }),
        );
      },
    );
  }
}
