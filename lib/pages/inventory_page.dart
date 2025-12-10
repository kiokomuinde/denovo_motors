// lib/pages/inventory_page.dart

import 'package:flutter/material.dart';
import '../main.dart'; 
import '../common_widgets.dart'; // <-- NEW IMPORT for Navbar and Footer

// --- DUMMY DATA FOR DEMO (Placeholder for CarModel and allCars, needed for the grid) ---
// NOTE: These should be imported from '../data/car_data.dart'
class CarModel {
  final String name;
  final String make;
  final String imageUrl;
  final int year;
  final double price;
  final String description;

  CarModel({
    required this.name,
    required this.make,
    required this.imageUrl,
    required this.year,
    required this.price,
    required this.description,
  });
}

// Dummy data for filtering
final List<CarModel> allCars = List.generate(
  18,
  (index) => CarModel(
    name: 'Luxury Sport Car ${index + 1}',
    make: ['Porsche', 'Ferrari', 'Lexus', 'BMW'][index % 4],
    imageUrl: 'images/car${(index % 8) + 1}.webp',
    year: 2024 - (index % 5),
    price: 50000.00 + (index * 15000.00),
    description: 'A finely crafted vehicle.',
  ),
);

final List<String> availableMakes = ['Porsche', 'Ferrari', 'Lexus', 'BMW'];
final List<int> availableYears = [2024, 2023, 2022, 2021];
// -------------------------------------------------------------------------------------

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Filter Bar Height Calculation (retaining previous overflow fix)
    const double contentPadding = 25.0; 
    const double titleHeight = 35.0; 
    const double spacingHeight = 20.0; 
    const double rowHeight = 60.0; 
    const double safeFilterBarHeight = (contentPadding * 2) + titleHeight + spacingHeight + rowHeight + 10.0; // 175.0

    return Scaffold(
      // 1. APP BAR (NOW USING THE SHARED WIDGET)
      appBar: const CustomStandardAppBar(), // <-- Updated from _InventoryAppBar
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. Inventory Header/Banner
          const _BuildInventoryHeader(),
          
          // 2. Top Spacing for the Filter Bar (Original vertical padding: 40 top)
          const SliverToBoxAdapter(child: SizedBox(height: 40)), 

          // 3. Search and Filter Controls (NOW STICKY)
          SliverPersistentHeader(
            pinned: true,
            delegate: _InventoryFilterBarDelegate(
              maxHeight: safeFilterBarHeight, 
              minHeight: safeFilterBarHeight,
              child: const _InventoryFilterBarContent(),
            ),
          ),
          
          // 4. Bottom Spacing for the Filter Bar (Original vertical padding: 40 bottom)
          const SliverToBoxAdapter(child: SizedBox(height: 40)),

          // 5. The Car Gallery Grid
          const _BuildCarGalleryGrid(),

          // 6. Spacer before footer
          const SliverToBoxAdapter(child: SizedBox(height: 60)), 
          
          // 7. FOOTER (NOW USING THE SHARED WIDGET)
          const SliverToBoxAdapter(child: CustomFooter()), // <-- Updated from _BuildFooter
        ],
      ),
    );
  }
}

// --- WIDGET 2: INVENTORY HEADER BANNER (Updated Opacity/Catchy Text) ---
class _BuildInventoryHeader extends StatelessWidget {
  const _BuildInventoryHeader();

