import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../core/routes/app_routes.dart';
import '../../models/vehicle_model.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../models/payment_method_model.dart';
import '../../mock_data/mock_data.dart';

class BookingSummaryScreen extends StatefulWidget {
  final Vehicle vehicle;

  const BookingSummaryScreen({super.key, required this.vehicle});

  @override
  State<BookingSummaryScreen> createState() => _BookingSummaryScreenState();
}

class _BookingSummaryScreenState extends State<BookingSummaryScreen> {
  bool _isLoading = false;
  bool _termsAccepted = false;

  void _handleConfirm() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        context.push(AppRoutes.bookingSuccess, extra: widget.vehicle);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Mock values
    const tripDays = 3;
    final tripTotal = widget.vehicle.pricePerDay * tripDays;
    const insurance = 25.0 * tripDays;
    const fee = 15.0;
    final total = tripTotal + insurance + fee;
    final paymentMethod = mockPaymentMethods.first;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.pagePadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionHeader('Trip Summary'),
                    _buildSummaryCard(tripDays, tripTotal, insurance, fee, total),
                    const SizedBox(height: AppSpacing.xxl),
                    
                    _buildSectionHeader('Payment Method'),
                    _buildPaymentCard(paymentMethod),
                    const SizedBox(height: AppSpacing.xxl),

                    _buildSectionHeader('Protection Plan'),
                    _buildProtectionCard(),
                    const SizedBox(height: AppSpacing.xxl),
                    
                    _buildPolicies(),
                  ],
                ),
              ),
            ),
            _buildBottomBar(total),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Text(title, style: AppTypography.textTheme.headlineMedium),
    );
  }

  Widget _buildSummaryCard(int days, double tripTotal, double insurance, double fee, double total) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
                child: Image.network(
                  widget.vehicle.imageUrls.first,
                  width: 80,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.vehicle.fullName, style: AppTypography.textTheme.titleLarge),
                    const SizedBox(height: AppSpacing.xs),
                    Row(
                      children: [
                        const Icon(LucideIcons.calendar, size: 14, color: AppColors.textTertiary),
                        const SizedBox(width: 4),
                        Text('Aug 12 - Aug 15 ($days days)', style: AppTypography.textTheme.bodySmall),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(),
          ),
          _buildPriceRow('\$${widget.vehicle.pricePerDay.toInt()} x $days days', tripTotal),
          const SizedBox(height: AppSpacing.sm),
          _buildPriceRow('Standard Insurance', insurance),
          const SizedBox(height: AppSpacing.sm),
          _buildPriceRow('Service Fee', fee),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
            child: Divider(),
          ),
          _buildPriceRow('Total', total, isBold: true),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double amount, {bool isBold = false}) {
    final style = isBold 
      ? AppTypography.textTheme.headlineMedium?.copyWith(color: AppColors.textPrimary)
      : AppTypography.textTheme.bodyLarge;
      
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: style,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Text('\$${amount.toStringAsFixed(2)}', style: style),
      ],
    );
  }

  Widget _buildPaymentCard(PaymentMethod method) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.creditCard, color: AppColors.primary),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Text(method.displayName, style: AppTypography.textTheme.titleLarge),
          ),
          TextButton(
            onPressed: () => context.push(AppRoutes.paymentMethods),
            child: const Text('Change'),
          ),
        ],
      ),
    );
  }

  Widget _buildProtectionCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
            ),
            child: const Icon(LucideIcons.shieldCheck, color: AppColors.primary),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Standard Protection', style: AppTypography.textTheme.titleLarge),
                const SizedBox(height: 2),
                Text('Includes physical damage coverage up to \$50k.', style: AppTypography.textTheme.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPolicies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Cancellation Policy', style: AppTypography.textTheme.titleLarge),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Free cancellation up to 24 hours before the trip starts. A 50% fee applies for cancellations within 24 hours.',
          style: AppTypography.textTheme.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.xxl),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: _termsAccepted,
              activeColor: AppColors.primary,
              onChanged: (val) {
                setState(() => _termsAccepted = val ?? false);
              },
            ),
            Expanded(
              child: Text(
                'I agree to the Rental Agreement and Cancellation Policy.',
                style: AppTypography.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBottomBar(double total) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      decoration: BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: PrimaryButton(
        text: 'Pay \$${total.toStringAsFixed(2)}',
        isLoading: _isLoading,
        onPressed: _termsAccepted ? _handleConfirm : null,
      ),
    );
  }
}
