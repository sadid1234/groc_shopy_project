// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../core/custom_assets/assets.gen.dart';

// class CustomBottomNavBar extends StatefulWidget {
//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int selectedIndex = 0;
//   final List<String> icons = [
//     Assets.icons.home.path,
//     Assets.icons.scan.path,
//     Assets.icons.transaction.path,
//     Assets.icons.profile.path,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70, // Replace 62.h if you use ScreenUtil
//       decoration: BoxDecoration(
//         color: Color(0xFF282F291A).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(icons.length, (index) {
//           bool isSelected = selectedIndex == index;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: AnimatedContainer(
//               padding: EdgeInsets.all(0),
//               duration: Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               width: isSelected ? 150 : 65, // expanded width for selected
//               height: 65,
//               decoration: BoxDecoration(
//                 color: isSelected ? Color(0xFFFFD54F) : Color(0xFFC4C4C4),
//                 borderRadius: BorderRadius.circular(isSelected ? 25 : 50),
//               ),
//               alignment: Alignment.center,
//               child: SvgPicture.asset(
//                 icons[index],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';

// import '../../../core/custom_assets/assets.gen.dart';

// import '../../../core/routes/route_path.dart'; // Make sure this is your route path file

// class CustomBottomNavBar extends StatefulWidget {
//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }

// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//   int selectedIndex = 0;

//   final List<String> icons = [
//     Assets.icons.home.path,
//     Assets.icons.scan.path,
//     Assets.icons.transaction.path,
//     Assets.icons.profile.path,
//   ];

//   final List<String> routes = [
//     RoutePath.home.addBasePath,
//     RoutePath.scan.addBasePath,
//     RoutePath.transactionHistory.addBasePath,
//     RoutePath.profile.addBasePath,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 70,
//       decoration: BoxDecoration(
//         color: const Color(0xFF282F291A).withOpacity(0.1),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: List.generate(icons.length, (index) {
//           bool isSelected = selectedIndex == index;

//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });

//               /// Navigate using GoRouter
//               context.goNamed(_getRouteNameByIndex(index));
//             },
//             child: AnimatedContainer(
//               padding: EdgeInsets.zero,
//               duration: const Duration(milliseconds: 300),
//               curve: Curves.easeInOut,
//               width: isSelected ? 150 : 65,
//               height: 65,
//               decoration: BoxDecoration(
//                 color: isSelected
//                     ? const Color(0xFFFFD54F)
//                     : const Color(0xFFC4C4C4),
//                 borderRadius: BorderRadius.circular(isSelected ? 25 : 50),
//               ),
//               alignment: Alignment.center,
//               child: SvgPicture.asset(
//                 icons[index],
//               ),
//             ),
//           );
//         }),
//       ),
//     );
//   }

//   /// Maps index to route name
//   String _getRouteNameByIndex(int index) {
//     switch (index) {
//       case 0:
//         return RoutePath.home;
//       case 1:
//         return RoutePath.scan;
//       case 2:
//         return RoutePath.transactionHistory;
//       case 3:
//         return RoutePath.profile;
//       default:
//         return RoutePath.home;
//     }
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/custom_assets/assets.gen.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  CustomBottomNavBar({
    required this.selectedIndex,
    required this.onTap,
  });

  final List<String> icons = [
    Assets.icons.home.path,
    Assets.icons.scan.path,
    Assets.icons.transaction.path,
    Assets.icons.profile.path,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF282F291A).withOpacity(0.1),
        borderRadius: BorderRadius.circular(50),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(icons.length, (index) {
          bool isSelected = selectedIndex == index;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              padding: EdgeInsets.zero,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: isSelected ? 150 : 65,
              height: 65,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFFFFD54F)
                    : const Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(isSelected ? 25 : 50),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                icons[index],
              ),
            ),
          );
        }),
      ),
    );
  }
}
