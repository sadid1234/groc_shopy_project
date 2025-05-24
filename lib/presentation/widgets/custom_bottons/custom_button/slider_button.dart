// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SliderButton extends StatefulWidget {
//   final VoidCallback onSlideCompleted;
//   final String initialText;
//   final String completedText;
//   final String? initialIconPath;
//   final String? completedIconPath;
//   final IconData? initialIcon;
//   final IconData? completedIcon;
//   final double height;
//   final double width;
//   final Color activeColor;
//   final Color inactiveColor;
//   final Color buttonColor;
//   final double iconSize;
//   final Duration animationDuration;
//   final bool resetAfterCompletion;
//   final double borderRadius;

//   const SliderButton({
//     Key? key,
//     required this.onSlideCompleted,
//     this.initialText = 'Slide to confirm',
//     this.completedText = 'Completed!',
//     this.initialIconPath,
//     this.completedIconPath,
//     this.initialIcon = Icons.arrow_forward,
//     this.completedIcon = Icons.check,
//     this.height = 60,
//     this.width = 300,
//     this.activeColor = Colors.blue,
//     this.inactiveColor = Colors.grey,
//     this.buttonColor = Colors.white,
//     this.iconSize = 24,
//     this.animationDuration = const Duration(milliseconds: 200),
//     this.resetAfterCompletion = false,
//     this.borderRadius = 30,
//   }) : super(key: key);

//   @override
//   _SliderButtonState createState() => _SliderButtonState();
// }

// class _SliderButtonState extends State<SliderButton> {
//   double _position = 0;
//   double _maxPosition = 0;
//   bool _isCompleted = false;
//   bool _isDragging = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculateMaxPosition();
//     });
//   }

//   void _calculateMaxPosition() {
//     final containerWidth = widget.width == double.infinity
//         ? (context.findRenderObject() as RenderBox?)?.size.width ?? 300
//         : widget.width;

//     setState(() {
//       _maxPosition = containerWidth - widget.height;
//     });
//   }

//   void _resetSlider() {
//     setState(() {
//       _position = 0;
//       _isCompleted = false;
//     });
//   }

//   void _completeSlide() {
//     setState(() {
//       _isCompleted = true;
//     });
//     widget.onSlideCompleted();

//     if (widget.resetAfterCompletion) {
//       Future.delayed(widget.animationDuration * 2, _resetSlider);
//     }
//   }

//   Widget _buildIcon() {
//     final color = _isCompleted ? widget.activeColor : widget.buttonColor;
//     final size = widget.iconSize;

//     if (_isCompleted) {
//       return widget.completedIconPath != null
//           ? SvgPicture.asset(
//               widget.completedIconPath!,
//               color: color,
//               width: size,
//               height: size,
//               fit: BoxFit.contain,
//             )
//           : Icon(
//               widget.completedIcon,
//               color: color,
//               size: size,
//             );
//     } else {
//       return widget.initialIconPath != null
//           ? SvgPicture.asset(
//               widget.initialIconPath!,
//               color: color,
//               width: size,
//               height: size,
//               fit: BoxFit.contain,
//             )
//           : Icon(
//               widget.initialIcon,
//               color: color,
//               size: size,
//             );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final effectiveWidth = widget.width == double.infinity
//             ? constraints.maxWidth
//             : widget.width;

