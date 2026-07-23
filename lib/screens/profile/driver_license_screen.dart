import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../widgets/buttons/app_buttons.dart';

class DriverLicenseScreen extends StatefulWidget {
  const DriverLicenseScreen({super.key});

  @override
  State<DriverLicenseScreen> createState() => _DriverLicenseScreenState();
}

class _DriverLicenseScreenState extends State<DriverLicenseScreen> {
  final bool _isVerified = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Driver\'s License')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(),
            const SizedBox(height: AppSpacing.xxl),
            Text('License Details', style: AppTypography.textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.md),
            _buildDetailRow('State/Country', 'California, USA'),
            const Divider(height: AppSpacing.lg),
            _buildDetailRow('License Number', 'D1234567'),
            const Divider(height: AppSpacing.lg),
            _buildDetailRow('Expiration Date', '10/24/2028'),
            const SizedBox(height: AppSpacing.xxxl),
            
            Text('Update License', style: AppTypography.textTheme.headlineMedium),
            const SizedBox(height: AppSpacing.sm),
            Text('If your license has expired or you moved, please upload a new one.', style: AppTypography.textTheme.bodyMedium),
            const SizedBox(height: AppSpacing.lg),
            
            SecondaryButton(
              text: 'Upload New License',
              icon: LucideIcons.uploadCloud,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Camera/Gallery picker would open here')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: _isVerified ? AppColors.success.withOpacity(0.1) : AppColors.warning.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: _isVerified ? AppColors.success.withOpacity(0.3) : AppColors.warning.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Icon(
            _isVerified ? LucideIcons.checkCircle : LucideIcons.clock,
            size: 48,
            color: _isVerified ? AppColors.success : AppColors.warning,
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            _isVerified ? 'License Verified' : 'Verification Pending',
            style: AppTypography.textTheme.titleLarge?.copyWith(
              color: _isVerified ? AppColors.success : AppColors.warning,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            _isVerified 
                ? 'You are approved to drive all vehicles.'
                : 'We are reviewing your document. This usually takes 5 minutes.',
            textAlign: TextAlign.center,
            style: AppTypography.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTypography.textTheme.bodyLarge?.copyWith(color: AppColors.textSecondary)),
          Text(value, style: AppTypography.textTheme.titleMedium),
        ],
      ),
    );
  }
}
