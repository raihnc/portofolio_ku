import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';

class NeoBrutalismCard extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final VoidCallback? onTap;
  final double? borderWidth;

  const NeoBrutalismCard({
    super.key,
    required this.child,
    this.backgroundColor = AppTheme.cardBg,
    this.padding,
    this.onTap,
    this.borderWidth,
  });

  @override
  State<NeoBrutalismCard> createState() => _NeoBrutalismCardState();
}

class _NeoBrutalismCardState extends State<NeoBrutalismCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bw = widget.borderWidth ?? AppValues.borderWidth;

    final content = MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: widget.padding ?? const EdgeInsets.all(AppValues.paddingLarge),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          border: Border.all(
            color: AppTheme.border,
            width: bw,
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.border,
              offset: Offset(
                _isHovered && widget.onTap != null
                    ? AppValues.shadowOffset + 2
                    : AppValues.shadowOffset,
                _isHovered && widget.onTap != null
                    ? AppValues.shadowOffset + 2
                    : AppValues.shadowOffset,
              ),
            ),
          ],
        ),
        child: widget.child,
      )
          .animate(target: _isHovered && widget.onTap != null ? 1 : 0)
          .moveY(
            begin: 0,
            end: -2,
            duration: 200.ms,
            curve: Curves.easeOut,
          ),
    );

    if (widget.onTap != null) {
      return GestureDetector(
        onTap: widget.onTap,
        child: content,
      );
    }

    return content;
  }
}
