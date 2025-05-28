// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/routes/route_path.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../utils/text_style/text_style.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   final borderColor = Colors.grey.shade600;
//   final borderThickness = 2.0;

//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       context.pushNamed(
//         RoutePath.scannedItemsScreen,
//         extra: imageFile,
//       );
//     }
//   }

//   Future<void> _takePicture() async {
//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (capturedFile != null) {
//       final imageFile = File(capturedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       context.pushNamed(
//         RoutePath.scannedItemsScreen,
//         extra: imageFile,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Top Bar (like AppBar)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.scanner,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   Icon(Icons.more_horiz, color: Colors.grey),
//                 ],
//               ),
//             ),

//             // Expanded image + scanning UI area
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(24),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                         ),
//                         child: _pickedImage != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(0),
//                                 child: Image.file(
//                                   _pickedImage!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(), // show empty container instead of null
//                       ),

//                       // Corner borders
//                       Positioned(
//                         top: 24,
//                         left: 24,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 24,
//                         right: 24,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24,
//                         left: 24,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24,
//                         right: 24,
//                         child: Container(
//                           width: 40,
//                           height: 40,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Controls bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(width: 32),
//                   GestureDetector(
//                     onTap: () {
//                       _takePicture();
//                     },
//                     child: Container(
//                       width: 72,
//                       height: 72,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black54, width: 4),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 32),
//                   IconButton(
//                     icon: Icon(Icons.photo_library_outlined),
//                     onPressed: _pickImage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/routes/route_path.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../utils/text_style/text_style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   final borderColor = Colors.grey.shade600;
//   final borderThickness = 2.0;

//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(
//           RoutePath.scannedItemsScreen,
//           extra: imageFile,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   Future<void> _takePicture() async {
//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (capturedFile != null) {
//       final imageFile = File(capturedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(
//           RoutePath.scannedItemsScreen,
//           extra: imageFile,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Top Bar (like AppBar)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                       width: 24.w,
//                       height: 24.h,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.scanner,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   Icon(Icons.more_horiz, color: Colors.grey, size: 24.sp),
//                 ],
//               ),
//             ),

//             // Expanded image + scanning UI area
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(24.w),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                         ),
//                         child: _pickedImage != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(0.r),
//                                 child: Image.file(
//                                   _pickedImage!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(), // show empty container instead of null
//                       ),

//                       // Corner borders
//                       Positioned(
//                         top: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Controls bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(32.w),
//                   GestureDetector(
//                     onTap: () {
//                       _takePicture();
//                     },
//                     child: Container(
//                       width: 72.w,
//                       height: 72.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black54, width: 4.w),
//                       ),
//                     ),
//                   ),
//                   Gap(32.w),
//                   IconButton(
//                     icon: Icon(Icons.photo_library_outlined, size: 28.sp),
//                     onPressed: _pickImage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/routes/route_path.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../utils/text_style/text_style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   final borderColor = Colors.grey.shade600;
//   final borderThickness = 2.0;

//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<bool> _requestPermission(Permission permission) async {
//     final status = await permission.status;
//     if (status.isDenied || status.isRestricted) {
//       final result = await permission.request();
//       return result.isGranted;
//     }
//     return status.isGranted;
//   }

//   Future<void> _pickImage() async {
//     bool hasPermission = await _requestPermission(
//       Platform.isAndroid ? Permission.storage : Permission.photos,
//     );
//     if (!hasPermission) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('Storage permission is required to pick images')),
//       );
//       return;
//     }

//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(
//           RoutePath.scannedItemsScreen,
//           extra: imageFile,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   Future<void> _takePicture() async {
//     bool hasCamera = await _requestPermission(Permission.camera);
//     bool hasStorage = await _requestPermission(Permission.storage);
//     if (!hasCamera || !hasStorage) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Camera and storage permissions are required')),
//       );
//       return;
//     }

//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);
//     if (capturedFile != null) {
//       final imageFile = File(capturedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(
//           RoutePath.scannedItemsScreen,
//           extra: imageFile,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Top Bar (like AppBar)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                       width: 24.w,
//                       height: 24.h,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.scanner,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   Icon(Icons.more_horiz, color: Colors.grey, size: 24.sp),
//                 ],
//               ),
//             ),

