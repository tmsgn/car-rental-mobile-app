import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Terms & Privacy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Terms of Service', style: AppTypography.textTheme.displaySmall),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Last updated: August 2026\n\n'
              '1. Acceptance of Terms\n'
              'By accessing and using the DriveEase application, you agree to be bound by these Terms of Service and all applicable laws and regulations.\n\n'
              '2. Rental Agreement\n'
              'All vehicle rentals are subject to the specific rental agreement provided at the time of booking. You must be at least 21 years old and hold a valid driver\'s license.\n\n'
              '3. User Responsibilities\n'
              'You are responsible for maintaining the condition of the vehicle and returning it on time. Any damages incurred during your rental period will be charged to your payment method on file.\n\n'
              '4. Insurance and Liability\n'
              'DriveEase provides standard insurance coverage for all trips, subject to deductibles. You may purchase additional protection plans during checkout.',
              style: AppTypography.textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xxxl),
            Text('Privacy Policy', style: AppTypography.textTheme.displaySmall),
            const SizedBox(height: AppSpacing.md),
            Text(
              '1. Information Collection\n'
              'We collect personal information such as your name, email, phone number, and payment details when you register and use our services.\n\n'
              '2. Location Data\n'
              'DriveEase requires location access to show you nearby vehicles and to verify trip starts/ends. You can manage these permissions in your settings.\n\n'
              '3. Data Security\n'
              'We implement industry-standard security measures to protect your personal information. We do not sell your data to third parties.',
              style: AppTypography.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
