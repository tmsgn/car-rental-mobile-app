import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../core/colors/app_colors.dart';
import '../../core/spacing/app_spacing.dart';
import '../../core/typography/app_typography.dart';
import '../../mock_data/mock_vehicles.dart';
import '../../widgets/cards/vehicle_card.dart';
import '../../widgets/inputs/app_text_field.dart';
import '../../models/vehicle_model.dart';
import '../../core/routes/app_routes.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  final List<String> _filters = ['All', 'Luxury', 'SUV', 'Electric', 'Economy'];
  String _selectedFilter = 'All';
  bool _isGrid = false;
  late List<Vehicle> _filteredVehicles;

  @override
  void initState() {
    super.initState();
    _filteredVehicles = mockVehicles;
  }

  void _applyFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
      if (filter == 'All') {
        _filteredVehicles = mockVehicles;
      } else {
        _filteredVehicles = mockVehicles.where((v) => v.category == filter).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Find a Car'),
        actions: [
          IconButton(
            icon: Icon(_isGrid ? LucideIcons.list : LucideIcons.layoutGrid),
            onPressed: () => setState(() => _isGrid = !_isGrid),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.pagePadding),
            child: SearchBarWidget(
              onFilterTap: () {
                // Open advanced filters
              },
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.pagePadding),
              itemCount: _filters.length,
              itemBuilder: (context, index) {
                final filter = _filters[index];
                final isSelected = _selectedFilter == filter;
                return Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.sm),
                  child: FilterChip(
                    label: Text(filter),
                    selected: isSelected,
                    onSelected: (val) => _applyFilter(filter),
                    selectedColor: AppColors.primary,
                    checkmarkColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textPrimary,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
                    ),
                    side: BorderSide(
                      color: isSelected ? AppColors.primary : AppColors.border,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Expanded(
            child: _isGrid ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      itemCount: _filteredVehicles.length,
      itemBuilder: (context, index) {
        return VehicleCard(
          vehicle: _filteredVehicles[index],
          isHorizontal: true,
          onTap: () {
            context.push(AppRoutes.vehicleDetails, extra: _filteredVehicles[index]);
          },
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(AppSpacing.pagePadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.68,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.md,
      ),
      itemCount: _filteredVehicles.length,
      itemBuilder: (context, index) {
        return VehicleCard(
          vehicle: _filteredVehicles[index],
          onTap: () {
            context.push(AppRoutes.vehicleDetails, extra: _filteredVehicles[index]);
          },
        );
      },
    );
  }
}