//             // Expanded image + scanning UI area
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(24.w),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                         ),
//                         child: _pickedImage != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(0.r),
//                                 child: Image.file(
//                                   _pickedImage!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(),
//                       ),

//                       // Corner borders
//                       Positioned(
//                         top: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Controls bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(32.w),
//                   GestureDetector(
//                     onTap: _takePicture,
//                     child: Container(
//                       width: 72.w,
//                       height: 72.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black54, width: 4.w),
//                       ),
//                     ),
//                   ),
//                   Gap(32.w),
//                   IconButton(
//                     icon: Icon(Icons.photo_library_outlined, size: 28.sp),
//                     onPressed: _pickImage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/routes/route_path.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../utils/text_style/text_style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   final borderColor = Colors.grey.shade600;
//   final borderThickness = 2.0;

//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<bool> _requestPermission(Permission permission) async {
//     final status = await permission.status;
//     debugPrint('Permission status for $permission: $status');

//     if (status.isGranted) return true;

//     if (status.isDenied) {
//       final result = await permission.request();
//       debugPrint('Permission request result for $permission: $result');
//       return result.isGranted;
//     }

//     if (status.isPermanentlyDenied) {
//       // Permission permanently denied, open app settings
//       await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Permission Required'),
//           content: Text(
//               'Permission for $permission is permanently denied. Please enable it from app settings.'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 openAppSettings();
//                 Navigator.pop(context);
//               },
//               child: Text('Open Settings'),
//             ),
//           ],
//         ),
//       );
//       return false;
//     }

//     // Handle other statuses like restricted, limited if necessary
//     return false;
//   }

//   Future<void> _pickImage() async {
//     bool hasPermission = await _requestPermission(
//       Platform.isAndroid ? Permission.storage : Permission.photos,
//     );
//     if (!hasPermission) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('Storage permission is required to pick images')),
//       );
//       return;
//     }

//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(RoutePath.scannedItemsScreen, extra: imageFile);
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   Future<void> _takePicture() async {
//     bool hasCamera = await _requestPermission(Permission.camera);
//     bool hasStorage = await _requestPermission(Permission.storage);
//     if (!hasCamera || !hasStorage) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Camera and storage permissions are required')),
//       );
//       return;
//     }

//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);

//     if (capturedFile != null) {
//       final imageFile = File(capturedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(RoutePath.scannedItemsScreen, extra: imageFile);
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Top Bar (like AppBar)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                       width: 24.w,
//                       height: 24.h,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.scanner,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   Icon(Icons.more_horiz, color: Colors.grey, size: 24.sp),
//                 ],
//               ),
//             ),

//             // Expanded image + scanning UI area
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(24.w),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                         ),
//                         child: _pickedImage != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(0.r),
//                                 child: Image.file(
//                                   _pickedImage!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(),
//                       ),

//                       // Corner borders
//                       Positioned(
//                         top: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Controls bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(32.w),
//                   GestureDetector(
//                     onTap: _takePicture,
//                     child: Container(
//                       width: 72.w,
//                       height: 72.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black54, width: 4.w),
//                       ),
//                     ),
//                   ),
//                   Gap(32.w),
//                   IconButton(
//                     icon: Icon(Icons.photo_library_outlined, size: 28.sp),
//                     onPressed: _pickImage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:groc_shopy/core/routes/route_path.dart';
// import 'package:groc_shopy/helper/extension/base_extension.dart';
// import 'package:groc_shopy/utils/app_colors/app_colors.dart';
// import 'package:groc_shopy/utils/static_strings/static_strings.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../core/custom_assets/assets.gen.dart';
// import '../../../utils/text_style/text_style.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   final borderColor = Colors.grey.shade600;
//   final borderThickness = 2.0;

//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<bool> requestPermission(Permission permission) async {
//     var status = await permission.status;
//     debugPrint('Permission $permission initial status: $status');

//     if (status.isGranted) return true;

//     if (status.isDenied) {
//       var result = await permission.request();
//       debugPrint('Permission $permission requested result: $result');

