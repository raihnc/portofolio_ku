import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/utils/pdf_opener.dart';
import '../../../../core/values/app_values.dart';
import '../../../../data/models/certificate_model.dart';
import '../widgets/neo_brutalism_card.dart';
import '../widgets/neo_brutalism_button.dart';
import '../../controllers/home_controller.dart';

class CertificateSection extends StatelessWidget {
  final HomeController controller;

  const CertificateSection({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < AppValues.mobileBreakpoint;
    final isTablet =
        size.width >= AppValues.mobileBreakpoint &&
        size.width < AppValues.tabletBreakpoint;

    int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? AppValues.paddingLarge : AppValues.paddingXXLarge,
        vertical: AppValues.paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'SERTIFIKAT',
            style: GoogleFonts.ebGaramond(
              fontSize: isMobile ? 28 : 48,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          )
              .animate()
              .fadeIn(duration: 600.ms)
              .slideX(begin: -0.2, end: 0),
          const SizedBox(height: 24),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.75,
            ),
            itemCount: controller.certificates.length,
            itemBuilder: (context, index) {
              final certificate = controller.certificates[index];
              return _CertificateCard(
                certificate: certificate,
                index: index,
                onTap: () => _viewCertificate(context, certificate),
              );
            },
          ),
        ],
      ),
    );
  }

  void _viewCertificate(BuildContext context, CertificateModel certificate) {
    if (kIsWeb && certificate.pdfUrl != null) {
      openPdfInNewTab(certificate.pdfUrl!);
    } else {
      _showFullImage(context, certificate.imageUrl);
    }
  }

  void _showFullImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) =>
          Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.all(16),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.cardBg,
                        border: Border.all(
                          color: AppTheme.border,
                          width: AppValues.borderWidth,
                        ),
                      ),
                      child: InteractiveViewer(
                        panEnabled: true,
                        minScale: 0.5,
                        maxScale: 4.0,
                        child: Image.asset(imageUrl, fit: BoxFit.contain),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Container(
                          decoration: BoxDecoration(
                            color: AppTheme.cardBg,
                            border: Border.all(
                              color: AppTheme.border,
                              width: AppValues.borderWidth,
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: Icon(Icons.close, color: AppTheme.primary),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: 300.ms)
              .scale(begin: Offset(0.8, 0.8), end: Offset(1, 1)),
    );
  }
}

class _CertificateCard extends StatefulWidget {
  final CertificateModel certificate;
  final int index;
  final VoidCallback onTap;

  const _CertificateCard({
    required this.certificate,
    required this.index,
    required this.onTap,
  });

  @override
  State<_CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<_CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child:
          NeoBrutalismCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppTheme.border,
                            width: AppValues.borderWidth,
                          ),
                        ),
                        child: Image.asset(
                          widget.certificate.imageUrl,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      widget.certificate.name,
                      style: GoogleFonts.spaceMono(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: NeoBrutalismButton(
                        text: 'Lihat Sertifikat',
                        onPressed: widget.onTap,
                        backgroundColor: AppTheme.tertiary,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              )
              .animate()
              .fadeIn(duration: 600.ms, delay: (100 * widget.index).ms)
              .slideY(
                begin: 0.3,
                end: 0,
                duration: 600.ms,
                delay: (100 * widget.index).ms,
              )
              .then()
              .animate(target: _isHovered ? 1 : 0)
              .moveY(
                begin: 0,
                end: -4,
                duration: 200.ms,
                curve: Curves.easeOut,
              ),
    );
  }
}
