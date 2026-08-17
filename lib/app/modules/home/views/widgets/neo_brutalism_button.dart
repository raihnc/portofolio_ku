import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';

class NeoBrutalismButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool hasShadow;
  final EdgeInsets padding;
  final IconData? icon;

  const NeoBrutalismButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppTheme.secondary,
    this.textColor = AppTheme.primary,
    this.hasShadow = true,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.icon,
  });

  @override
  State<NeoBrutalismButton> createState() => _NeoBrutalismButtonState();
}

class _NeoBrutalismButtonState extends State<NeoBrutalismButton> {
  bool _isHovered = false;
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: widget.padding,
          transform: Matrix4.identity()
            ..translate(
              _isPressed ? AppValues.shadowOffset : 0.0,
              _isPressed ? AppValues.shadowOffset : 0.0,
            ),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            border: Border.all(
              color: AppTheme.border,
              width: AppValues.borderWidth,
            ),
            boxShadow: widget.hasShadow && !_isPressed
                ? [
                    BoxShadow(
                      color: AppTheme.border,
                      offset: const Offset(
                        AppValues.shadowOffset,
                        AppValues.shadowOffset,
                      ),
                    ),
                  ]
                : null,
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: widget.textColor, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  widget.text,
                  style: GoogleFonts.spaceMono(
                    color: widget.textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        )
            .animate(target: _isHovered ? 1 : 0)
            .scale(
              begin: Offset(1, 1),
              end: Offset(1.02, 1.02),
              duration: 150.ms,
              curve: Curves.easeOut,
            ),
      ),
    );
  }
}