//       var newStatus = await permission.status;
//       debugPrint('Permission $permission new status after request: $newStatus');
//       return newStatus.isGranted;
//     }

//     if (status.isPermanentlyDenied) {
//       await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Permission Required'),
//           content: Text(
//             'Permission for $permission is permanently denied. Please enable it from app settings.',
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 openAppSettings();
//                 Navigator.pop(context);
//               },
//               child: Text('Open Settings'),
//             ),
//           ],
//         ),
//       );
//       return false;
//     }

//     // Handle restricted, limited, or other statuses here if needed
//     return false;
//   }

//   Future<void> _pickImage() async {
//     bool hasPermission = await requestPermission(
//       Platform.isAndroid ? Permission.storage : Permission.photos,
//     );

//     if (!hasPermission) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//             content: Text('Storage permission is required to pick images')),
//       );
//       return;
//     }

//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       final imageFile = File(pickedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(RoutePath.scannedItemsScreen, extra: imageFile);
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   Future<void> _takePicture() async {
//     bool hasCamera = await requestPermission(Permission.camera);
//     bool hasStorage = await requestPermission(Permission.storage);

//     if (!hasCamera || !hasStorage) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Camera and storage permissions are required')),
//       );
//       return;
//     }

//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);

//     if (capturedFile != null) {
//       final imageFile = File(capturedFile.path);
//       setState(() {
//         _pickedImage = imageFile;
//       });

//       try {
//         context.pushNamed(RoutePath.scannedItemsScreen, extra: imageFile);
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom Top Bar (like AppBar)
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: Image.asset(
//                       Assets.icons.arrowBackGrey.path,
//                       width: 24.w,
//                       height: 24.h,
//                     ),
//                   ),
//                   Text(
//                     AppStrings.scanner,
//                     style: AppStyle.kohSantepheap16w700C3F3F3F,
//                   ),
//                   Icon(Icons.more_horiz, color: Colors.grey, size: 24.sp),
//                 ],
//               ),
//             ),

//             // Expanded image + scanning UI area
//             Expanded(
//               child: Center(
//                 child: AspectRatio(
//                   aspectRatio: 1,
//                   child: Stack(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(24.w),
//                         decoration: BoxDecoration(
//                           color: AppColors.backgroundColor,
//                         ),
//                         child: _pickedImage != null
//                             ? ClipRRect(
//                                 borderRadius: BorderRadius.circular(0.r),
//                                 child: Image.file(
//                                   _pickedImage!,
//                                   fit: BoxFit.cover,
//                                   width: double.infinity,
//                                   height: double.infinity,
//                                 ),
//                               )
//                             : Container(),
//                       ),

//                       // Corner borders
//                       Positioned(
//                         top: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         left: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               left: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: 24.h,
//                         right: 24.w,
//                         child: Container(
//                           width: 40.w,
//                           height: 40.h,
//                           decoration: BoxDecoration(
//                             border: Border(
//                               bottom: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                               right: BorderSide(
//                                   color: borderColor, width: borderThickness.w),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),

//             // Bottom Controls bar
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
//               color: AppColors.backgroundColor,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Gap(32.w),
//                   GestureDetector(
//                     onTap: _takePicture,
//                     child: Container(
//                       width: 72.w,
//                       height: 72.h,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color: Colors.black54, width: 4.w),
//                       ),
//                     ),
//                   ),
//                   Gap(32.w),
//                   IconButton(
//                     icon: Icon(Icons.photo_library_outlined, size: 28.sp),
//                     onPressed: _pickImage,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:permission_handler/permission_handler.dart';

// class ScanScreen extends StatefulWidget {
//   @override
//   State<ScanScreen> createState() => _ScanScreenState();
// }

// class _ScanScreenState extends State<ScanScreen> {
//   File? _pickedImage;
//   final ImagePicker _picker = ImagePicker();

//   Future<bool> _requestPermission(Permission permission) async {
//     final status = await permission.status;

//     if (status.isGranted) return true;

//     if (status.isDenied) {
//       final result = await permission.request();
//       return result.isGranted;
//     }

//     if (status.isPermanentlyDenied) {
//       await showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: const Text('Permission Required'),
//           content: const Text(
//               'Permission is permanently denied. Please enable it from app settings.'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 openAppSettings();
//                 Navigator.pop(context);
//               },
//               child: const Text('Open Settings'),
//             ),
//           ],
//         ),
//       );
//       return false;
//     }

//     return false;
//   }

//   Future<void> _pickImageFromGallery() async {
//     // Android 13+ uses photos permission instead of storage
//     final hasPermission = await _requestPermission(
//       Platform.isAndroid &&
//               (await Permission.photos.isRestricted ||
//                   await Permission.photos.isDenied)
//           ? Permission.photos
//           : Permission.storage,
//     );

//     if (!hasPermission) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Storage permission is required to pick images')),
//       );
//       return;
//     }

//     final XFile? pickedFile =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() => _pickedImage = File(pickedFile.path));
//       try {
//         context.pushNamed(
//           'scannedItemsScreen',
//           extra: _pickedImage,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   Future<void> _takePicture() async {
//     final hasCamera = await _requestPermission(Permission.camera);

//     if (!hasCamera) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Camera permission is required')),
//       );
//       return;
//     }

//     // For camera, no need storage permission usually
//     final XFile? capturedFile =
//         await _picker.pickImage(source: ImageSource.camera);

//     if (capturedFile != null) {
//       setState(() => _pickedImage = File(capturedFile.path));
//       try {
//         context.pushNamed(
//           'scannedItemsScreen',
//           extra: _pickedImage,
//         );
//       } catch (e) {
//         debugPrint('Navigation error: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Scan Screen')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (_pickedImage != null)
//               Image.file(_pickedImage!,
//                   width: 200, height: 200, fit: BoxFit.cover),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _takePicture,
//               child: const Text('Take Picture'),
//             ),
//             ElevatedButton(
//               onPressed: _pickImageFromGallery,
//               child: const Text('Pick From Gallery'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/custom_assets/assets.gen.dart';
import '../../../core/routes/route_path.dart';
import '../../../utils/app_colors/app_colors.dart';
import '../../../utils/static_strings/static_strings.dart';
import '../../../utils/text_style/text_style.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final borderColor = Colors.grey.shade600;
  final borderThickness = 2.0;

  File? _pickedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imageFile = File(pickedFile.path);
      setState(() {
        _pickedImage = imageFile;
      });

      context.pushNamed(
        RoutePath.scannedItemsScreen,
        extra: imageFile,
      );
    }
  }

  Future<void> _takePicture() async {
    final XFile? capturedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (capturedFile != null) {
      final imageFile = File(capturedFile.path);
      setState(() {
        _pickedImage = imageFile;
      });

      context.pushNamed(
        RoutePath.scannedItemsScreen,
        extra: imageFile,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Custom Top Bar (like AppBar)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.pop();
                    },
                    child: Image.asset(
                      Assets.icons.arrowBackGrey.path,
                    ),
                  ),
                  Text(
                    AppStrings.scanner,
                    style: AppStyle.kohSantepheap16w700C3F3F3F,
                  ),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
            ),

            // Expanded image + scanning UI area
            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: AppColors.backgroundColor,
                        ),
                        child: _pickedImage != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.file(
                                  _pickedImage!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              )
                            : Container(), // empty container if no image
                      ),

                      // Corner borders
                      Positioned(
                        top: 24,
                        left: 24,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: borderColor, width: borderThickness),
                              left: BorderSide(
                                  color: borderColor, width: borderThickness),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 24,
                        right: 24,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: borderColor, width: borderThickness),
                              right: BorderSide(
                                  color: borderColor, width: borderThickness),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        left: 24,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: borderColor, width: borderThickness),
                              left: BorderSide(
                                  color: borderColor, width: borderThickness),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 24,
                        right: 24,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: borderColor, width: borderThickness),
                              right: BorderSide(
                                  color: borderColor, width: borderThickness),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Controls bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 32),
                  GestureDetector(
                    onTap: _takePicture,
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black54, width: 4),
                      ),
                    ),
                  ),
                  const SizedBox(width: 32),
                  IconButton(
                    icon: const Icon(Icons.photo_library_outlined),
                    onPressed: _pickImage,
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
