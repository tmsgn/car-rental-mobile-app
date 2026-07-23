import 'package:flutter/material.dart';
import '../../core/colors/app_colors.dart';
import '../../core/typography/app_typography.dart';
import '../../core/spacing/app_spacing.dart';
import '../../mock_data/mock_data.dart';
import '../../mock_data/mock_vehicles.dart';
import '../../widgets/inputs/app_text_field.dart';
import '../../widgets/cards/vehicle_card.dart';
import 'package:go_router/go_router.dart';
import '../../core/routes/app_routes.dart';
import '../../models/vehicle_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredCars = mockVehicles.where((v) => v.isFeatured).take(5).toList();
    final popularCars = mockVehicles.where((v) => v.rating >= 4.8).take(10).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(context),
              _buildCategories(),
              _buildSectionTitle('Featured Cars', onSeeAll: () {}),
              _buildHorizontalCarList(featuredCars),
              _buildSectionTitle('Popular Rentals', onSeeAll: () {}),
              _buildHorizontalCarList(popularCars),
              const SizedBox(height: AppSpacing.xxl),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good morning,',
                style: AppTypography.textTheme.bodyLarge,
              ),
              Text(
                mockCurrentUser.fullName.split(' ').first,
                style: AppTypography.textTheme.displaySmall,
              ),
            ],
          ),
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(mockCurrentUser.profileImageUrl),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
      child: SearchBarWidget(
        onFilterTap: () {
          // Open filter bottom sheet
        },
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      {'name': 'All', 'icon': Icons.apps},
      {'name': 'Luxury', 'icon': Icons.diamond},
      {'name': 'SUV', 'icon': Icons.airport_shuttle},
      {'name': 'Electric', 'icon': Icons.electric_car},
      {'name': 'Economy', 'icon': Icons.directions_car},
    ];

    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final cat = categories[index];
          final isSelected = index == 0;
          
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : AppColors.surface,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusLg),
                    border: isSelected ? null : Border.all(color: AppColors.border),
                  ),
                  child: Icon(
                    cat['icon'] as IconData,
                    color: isSelected ? Colors.white : AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  cat['name'] as String,
                  style: AppTypography.textTheme.labelLarge?.copyWith(
                    color: isSelected ? AppColors.primary : AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onSeeAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.pagePadding,
        vertical: AppSpacing.md,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTypography.textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: onSeeAll,
            child: Text('See All', style: AppTypography.textTheme.labelLarge),
          ),
        ],
      ),
    );
  }

  Widget _buildHorizontalCarList(List<Vehicle> cars) {
    return SizedBox(
      height: 330,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.md),
            child: VehicleCard(
              width: 260,
              vehicle: cars[index],
              onTap: () {
                context.push(AppRoutes.vehicleDetails, extra: cars[index]);
              },
            ),
          );
        },
      ),
    );
  }
}
