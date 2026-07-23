import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:go_router/go_router.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../models/vehicle_model.dart';
import '../../widgets/buttons/app_buttons.dart';
import '../../core/routes/app_routes.dart';

class VehicleDetailsScreen extends StatefulWidget {
  final Vehicle vehicle;

  const VehicleDetailsScreen({super.key, required this.vehicle});

  @override
  State<VehicleDetailsScreen> createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.pagePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTitleSection(),
                  const SizedBox(height: AppSpacing.xxl),
                  _buildSpecifications(),
                  const SizedBox(height: AppSpacing.xxl),
                  _buildDescription(),
                  const SizedBox(height: AppSpacing.xxl),
                  _buildFeatures(),
                  const SizedBox(height: 100), // padding for bottom bar
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildBottomBar(context),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      pinned: true,
      backgroundColor: AppColors.surface,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AppIconButton(
          icon: LucideIcons.arrowLeft,
          onPressed: () => context.pop(),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AppIconButton(
            icon: LucideIcons.heart,
            onPressed: () {},
          ),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: widget.vehicle.imageUrls.length,
              itemBuilder: (context, index) {
                return Hero(
                  tag: 'vehicle_image_${widget.vehicle.id}',
                  child: CachedNetworkImage(
                    imageUrl: widget.vehicle.imageUrls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Positioned(
              bottom: AppSpacing.md,
              left: 0,
              right: 0,
              child: Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.vehicle.imageUrls.length,
                  effect: const WormEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.vehicle.fullName,
                style: AppTypography.textTheme.displaySmall,
              ),
            ),
            InkWell(
              onTap: () {
                context.push(AppRoutes.reviews, extra: widget.vehicle);
              },
              borderRadius: BorderRadius.circular(AppSpacing.radiusSm),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                child: Row(
                  children: [
                    const Icon(LucideIcons.star, color: AppColors.warning, size: 20),
                    const SizedBox(width: AppSpacing.xs),
                    Text(
                      widget.vehicle.rating.toString(),
                      style: AppTypography.textTheme.titleLarge,
                    ),
                    Text(
                      ' (${widget.vehicle.reviewCount})',
                      style: AppTypography.textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 4),
                    const Icon(LucideIcons.chevronRight, size: 16, color: AppColors.textTertiary),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            const Icon(LucideIcons.mapPin, size: 16, color: AppColors.textTertiary),
            const SizedBox(width: AppSpacing.xs),
            Text(
              widget.vehicle.location,
              style: AppTypography.textTheme.bodyLarge,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSpecifications() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildSpecItem(LucideIcons.gauge, '${widget.vehicle.seats} Seats'),
          const SizedBox(width: AppSpacing.sm),
          _buildSpecItem(LucideIcons.fuel, widget.vehicle.fuelType),
          const SizedBox(width: AppSpacing.sm),
          _buildSpecItem(LucideIcons.settings, widget.vehicle.transmission),
          const SizedBox(width: AppSpacing.sm),
          _buildSpecItem(LucideIcons.palette, widget.vehicle.color),
        ],
      ),
    );
  }

  Widget _buildSpecItem(IconData icon, String label) {
    return Container(
      width: 70,
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusMd),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            style: AppTypography.textTheme.labelSmall,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Description', style: AppTypography.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.sm),
        Text(
          widget.vehicle.description,
          style: AppTypography.textTheme.bodyLarge,
        ),
      ],
    );
  }

  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Features', style: AppTypography.textTheme.headlineMedium),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: widget.vehicle.features.map((feature) {
            return Chip(
              label: Text(feature),
              backgroundColor: AppColors.surface,
              side: const BorderSide(color: AppColors.border),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildBottomBar(BuildContext context) {
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
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Total Price', style: AppTypography.textTheme.bodyMedium),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '\$${widget.vehicle.pricePerDay.toInt()}',
                          style: AppTypography.textTheme.displaySmall?.copyWith(color: AppColors.primary),
                        ),
                        TextSpan(
                          text: ' /day',
                          style: AppTypography.textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PrimaryButton(
                text: 'Book Now',
                onPressed: () {
                  context.push(AppRoutes.bookingDate, extra: widget.vehicle);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
