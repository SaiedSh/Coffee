import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String lable;
  final Color buttomColor, lableColor, borderColor;
  final double width, height, borderWidth, fontSize;
  final FontWeight fontWeight;
  final BorderRadius borderRadius;

  const MyButton(
      {super.key,
      this.onTap,
      required this.lable,
      required this.buttomColor,
      required this.width,
      required this.fontWeight,
      required this.lableColor,
      required this.borderRadius,
      required this.height,
      required this.borderColor,
      required this.borderWidth,
      required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: RawMaterialButton(
        onPressed: onTap,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
            side: BorderSide(color: borderColor, width: borderWidth)),
        fillColor: buttomColor,
        child: Text(
          lable,
          style: TextStyle(
              fontWeight: fontWeight, color: lableColor, fontSize: fontSize),
        ),
      ),
    );
  }
}

class ToggleAnimatedIconButton extends StatefulWidget {
  final List<String> toggleItems;
  final AnimatedIconData? toggleIcon;
  final Function(bool) onPressed;
  final Duration animationDuration;
  final Curve animationCurve;

  const ToggleAnimatedIconButton(
      {required this.toggleItems,
      this.toggleIcon,
      required this.onPressed,
      this.animationDuration = const Duration(milliseconds: 350),
      this.animationCurve = Curves.bounceIn,
      Key? key})
      : assert(toggleItems.length == 2),
        super(key: key);

  @override
  State<ToggleAnimatedIconButton> createState() =>
      _ToggleAnimatedIconButtonState();
}

class _ToggleAnimatedIconButtonState extends State<ToggleAnimatedIconButton>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;
  bool state = false;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);

    _animation = CurvedAnimation(
        parent: _animationController, curve: widget.animationCurve);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Colors.indigo,
      label: Row(
        children: [
          Text(!state ? widget.toggleItems[0] : widget.toggleItems[1]),
          widget.toggleIcon != null
              ? AnimatedIcon(icon: widget.toggleIcon!, progress: _animation)
              : Container(),
        ],
      ),
      onPressed: () {
        if (!state) {
          _animationController.forward();
        } else {
          _animationController.reverse();
        }
        widget.onPressed(state);
        setState(() {
          state = !state;
        });
      },
    );
  }
}