  @override
  Widget build(BuildContext context) {
    // Assuming colors are defined in main.dart
    const Color denovoBlack = Color(0xFF1A1A1A);
    const Color denovoRed = Color(0xFFE31E24);
    const Color denovoYellow = Color(0xFFFFC300);
    const Color denovoWhite = Color(0xFFFFFFFF);

    return SliverToBoxAdapter(
      child: Container(
        height: 300,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: denovoBlack,
          image: DecorationImage(
            image: const AssetImage('images/inventory_banner.webp'), 
            fit: BoxFit.cover,
            opacity: 0.1, 
            colorFilter: ColorFilter.mode(denovoBlack.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'THE DENOVO PORTFOLIO',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                color: denovoWhite,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'The Road to Your Next Masterpiece Starts Here',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 22,
                color: denovoYellow,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              width: 150,
              height: 4,
              color: denovoRed,
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET 3A: SLIVER PERSISTENT HEADER DELEGATE ---
class _InventoryFilterBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  const _InventoryFilterBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  // Builds the content of the sticky header.
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // Assuming denovoBlack is available
    const Color denovoBlack = Color(0xFF1A1A1A);
    
    return Container(
      // This container is the background for the sticky part
      color: denovoBlack, 
      alignment: Alignment.center,
      child: child, // The stateful filter bar content
    );
  }

  @override
  bool shouldRebuild(_InventoryFilterBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}

// --- WIDGET 3B: FILTER BAR CONTENT (Refactored to be a standard Widget for the delegate) ---
class _InventoryFilterBarContent extends StatefulWidget {
  const _InventoryFilterBarContent();

  @override
  State<_InventoryFilterBarContent> createState() => _InventoryFilterBarContentState();
}

class _InventoryFilterBarContentState extends State<_InventoryFilterBarContent> {
  String? _selectedMake;
  String? _selectedPriceRange;
  int? _selectedYear;
  
  // Assuming colors are defined in main.dart
  static const Color denovoBlack = Color(0xFF1A1A1A);
  static const Color denovoRed = Color(0xFFE31E24);
  static const Color denovoWhite = Color(0xFFFFFFFF);
  
  Widget _buildFilterDropdown(
    String hint, 
    List<dynamic> options, 
    dynamic currentValue, 
    Function(dynamic) onChanged
  ) {
    List<DropdownMenuItem<dynamic>> items = [
      DropdownMenuItem(
        value: null,
        child: Text('All $hint', style: TextStyle(color: denovoBlack.withOpacity(0.6))),
      ),
    ];
    items.addAll(options.map((value) {
      return DropdownMenuItem<dynamic>(
        value: value,
        child: Text(value.toString(), style: const TextStyle(color: denovoBlack)),
      );
    }));

    return DropdownButtonFormField<dynamic>(
      value: currentValue,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: denovoWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(color: denovoBlack.withOpacity(0.1)),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      items: items,
      onChanged: (newValue) => onChanged(newValue),
      style: const TextStyle(color: denovoBlack),
      iconEnabledColor: denovoRed,
      isExpanded: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    // The filter bar content (now a standard widget)
    return Padding(
      // Only keep the horizontal padding (50.0) from the original design
      padding: const EdgeInsets.symmetric(horizontal: 50.0), 
      child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
          color: denovoWhite,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15.0,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Filter the Denovo Inventory',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: denovoBlack, 
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: _buildFilterDropdown(
                    'Make', 
                    availableMakes, 
                    _selectedMake, 
                    (newValue) => setState(() => _selectedMake = newValue as String?)
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildFilterDropdown(
                    'Year', 
                    availableYears, 
                    _selectedYear, 
                    (newValue) => setState(() => _selectedYear = newValue as int?)
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildFilterDropdown(
                    'Price Range', 
                    ['<\$50K', '\$50K - \$100K', '>\$100K'], 
                    _selectedPriceRange, 
                    (newValue) => setState(() => _selectedPriceRange = newValue as String?)
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      debugPrint('Filtering...');
                    },
                    icon: const Icon(Icons.tune, size: 24),
                    label: const Text('APPLY FILTERS'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: denovoRed,
                      foregroundColor: denovoWhite,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// --- WIDGET 4: CAR GALLERY GRID (Unchanged) ---
class _BuildCarGalleryGrid extends StatelessWidget {
  const _BuildCarGalleryGrid();

  // Helper to build a single beautiful car card
  Widget _buildCarCard(BuildContext context, CarModel car) {
    // Assuming colors are defined in main.dart
    const Color denovoBlack = Color(0xFF1A1A1A);
    const Color denovoRed = Color(0xFFE31E24);
    const Color denovoYellow = Color(0xFFFFC300);
    const Color denovoWhite = Color(0xFFFFFFFF);

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Car Image
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(car.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      color: denovoRed,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      '${car.year}',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: denovoWhite,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Car Details
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  car.make,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: denovoRed,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  car.name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: denovoBlack,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '\$${car.price.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: denovoYellow,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Placeholder for view details action
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: denovoRed,
                        foregroundColor: denovoWhite,
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        minimumSize: Size.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text('VIEW DETAILS'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 cars per row on web
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
          childAspectRatio: 0.8, // Adjust aspect ratio for card content
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            final CarModel car = allCars[index];
            return _buildCarCard(context, car);
          },
          childCount: allCars.length,
        ),
      ),
    );
  }
}