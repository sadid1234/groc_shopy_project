// import 'package:flutter/material.dart';

// class SliderButton extends StatefulWidget {
//   final VoidCallback onSlideCompleted;
//   final String text;
//   final double height;
//   final double width;

//   const SliderButton({
//     Key? key,
//     required this.onSlideCompleted,
//     this.text = 'Slide to confirm',
//     this.height = 60,
//     this.width = 300,
//   }) : super(key: key);

//   @override
//   _SliderButtonState createState() => _SliderButtonState();
// }

// class _SliderButtonState extends State<SliderButton> {
//   double _position = 0;
//   double _maxPosition = 0;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         _maxPosition = widget.width - widget.height;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         color: Colors.grey[300],
//         borderRadius: BorderRadius.circular(widget.height / 2),
//       ),
//       child: Stack(
//         children: [
//           Center(
//             child: Text(
//               widget.text,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 100),
//             curve: Curves.easeOut,
//             left: _position,
//             top: 0,
//             child: GestureDetector(
//               onHorizontalDragUpdate: (details) {
//                 setState(() {
//                   _position += details.delta.dx;
//                   if (_position < 0) _position = 0;
//                   if (_position > _maxPosition) _position = _maxPosition;
//                 });
//               },
//               onHorizontalDragEnd: (details) {
//                 if (_position == _maxPosition) {
//                   widget.onSlideCompleted();
//                 } else {
//                   setState(() {
//                     _position = 0;
//                   });
//                 }
//               },
//               child: Container(
//                 width: widget.height,
//                 height: widget.height,
//                 decoration: BoxDecoration(
//                   color: Colors.blue,
//                   borderRadius: BorderRadius.circular(widget.height / 2),
//                 ),
//                 child: const Icon(
//                   Icons.arrow_forward,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SliderButton extends StatefulWidget {
//   final VoidCallback onSlideCompleted;
//   final String initialText;
//   final String completedText;
//   final IconData initialIcon;
//   final IconData completedIcon;
//   final double height;
//   final double width;
//   final Color activeColor;
//   final Color inactiveColor;
//   final Color buttonColor;

//   const SliderButton({
//     Key? key,
//     required this.onSlideCompleted,
//     this.initialText = 'Slide to confirm',
//     this.completedText = 'Completed!',
//     this.initialIcon = Icons.arrow_forward,
//     this.completedIcon = Icons.check,
//     this.height = 60,
//     this.width = 300,
//     this.activeColor = Colors.blue,
//     this.inactiveColor = Colors.grey,
//     this.buttonColor = Colors.white,
//   }) : super(key: key);

//   @override
//   _SliderButtonState createState() => _SliderButtonState();
// }

// class _SliderButtonState extends State<SliderButton> {
//   double _position = 0;
//   double _maxPosition = 0;
//   bool _isCompleted = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         _maxPosition = widget.width - widget.height;
//       });
//     });
//   }

//   void _resetSlider() {
//     setState(() {
//       _position = 0;
//       _isCompleted = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//         color: _isCompleted ? widget.activeColor : widget.inactiveColor,
//         borderRadius: BorderRadius.circular(widget.height / 2),
//       ),
//       child: Stack(
//         children: [
//           Center(
//             child: AnimatedDefaultTextStyle(
//               duration: const Duration(milliseconds: 200),
//               style: TextStyle(
//                 color: _isCompleted ? widget.buttonColor : Colors.grey[600],
//                 fontSize: 16,
//                 fontWeight: _isCompleted ? FontWeight.bold : FontWeight.normal,
//               ),
//               child: Text(
//                 _isCompleted ? widget.completedText : widget.initialText,
//               ),
//             ),
//           ),
//           AnimatedPositioned(
//             duration: const Duration(milliseconds: 100),
//             curve: Curves.easeOut,
//             left: _position,
//             top: 0,
//             child: GestureDetector(
//               onHorizontalDragUpdate: (details) {
//                 if (!_isCompleted) {
//                   setState(() {
//                     _position += details.delta.dx;
//                     if (_position < 0) _position = 0;
//                     if (_position > _maxPosition) _position = _maxPosition;
//                   });
//                 }
//               },
//               onHorizontalDragEnd: (details) {
//                 if (!_isCompleted) {
//                   if (_position == _maxPosition) {
//                     setState(() {
//                       _isCompleted = true;
//                     });
//                     widget.onSlideCompleted();
//                   } else {
//                     setState(() {
//                       _position = 0;
//                     });
//                   }
//                 }
//               },
//               onTap: _isCompleted ? _resetSlider : null,
//               child: Container(
//                 width: widget.height,
//                 height: widget.height,
//                 decoration: BoxDecoration(
//                   color: _isCompleted ? widget.buttonColor : widget.activeColor,
//                   borderRadius: BorderRadius.circular(widget.height / 2),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 5,
//                       spreadRadius: 1,
//                       offset: const Offset(0, 2),
//                     )
//                   ],
//                 ),
//                 child: AnimatedSwitcher(
//                   duration: const Duration(milliseconds: 200),
//                   child: Icon(
//                     _isCompleted ? widget.completedIcon : widget.initialIcon,
//                     color:
//                         _isCompleted ? widget.activeColor : widget.buttonColor,
//                     size: 24,
//                     key: ValueKey<bool>(_isCompleted),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groc_shopy/utils/static_strings/static_strings.dart';