//         return Container(
//           width: effectiveWidth,
//           height: widget.height,
//           decoration: BoxDecoration(
//             color: _isCompleted ? widget.activeColor : widget.inactiveColor,
//             borderRadius: BorderRadius.circular(widget.borderRadius),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 spreadRadius: 1,
//                 offset: const Offset(0, 2),
//               )
//             ],
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Center(
//                 child: AnimatedOpacity(
//                   duration: widget.animationDuration,
//                   opacity: _isDragging ? 0.7 : 1.0,
//                   child: AnimatedDefaultTextStyle(
//                     duration: widget.animationDuration,
//                     style: TextStyle(
//                       color:
//                           _isCompleted ? widget.buttonColor : Colors.grey[600],
//                       fontSize: 16,
//                       fontWeight:
//                           _isCompleted ? FontWeight.bold : FontWeight.normal,
//                     ),
//                     child: Text(
//                       _isCompleted ? widget.completedText : widget.initialText,
//                     ),
//                   ),
//                 ),
//               ),
//               AnimatedPositioned(
//                 duration: widget.animationDuration,
//                 curve: Curves.easeOut,
//                 left: _position.clamp(0.0, _maxPosition),
//                 top: 0,
//                 child: GestureDetector(
//                   onHorizontalDragStart: (_) {
//                     setState(() => _isDragging = true);
//                   },
//                   onHorizontalDragUpdate: (details) {
//                     if (!_isCompleted) {
//                       setState(() {
//                         _position += details.delta.dx;
//                         _position = _position.clamp(0.0, _maxPosition);
//                       });
//                     }
//                   },
//                   onHorizontalDragEnd: (details) {
//                     setState(() => _isDragging = false);
//                     if (!_isCompleted) {
//                       if (_position == _maxPosition) {
//                         _completeSlide();
//                       } else {
//                         setState(() {
//                           _position = 0;
//                         });
//                       }
//                     }
//                   },
//                   onHorizontalDragCancel: () {
//                     setState(() => _isDragging = false);
//                     if (!_isCompleted) {
//                       setState(() => _position = 0);
//                     }
//                   },
//                   onTap: _isCompleted ? _resetSlider : null,
//                   child: Container(
//                     width: widget.height,
//                     height: widget.height,
//                     decoration: BoxDecoration(
//                       color: _isCompleted
//                           ? widget.buttonColor
//                           : widget.activeColor,
//                       borderRadius: BorderRadius.circular(widget.borderRadius),
//                       boxShadow: [
//                         BoxShadow(
//                           color:
//                               Colors.black.withOpacity(_isDragging ? 0.3 : 0.2),
//                           blurRadius: _isDragging ? 8 : 5,
//                           spreadRadius: 1,
//                           offset: const Offset(0, 2),
//                         )
//                       ],
//                     ),
//                     child: Center(
//                       child: AnimatedSwitcher(
//                         duration: widget.animationDuration,
//                         child: _buildIcon(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SliderButton extends StatefulWidget {
//   final VoidCallback onSlideCompleted;
//   final String initialText;
//   final String completedText;
//   final String? initialIconPath;
//   final String? completedIconPath;
//   final IconData? initialIcon;
//   final IconData? completedIcon;
//   final double height;
//   final double width;
//   final Color activeColor;
//   final Color inactiveColor;
//   final Color buttonColor;
//   final double iconSize;
//   final Duration animationDuration;
//   final bool resetAfterCompletion;
//   final double borderRadius;
//   final double padding; // New padding parameter

//   const SliderButton({
//     Key? key,
//     required this.onSlideCompleted,
//     this.initialText = 'Slide to confirm',
//     this.completedText = 'Completed!',
//     this.initialIconPath,
//     this.completedIconPath,
//     this.initialIcon = Icons.arrow_forward,
//     this.completedIcon = Icons.check,
//     this.height = 60,
//     this.width = 300,
//     this.activeColor = Colors.blue,
//     this.inactiveColor = Colors.grey,
//     this.buttonColor = Colors.white,
//     this.iconSize = 24,
//     this.animationDuration = const Duration(milliseconds: 200),
//     this.resetAfterCompletion = false,
//     this.borderRadius = 30,
//     this.padding = 2.0, // Default 2px padding
//   }) : super(key: key);

//   @override
//   _SliderButtonState createState() => _SliderButtonState();
// }

// class _SliderButtonState extends State<SliderButton> {
//   double _position = 0;
//   double _maxPosition = 0;
//   bool _isCompleted = false;
//   bool _isDragging = false;

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _calculateMaxPosition();
//     });
//   }

//   void _calculateMaxPosition() {
//     final containerWidth = widget.width == double.infinity
//         ? (context.findRenderObject() as RenderBox?)?.size.width ?? 300
//         : widget.width;

//     setState(() {
//       // Account for padding on both sides
//       _maxPosition = containerWidth - widget.height - (widget.padding * 2);
//     });
//   }

//   void _resetSlider() {
//     setState(() {
//       _position = 0;
//       _isCompleted = false;
//     });
//   }

//   void _completeSlide() {
//     setState(() {
//       _isCompleted = true;
//     });
//     widget.onSlideCompleted();

//     if (widget.resetAfterCompletion) {
//       Future.delayed(widget.animationDuration * 2, _resetSlider);
//     }
//   }

//   Widget _buildIcon() {
//     final color = _isCompleted ? widget.activeColor : widget.buttonColor;
//     final size = widget.iconSize;

//     if (_isCompleted) {
//       return widget.completedIconPath != null
//           ? SvgPicture.asset(
//               widget.completedIconPath!,
//               color: color,
//               width: size,
//               height: size,
//               fit: BoxFit.contain,
//             )
//           : Icon(
//               widget.completedIcon,
//               color: color,
//               size: size,
//             );
//     } else {
//       return widget.initialIconPath != null
//           ? SvgPicture.asset(
//               widget.initialIconPath!,
//               color: color,
//               width: size,
//               height: size,
//               fit: BoxFit.contain,
//             )
//           : Icon(
//               widget.initialIcon,
//               color: color,
//               size: size,
//             );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return LayoutBuilder(
//       builder: (context, constraints) {
//         final effectiveWidth = widget.width == double.infinity
//             ? constraints.maxWidth
//             : widget.width;

//         return Container(
//           width: effectiveWidth,
//           height: widget.height,
//           padding: EdgeInsets.all(widget.padding), // Add padding here
//           decoration: BoxDecoration(
//             color: _isCompleted ? widget.activeColor : widget.inactiveColor,
//             borderRadius: BorderRadius.circular(widget.borderRadius),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 4,
//                 spreadRadius: 1,
//                 offset: const Offset(0, 2),
//               )
//             ],
//           ),
//           child: Stack(
//             clipBehavior: Clip.none,
//             children: [
//               Center(
//                 child: AnimatedOpacity(
//                   duration: widget.animationDuration,
//                   opacity: _isDragging ? 0.7 : 1.0,
//                   child: AnimatedDefaultTextStyle(
//                     duration: widget.animationDuration,
//                     style: TextStyle(
//                       color:
//                           _isCompleted ? widget.buttonColor : Colors.grey[600],
//                       fontSize: 16,
//                       fontWeight:
//                           _isCompleted ? FontWeight.bold : FontWeight.normal,
//                     ),
//                     child: Text(
//                       _isCompleted ? widget.completedText : widget.initialText,
//                     ),
//                   ),
//                 ),
//               ),
//               AnimatedPositioned(
//                 duration: widget.animationDuration,
//                 curve: Curves.easeOut,
//                 left: _position.clamp(0.0, _maxPosition),
//                 top: 0,
//                 child: GestureDetector(
//                   onHorizontalDragStart: (_) {
//                     setState(() => _isDragging = true);
//                   },
//                   onHorizontalDragUpdate: (details) {
//                     if (!_isCompleted) {
//                       setState(() {
//                         _position += details.delta.dx;
//                         _position = _position.clamp(0.0, _maxPosition);
//                       });
//                     }
//                   },
//                   onHorizontalDragEnd: (details) {
//                     setState(() => _isDragging = false);
//                     if (!_isCompleted) {
//                       if (_position == _maxPosition) {
//                         _completeSlide();
//                       } else {
//                         setState(() {
//                           _position = 0;
//                         });
//                       }
//                     }
//                   },
//                   onHorizontalDragCancel: () {
//                     setState(() => _isDragging = false);
//                     if (!_isCompleted) {
//                       setState(() => _position = 0);
//                     }
//                   },
//                   onTap: _isCompleted ? _resetSlider : null,
//                   child: Container(
//                     width: widget.height -
//                         (widget.padding * 2), // Adjust thumb size for padding
//                     height: widget.height -
//                         (widget.padding * 2), // Adjust thumb size for padding
//                     decoration: BoxDecoration(
//                       color: _isCompleted
//                           ? widget.buttonColor
//                           : widget.activeColor,
//                       borderRadius: BorderRadius.circular(
//                           widget.borderRadius - widget.padding),
//                       boxShadow: [
//                         BoxShadow(
//                           color:
//                               Colors.black.withOpacity(_isDragging ? 0.3 : 0.2),
//                           blurRadius: _isDragging ? 8 : 5,
//                           spreadRadius: 1,
//                           offset: const Offset(0, 2),
//                         )
//                       ],
//                     ),
//                     child: Center(
//                       child: AnimatedSwitcher(
//                         duration: widget.animationDuration,
//                         child: _buildIcon(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SliderButton extends StatefulWidget {
  final VoidCallback onSlideCompleted;
  final String initialText;
  final String completedText;
  final String? initialIconPath;
  final String? completedIconPath;
  final IconData? initialIcon;
  final IconData? completedIcon;
  final double height;
  final double width;
  final Color activeColor;
  final Color inactiveColor;
  final Color buttonColor;
  final double iconSize;
  final Duration animationDuration;
  final bool resetAfterCompletion;
  final double borderRadius;
  final double padding; // New padding parameter

  const SliderButton({
    Key? key,
    required this.onSlideCompleted,
    this.initialText = 'Slide to confirm',
    this.completedText = 'Completed!',
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
    this.animationDuration = const Duration(milliseconds: 200),
    this.resetAfterCompletion = false,
    this.borderRadius = 30,
    this.padding = 2.0, // Default 2px padding
  }) : super(key: key);

  @override
  _SliderButtonState createState() => _SliderButtonState();
}

