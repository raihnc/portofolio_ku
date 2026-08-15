import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/values/app_values.dart';
import '../widgets/neo_brutalism_card.dart';
import '../../controllers/home_controller.dart';

class TechStackSection extends StatelessWidget {
  final HomeController controller;

  const TechStackSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        isMobile ? AppValues.paddingLarge : AppValues.paddingXLarge * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TECH STACK',
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.w800,
              color: AppTheme.primary,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 32),
          _buildCategorySection('Frontend', isMobile, isTablet, 0),
          const SizedBox(height: 24),
          _buildCategorySection('Backend', isMobile, isTablet, 1),
          const SizedBox(height: 24),
          _buildCategorySection('Tools', isMobile, isTablet, 2),
        ],
      ),
    );
  }

  Widget _buildCategorySection(String category, bool isMobile, bool isTablet, int sectionIndex) {
    final techs = controller.getTechByCategory(category);
    int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    return NeoBrutalismCard(
      backgroundColor: _getCategoryColor(category),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.toUpperCase(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
              letterSpacing: 1.5,
            ),
          )
              .animate()
              .fadeIn(duration: 400.ms, delay: (200 * sectionIndex).ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 2.5,
            ),
            itemCount: techs.length,
            itemBuilder: (context, index) {
              final tech = techs[index];
              return _TechItem(
                techName: tech.name,
                index: index,
                sectionIndex: sectionIndex,
              );
            },
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 600.ms, delay: (150 * sectionIndex).ms)
        .slideY(begin: 0.2, end: 0, duration: 600.ms, delay: (150 * sectionIndex).ms);
  }

  Color _getCategoryColor(String category) {
    switch (category) {
      case 'Frontend':
        return AppTheme.secondary;
      case 'Backend':
        return const Color(0xFFB6F500);
      case 'Tools':
        return const Color(0xFF00FFFF);
      default:
        return AppTheme.cardBg;
    }
  }
}

class _TechItem extends StatefulWidget {
  final String techName;
  final int index;
  final int sectionIndex;

  const _TechItem({
    required this.techName,
    required this.index,
    required this.sectionIndex,
  });

  @override
  State<_TechItem> createState() => _TechItemState();
}

class _TechItemState extends State<_TechItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          border: Border.all(
            color: AppTheme.border,
            width: AppValues.borderWidth,
          ),
          boxShadow: const [
            BoxShadow(color: AppTheme.border, offset: Offset(3, 3)),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.techName,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: AppTheme.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(
            duration: 400.ms,
            delay: (200 * widget.sectionIndex + 50 * widget.index).ms,
          )
          .scale(
            begin: Offset(0.8, 0.8),
            end: Offset(1, 1),
            duration: 400.ms,
            delay: (200 * widget.sectionIndex + 50 * widget.index).ms,
          )
          .then()
          .animate(
            target: _isHovered ? 1 : 0,
          )
          .scale(
            begin: Offset(1, 1),
            end: Offset(1.05, 1.05),
            duration: 200.ms,
            curve: Curves.easeOut,
          ),
    );
  }
}