class SliderButton extends StatefulWidget {
  final VoidCallback onSlideCompleted;
  final String initialText;
  final String completedText;
  final String? initialIconPath; // SVG asset path for initial state
  final String? completedIconPath; // SVG asset path for completed state
  final IconData? initialIcon; // Fallback Material icon
  final IconData? completedIcon; // Fallback Material icon
  final double height;
  final double width;
  final Color activeColor;
  final Color inactiveColor;
  final Color buttonColor;
  final double iconSize;

  const SliderButton({
    Key? key,
    required this.onSlideCompleted,
    this.initialText = AppStrings.getStarted,
    this.completedText = AppStrings.coooooool,
    this.initialIconPath,
    this.completedIconPath,
    this.initialIcon = Icons.arrow_forward,
    this.completedIcon = Icons.check,
    this.height = 60,
    this.width = 300,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.buttonColor = Colors.white,
    this.iconSize = 24,
  }) : super(key: key);

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _position = 0;
  double _maxPosition = 0;
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _maxPosition = widget.width - widget.height;
      });
    });
  }

  void _resetSlider() {
    setState(() {
      _position = 0;
      _isCompleted = false;
    });
  }

  Widget _buildIcon() {
    final color = _isCompleted ? Colors.black : widget.buttonColor;
    final size = widget.iconSize;

    if (_isCompleted) {
      return widget.completedIconPath != null
          ? SvgPicture.asset(
              widget.completedIconPath!,
              color: color,
              width: size,
              height: size,
            )
          : Icon(
              widget.completedIcon,
              color: color,
              size: size,
            );
    } else {
      return widget.initialIconPath != null
          ? SvgPicture.asset(
              widget.initialIconPath!,
              color: color,
              width: size,
              height: size,
            )
          : Icon(
              widget.initialIcon,
              color: color,
              size: size,
            );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isCompleted ? widget.activeColor : widget.inactiveColor,
        borderRadius: BorderRadius.circular(widget.height / 2),
      ),
      child: Stack(
        children: [
          Center(
            child: AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                color: _isCompleted ? Colors.white : Colors.black,
              ),
              child: Text(
                _isCompleted ? widget.completedText : widget.initialText,
                style: GoogleFonts.robotoSerif(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOut,
            left: _position,
            top: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (!_isCompleted) {
                  setState(() {
                    _position += details.delta.dx;
                    if (_position < 0) _position = 0;
                    if (_position > _maxPosition) _position = _maxPosition;
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                if (!_isCompleted) {
                  if (_position == _maxPosition) {
                    setState(() {
                      _isCompleted = true;
                    });
                    widget.onSlideCompleted();
                  } else {
                    setState(() {
                      _position = 0;
                    });
                  }
                }
              },
              onTap: _isCompleted ? _resetSlider : null,
              child: Container(
                width: widget.height,
                height: widget.height,
                decoration: BoxDecoration(
                  color: _isCompleted ? widget.buttonColor : widget.activeColor,
                  borderRadius: BorderRadius.circular(widget.height / 2),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  child: _buildIcon(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
