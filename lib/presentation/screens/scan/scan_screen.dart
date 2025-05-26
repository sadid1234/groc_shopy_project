import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:groc_shopy/core/routes/route_path.dart';
import 'package:groc_shopy/helper/extension/base_extension.dart';
import 'package:groc_shopy/utils/app_colors/app_colors.dart';
import 'package:image_picker/image_picker.dart';

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
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: Icon(Icons.arrow_back_ios, color: Colors.grey),
                  ),
                  Text(
                    'Scanner',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'Georgia',
                    ),
                  ),
                  Icon(Icons.more_horiz, color: Colors.grey),
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
                        margin: EdgeInsets.all(24),
                        decoration: BoxDecoration(
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
                            : Container(), // show empty container instead of null
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
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              color: AppColors.backgroundColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 32),
                  GestureDetector(
                    onTap: () {
                      _takePicture();
                    },
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black54, width: 4),
                      ),
                    ),
                  ),
                  SizedBox(width: 32),
                  IconButton(
                    icon: Icon(Icons.photo_library_outlined),
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