class _SliderButtonState extends State<SliderButton> {
  double _position = 0;
  double _maxPosition = 0;
  bool _isCompleted = false;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateMaxPosition();
    });
  }

  void _calculateMaxPosition() {
    final containerWidth = widget.width == double.infinity
        ? (context.findRenderObject() as RenderBox?)?.size.width ?? 300
        : widget.width;

    setState(() {
      // Account for padding on both sides
      _maxPosition = containerWidth - widget.height - (widget.padding * 2);
    });
  }

  void _resetSlider() {
    setState(() {
      _position = 0;
      _isCompleted = false;
    });
  }

  void _completeSlide() {
    setState(() {
      _isCompleted = true;
    });
    widget.onSlideCompleted();

    if (widget.resetAfterCompletion) {
      Future.delayed(widget.animationDuration * 2, _resetSlider);
    }
  }

  Widget _buildIcon() {
    final color = _isCompleted ? widget.activeColor : widget.buttonColor;
    final size = widget.iconSize;

    if (_isCompleted) {
      return widget.completedIconPath != null
          ? SvgPicture.asset(
              widget.completedIconPath!,
              color: color,
              width: size,
              height: size,
              fit: BoxFit.contain,
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
              fit: BoxFit.contain,
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final effectiveWidth = widget.width == double.infinity
            ? constraints.maxWidth
            : widget.width;

        return Container(
          width: effectiveWidth,
          height: widget.height,
          padding: EdgeInsets.all(widget.padding), // Add padding here
          decoration: BoxDecoration(
            color: _isCompleted ? widget.activeColor : widget.inactiveColor,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            // Removed boxShadow here
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Center(
                child: AnimatedOpacity(
                  duration: widget.animationDuration,
                  opacity: _isDragging ? 0.7 : 1.0,
                  child: AnimatedDefaultTextStyle(
                    duration: widget.animationDuration,
                    style: GoogleFonts.robotoSerif(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text(
                      _isCompleted ? widget.completedText : widget.initialText,
                      style: TextStyle(
                        color: _isCompleted ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: widget.animationDuration,
                curve: Curves.easeOut,
                left: _position.clamp(0.0, _maxPosition),
                top: 0,
                child: GestureDetector(
                  onHorizontalDragStart: (_) {
                    setState(() => _isDragging = true);
                  },
                  onHorizontalDragUpdate: (details) {
                    if (!_isCompleted) {
                      setState(() {
                        _position += details.delta.dx;
                        _position = _position.clamp(0.0, _maxPosition);
                      });
                    }
                  },
                  onHorizontalDragEnd: (details) {
                    setState(() => _isDragging = false);
                    if (!_isCompleted) {
                      if (_position == _maxPosition) {
                        _completeSlide();
                      } else {
                        setState(() {
                          _position = 0;
                        });
                      }
                    }
                  },
                  onHorizontalDragCancel: () {
                    setState(() => _isDragging = false);
                    if (!_isCompleted) {
                      setState(() => _position = 0);
                    }
                  },
                  onTap: _isCompleted ? _resetSlider : null,
                  child: Container(
                    width: widget.height -
                        (widget.padding * 2), // Adjust thumb size for padding
                    height: widget.height -
                        (widget.padding * 2), // Adjust thumb size for padding
                    decoration: BoxDecoration(
                      color: _isCompleted
                          ? widget.buttonColor
                          : widget.activeColor,
                      borderRadius: BorderRadius.circular(
                          widget.borderRadius - widget.padding),
                      // Removed boxShadow here
                    ),
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: widget.animationDuration,
                        child: _buildIcon(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
