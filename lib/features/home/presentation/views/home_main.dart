import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scaffold_plus/scaffold_plus.dart';

import '../widgets/widgets.dart';

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
