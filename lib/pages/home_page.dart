// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import '../main.dart'; // To access denovoRed, denovoBlack, etc.

// --- DUMMY DATA FOR DEMO ---
class CarModel {
  final String name;
  final String imageUrl;
  final int year;
  final double price;
  final String description;

  CarModel({
    required this.name,
    required this.imageUrl,
    required this.year,
    required this.price,
    required this.description,
  });
}

// Base list of 8 cars
final List<CarModel> baseFeaturedCars = [
  CarModel(
    name: 'Porsche 911 GT3',
    imageUrl: 'https://images.unsplash.com/photo-1552519503-f14d80a1aa74?q=80&w=2940&auto=format&fit=crop',
    year: 2023,
    price: 180500.00,
    description: 'A masterpiece of engineering and speed.',
  ),
  CarModel(
    name: 'BMW M8 Competition',
    imageUrl: 'https://images.unsplash.com/photo-1555543163-955685a7e6e9?q=80&w=2940&auto=format&fit:crop',
    year: 2024,
    price: 135900.00,
    description: 'The pinnacle of luxury and performance.',
  ),
  CarModel(
    name: 'Mercedes-AMG G 63',
    imageUrl: 'https://images.unsplash.com/photo-1627993070494-068b5563969a?q=80&w=2832&auto=format&fit:crop',
    year: 2022,
    price: 179000.00,
    description: 'Iconic design meets off-road capability.',
  ),
  CarModel(
    name: 'Audi R8 Coupe V10',
    imageUrl: 'https://images.unsplash.com/photo-1549463942-e2540d995328?q=80&w=2940&auto=format&fit:crop',
    year: 2023,
    price: 158400.00,
    description: 'Naturally aspirated V10 power and sharp looks.',
  ),
  CarModel(
    name: 'Range Rover Sport',
    imageUrl: 'https://images.unsplash.com/photo-1616781297594-54c30c82f9d7?q=80&w=2940&auto=format&fit:crop',
    year: 2024,
    price: 95000.00,
    description: 'Luxury SUV redefined.',
  ),
  CarModel(
    name: 'Tesla Model S Plaid',
    imageUrl: 'https://images.unsplash.com/photo-1606775586675-b6957a4e8d35?q=80&w=2940&auto=format&fit:crop',
    year: 2023,
    price: 108990.00,
    description: 'Electric performance and futuristic technology.',
  ),
  CarModel(
    name: 'Ford Mustang Shelby GT500',
    imageUrl: 'https://images.unsplash.com/photo-1617477545800-e2604ce22c60?q=80&w=2940&auto=format&fit:crop',
    year: 2022,
    price: 80500.00,
    description: 'American muscle at its finest.',
  ),
  CarModel(
    name: 'Lexus LC 500',
    imageUrl: 'https://images.unsplash.com/photo-1612457814068-d0144f77c3a4?q=80&w=2940&auto=format&fit:crop',
    year: 2024,
    price: 105600.00,
    description: 'Stunning design and a powerful V8 engine.',
  ),
];

// 💡 FEATURED: Extend featuredCars to 18 items by duplicating the base list
final List<CarModel> featuredCars = List.generate(18, (index) {
  final baseCar = baseFeaturedCars[index % baseFeaturedCars.length];
  final iteration = (index ~/ baseFeaturedCars.length); // 0, 0, ... 1, 1, ...

  return CarModel(
    // Add an iteration number to the name to differentiate duplicates
    name: baseCar.name + (index >= 8 ? ' (${index + 1})' : ''), 
    imageUrl: baseCar.imageUrl,
    year: baseCar.year + iteration, // Vary the year slightly
    price: baseCar.price + (index * 1000.0), // Vary the price slightly
    description: baseCar.description,
  );
});

// --- HOMEPAGE START ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. Sliver App Bar
          const _BuildSliverAppBar(),

          // 2. The main body content as a Sliver List
          SliverList(
            delegate: SliverChildListDelegate( 
              <Widget>[
                // 💡 Hero Section
                const _BuildHeroSection(),
                
                const _BuildSearchFilterBar(),

                const SizedBox(height: 60),

                const _BuildSectionHeader(title: 'Featured Inventory', subtitle: 'Explore our top selections.'),
                const SizedBox(height: 20),
                // 💡 FEATURED: Controlled Carousel (18 items, scrolls one-by-one)
                const _BuildFeaturedCarousel(), 

                const SizedBox(height: 80),

                const _BuildSectionHeader(title: 'The Denovo Difference', subtitle: 'Why thousands choose us for their next drive.'),
                const SizedBox(height: 20),
                const _BuildWhyChooseUs(), 

                const SizedBox(height: 80),

                const _BuildSectionHeader(title: 'What Our Drivers Say', subtitle: 'Trusted by car enthusiasts worldwide.'),
                const _BuildTestimonialsCarousel(), 

                const SizedBox(height: 80),

                const _BuildCTABanner(),

                const SizedBox(height: 80),

                const _BuildFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET 1: SLIVER APP BAR ---
class _BuildSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _BuildSliverAppBar();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Widget _buildNavButton(BuildContext context, String text, bool isActive) {
    return TextButton(
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(
          color: isActive ? denovoRed : denovoWhite,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logoWidget = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min, 
        children: <Widget>[
          SizedBox(
            width: 150,
            height: 50,
            child: Center(
              child: Text(
                'DENOVO MOTORS',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: denovoWhite,
                  fontSize: 20,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return SliverAppBar(
      backgroundColor: denovoBlack,
      pinned: true,
      floating: true,
      expandedHeight: 0,
      title: logoWidget,
      actions: <Widget>[
        _buildNavButton(context, 'Home', true),
        _buildNavButton(context, 'Inventory', false),
        _buildNavButton(context, 'Financing', false),
        _buildNavButton(context, 'Contact', false),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: denovoRed,
              minimumSize: const Size(120, 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
            ),
            child: const Text('GET STARTED'),
          ),
        ),
      ],
    );
  }
}

// --- WIDGET: ANIMATED PULSE BUTTON ---
class _PulsingButton extends StatefulWidget {
  const _PulsingButton();

  @override
  State<_PulsingButton> createState() => _PulsingButtonState();
}

class _PulsingButtonState extends State<_PulsingButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.15).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.7, end: 0.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            // Outer pulsing shadow (Red)
            Transform.scale(
              scale: _scaleAnimation.value * 1.5,
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: denovoRed.withOpacity(_opacityAnimation.value),
                ),
              ),
            ),
            // Middle pulsing shadow (Yellow)
            Transform.scale(
              scale: _scaleAnimation.value * 1.25,
              child: Container(
                width: 250,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // Opacity capped at max 0.7 * 1.4 = 0.98
                  color: denovoYellow.withOpacity(_opacityAnimation.value * 1.4),
                ),
              ),
            ),
            // Actual Button
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              label: const Text('EXPLORE INVENTORY'),
              style: ElevatedButton.styleFrom(
                backgroundColor: denovoRed,
                foregroundColor: denovoWhite,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        );
      },
    );
  }
}

// --- WIDGET 2: HERO SECTION (USING LOCAL ASSET IMAGE) ---
class _BuildHeroSection extends StatelessWidget {
  const _BuildHeroSection();

  Widget _buildAnimatedIcon(IconData icon, String label, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: denovoBlack, size: 30),
          ),
          const SizedBox(height: 5),
          Text(label, style: TextStyle(color: denovoWhite, fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // 💡 Local Asset Image
          image: AssetImage('images/hero_image.webp'), 
          fit: BoxFit.cover,
          // Background image is only slightly visible
          opacity: 0.3, 
        ),
      ),
      // Overlay Container to enforce a dark background with red flair
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              denovoBlack, // Solid black at bottom
              denovoBlack.withOpacity(0.95),
              denovoRed.withOpacity(0.2), // Subtle red gradient from top
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'YOUR DREAM DRIVE, DELIVERED.',
                  style: GoogleFonts.montserrat(
                    fontSize: 72,
                    fontWeight: FontWeight.w900,
                    // Title is denovoYellow for maximum visibility and impact
                    color: denovoYellow,
                    height: 1.1,
                    letterSpacing: 2.0,
                    shadows: [
                      Shadow(offset: const Offset(3, 3), blurRadius: 6.0, color: denovoRed.withOpacity(0.5))
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Explore the finest selection of luxury and performance vehicles with Denovo Motors. We Deliver, You Drive!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: 22,
                    // White text is highly visible on the dark background
                    color: denovoWhite.withOpacity(0.95), 
                  ),
                ),
                const SizedBox(height: 40),
                // Pulsing Button
                const _PulsingButton(),
                const SizedBox(height: 60),

                // Sub-Header with Car Icons
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  decoration: BoxDecoration(
                    color: denovoBlack.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: denovoRed, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAnimatedIcon(Icons.directions_car, 'Sports', denovoRed),
                      _buildAnimatedIcon(Icons.precision_manufacturing, 'Luxury', denovoYellow),
                      _buildAnimatedIcon(Icons.electric_car, 'Electric', denovoRed),
                      _buildAnimatedIcon(Icons.sports_motorsports, 'SUV', denovoYellow),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- WIDGET 3: SEARCH FILTER BAR ---
class _BuildSearchFilterBar extends StatelessWidget {
  const _BuildSearchFilterBar();

  Widget _buildFilterDropdown(BuildContext context, String hint, List<String> options) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: denovoWhite, 
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(color: denovoBlack)),
        );
      }).toList(),
      onChanged: (String? newValue) {
        // Handle selection
      },
      style: const TextStyle(color: denovoBlack), 
      iconEnabledColor: denovoBlack,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 40.0),
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
              'Find Your Perfect Car',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: denovoBlack, 
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: _buildFilterDropdown(context, 'Select Make', ['BMW', 'Porsche', 'Audi', 'Mercedes'])),
                const SizedBox(width: 20),
                Expanded(child: _buildFilterDropdown(context, 'Select Model', ['911', 'M8', 'R8', 'G 63'])),
                const SizedBox(width: 20),
                Expanded(child: _buildFilterDropdown(context, 'Price Range', ['\$50k - \$100k', '\$100k - \$200k', 'Over \$200k'])),
                const SizedBox(width: 20),
                SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    label: const Text('SEARCH'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: denovoYellow,
                      foregroundColor: denovoBlack,
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

// --- WIDGET 4: SECTION HEADER ---
class _BuildSectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const _BuildSectionHeader({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 48,
              fontWeight: FontWeight.w900,
              color: denovoWhite,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: 80,
            height: 4,
            color: denovoRed,
          ),
          const SizedBox(height: 10),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              color: denovoYellow,
            ),
          ),
        ],
      ),
    );
  }
}

// --- 💡 WIDGET 5: FEATURED CAROUSEL (LEFT ALIGNMENT & FULL SCROLL FIX) ---
class _BuildFeaturedCarousel extends StatefulWidget {
  const _BuildFeaturedCarousel();

  @override
  State<_BuildFeaturedCarousel> createState() => _BuildFeaturedCarouselState();
}

class _BuildFeaturedCarouselState extends State<_BuildFeaturedCarousel> {
  // Constants for the carousel
  final int _totalCars = featuredCars.length; // 18 items
  final int _cardsPerPage = 4;
  final double _viewportFraction = 1 / 4.0; // Show 4 cards at once
  late final int _totalPages = (_totalCars / _cardsPerPage).ceil();

  // Initialize PageController with the desired viewport fraction
  final PageController _pageController = PageController(viewportFraction: 1 / 4.0);
  int _currentCarIndex = 0; 
  // 💡 NEW: Track if the page controller has been initialized and offset applied
  bool _isInitialized = false; 

  // The fixed left and right padding for the entire content area
  static const double _horizontalPadding = 50.0;
  // The small horizontal space between cards
  static const double _cardSpacing = 5.0;

  @override
  void initState() {
    super.initState();
    
    // Listen to page changes
    _pageController.addListener(_updateCurrentIndex);
    
    // FIX 1: Initial Left Alignment
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeScrollOffset();
    });
  }
  
  void _updateCurrentIndex() {
    if (_pageController.hasClients && _pageController.page != null) {
      int next = _pageController.page!.round();
      if (_currentCarIndex != next) {
        setState(() {
          _currentCarIndex = next;
        });
      }
    }
  }

  void _initializeScrollOffset() {
    if (_pageController.hasClients && _pageController.position.hasContentDimensions && !_isInitialized) {
      final double viewportWidth = _pageController.position.viewportDimension;
      
      // Calculate the centering offset in pixels: 
      // PageView centers the item. Offset is the space on the left and right of the first item.
      final double centeringOffset = (viewportWidth * (1 - _viewportFraction)) / 2;
      
      // We want the left edge of the first card to be at `_horizontalPadding`.
      // The required initial scroll offset is: -(Centering Offset) + Desired Margin
      final double initialScrollOffset = -centeringOffset + _horizontalPadding;

      // Jump to the calculated pixel offset.
      _pageController.jumpTo(initialScrollOffset);
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentIndex);
    _pageController.dispose();
    super.dispose();
  }

  // --- Helper to build a single car card ---
  Widget _buildCarCard(BuildContext context, CarModel car) {
    return Container(
      // We rely on PageView to size this correctly based on viewportFraction
      decoration: BoxDecoration(
        color: denovoBlack,
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: denovoRed.withOpacity(0.2), width: 1.0),
        boxShadow: const [
          BoxShadow(color: denovoBlack, blurRadius: 10.0, offset: Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
              child: Image.network(
                car.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[800],
                  child: const Center(
                    child: Icon(Icons.directions_car, size: 80, color: denovoWhite),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${car.year} | ${car.name}',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: denovoWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    car.description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
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
                        onPressed: () {},
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
          ),
        ],
      ),
    );
  }

  // --- Helper to build the Arrow Controls ---
  Widget _buildArrowButton(bool isNext) {
    // FIX 2: Correct max scrollable index calculation.
    // The maximum index we can scroll to and see all 4 cards is 18 - 4 = 14.
    final int maxScrollableIndex = _totalCars - _cardsPerPage;

    // Disable if current index is at the start (0) or at the max scrollable index (14)
    bool isDisabled = isNext ? _currentCarIndex >= maxScrollableIndex : _currentCarIndex <= 0;

    return Align(
      alignment: isNext ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        // Place the buttons inside the 50px boundary
        padding: EdgeInsets.only(
          left: isNext ? 0.0 : _horizontalPadding + 10.0, 
          right: isNext ? _horizontalPadding + 10.0 : 0.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isDisabled ? denovoBlack.withOpacity(0.5) : denovoRed,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: denovoBlack.withOpacity(0.5),
                blurRadius: 10,
              )
            ]
          ),
          child: IconButton(
            icon: Icon(isNext ? Icons.arrow_forward_ios : Icons.arrow_back_ios, color: denovoWhite, size: 24),
            onPressed: isDisabled 
                ? null 
                : () {
                    // Prevent scrolling past the last valid index (14)
                    if (isNext && _currentCarIndex >= maxScrollableIndex) return;

                    _pageController.animateToPage(
                      isNext ? _currentCarIndex + 1 : _currentCarIndex - 1, 
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
            color: denovoWhite,
            disabledColor: denovoWhite.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  // --- Helper to build the Dot Indicators (Grouped for better UX) ---
  Widget _buildDotIndicators() {
    // Calculate which group the currently visible car belongs to
    // Use the minimum of current index and max scroll index to prevent overflow
    final int safeIndex = _currentCarIndex.clamp(0, _totalCars - 1);
    final int activeGroupIndex = (safeIndex / _cardsPerPage).floor();

    return Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_totalPages, (index) {
          // Determine if this dot represents the currently visible group
          bool isActive = index == activeGroupIndex;
          
          return GestureDetector(
            onTap: () {
              // Clicking a dot jumps to the start of that group
              _pageController.animateToPage(
                index * _cardsPerPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              height: 10.0,
              width: isActive ? 25.0 : 10.0,
              decoration: BoxDecoration(
                color: isActive ? denovoRed : denovoWhite.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 💡 Must call initialization function here if we didn't do it in initState, 
    // or if the screen size changes. Using a simple flag to prevent repeating 
    // the jumpTo on every build if not needed.
    if (!_isInitialized) {
      _initializeScrollOffset();
    }
    
    return SizedBox(
      height: 450, // Fixed height for the carousel
      child: Stack( 
        alignment: Alignment.center,
        children: [
          // 1. The main content (Page View)
          PageView.builder(
            controller: _pageController,
            itemCount: _totalCars, // Total number of cars (18)
            itemBuilder: (context, index) {
              final CarModel car = featuredCars[index];
              
              // Padding inside the page to create the gap between cards
              Widget card = Padding(
                padding: const EdgeInsets.symmetric(horizontal: _cardSpacing), 
                child: _buildCarCard(context, car),
              );

              // 💡 FIX 3: Apply the necessary extra padding to the very last card
              // This pushes the last card further left so it aligns with the right margin
              // when the PageView reaches the end of its scroll.
              if (index == _totalCars - 1) {
                // Calculate the amount of space that needs to be added to the right of the last card:
                // This space should be equal to the left padding (50px) minus the gap (5px)
                const double extraEndPadding = _horizontalPadding - _cardSpacing; 
                
                return Padding(
                  padding: const EdgeInsets.only(right: extraEndPadding),
                  child: card,
                );
              }
              return card;
            },
          ),

          // 2. Arrow Controls (placed relative to the full SizedBox width)
          _buildArrowButton(false), // Left Arrow
          _buildArrowButton(true), // Right Arrow

          // 3. Dot Indicators
          _buildDotIndicators(),
        ],
      ),
    );
  }
}

// --- WIDGET 6: WHY CHOOSE US ---
class _BuildWhyChooseUs extends StatelessWidget {
  const _BuildWhyChooseUs();

  final List<Map<String, Object>> features = const [
    {'icon': Icons.security, 'title': 'Certified Quality', 'subtitle': 'Rigorous 150-point inspection.'},
    {'icon': Icons.local_shipping, 'title': 'Nationwide Delivery', 'subtitle': 'We Deliver, You Drive! Doorstep service.'},
    {'icon': Icons.attach_money, 'title': 'Transparent Pricing', 'subtitle': 'No hidden fees, just great value.'},
    {'icon': Icons.support_agent, 'title': '24/7 Support', 'subtitle': 'Expert assistance whenever you need it.'},
  ];

  Widget _buildFeatureBox(BuildContext context, IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: denovoBlack.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: denovoRed.withOpacity(0.5)),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 8.0, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: denovoYellow,
            size: 50.0,
            shadows: [
              Shadow(color: denovoRed.withOpacity(0.5), blurRadius: 10.0)
            ],
          ),
          const SizedBox(height: 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: denovoWhite,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 40.0,
          mainAxisSpacing: 40.0,
          childAspectRatio: 1.0,
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return _buildFeatureBox(
            context, 
            feature['icon'] as IconData, 
            feature['title'] as String, 
            feature['subtitle'] as String
          );
        },
      ),
    );
  }
}

// --- WIDGET 7: TESTIMONIALS CAROUSEL ---
class _BuildTestimonialsCarousel extends StatelessWidget {
  const _BuildTestimonialsCarousel();

  final List<Map<String, String>> testimonials = const [
    {'quote': 'The process was seamless and the delivery was on time. Denovo Motors found my exact dream car!', 'name': 'Alex R.'},
    {'quote': 'Transparency in pricing is what sold me. Highly recommend for any luxury car purchase.', 'name': 'Sarah K.'},
    {'quote': 'Fantastic customer service and a genuinely certified vehicle. Will buy my next car here.', 'name': 'Michael D.'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: testimonials.length,
        itemBuilder: (context, index) {
          final review = testimonials[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(40.0),
                decoration: BoxDecoration(
                  color: denovoBlack.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: denovoYellow.withOpacity(0.3)),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Icon(Icons.format_quote, color: denovoRed, size: 50),
                    const SizedBox(height: 20),
                    Text(
                      review['quote']!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: denovoWhite,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      '- ${review['name']}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: denovoYellow,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- WIDGET 8: CTA BANNER ---
class _BuildCTABanner extends StatelessWidget {
  const _BuildCTABanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60.0, horizontal: 50.0),
      decoration: BoxDecoration(
        color: denovoRed.withOpacity(0.9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'READY TO DRIVE AWAY?',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: denovoWhite,
                    fontSize: 42,
                    letterSpacing: 1.0,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Get in touch with our financing and sales team today for a custom quote.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: denovoWhite.withOpacity(0.8),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.phone),
            label: const Text('CONTACT SALES'),
            style: ElevatedButton.styleFrom(
              backgroundColor: denovoYellow,
              foregroundColor: denovoBlack,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET 9: FOOTER ---
class _BuildFooter extends StatelessWidget {
  const _BuildFooter();

  Widget _buildFooterLinkColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: denovoWhite,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 15),
        ...links.map((link) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {},
            child: Text(
              link,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: CircleAvatar(
        radius: 18,
        backgroundColor: denovoRed,
        child: Icon(icon, color: denovoWhite, size: 20),
      ),
    );
  }

  Widget _buildContactItem(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: denovoYellow, size: 20),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: denovoBlack,
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'DENOVO MOTORS',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: denovoRed,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'We Deliver, You Drive!',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: denovoYellow,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      _buildSocialIcon(Icons.facebook),
                      _buildSocialIcon(Icons.camera_alt),
                      _buildSocialIcon(Icons.search),
                    ],
                  ),
                ],
              ),
              _buildFooterLinkColumn(context, 'QUICK LINKS', ['Inventory', 'About Us', 'Financing', 'Careers']),
              _buildFooterLinkColumn(context, 'SUPPORT', ['FAQ', 'Warranty', 'Service & Parts', 'Privacy Policy']),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'CONTACT US',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: denovoWhite,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 15),
                  _buildContactItem(context, Icons.location_on, '123 Denovo Ave, Luxury City, 10010'),
                  _buildContactItem(context, Icons.phone, '+1 (555) 123-4567'),
                  _buildContactItem(context, Icons.mail, 'info@denovomotors.com'),
                ],
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 80),
          Text(
            '© ${DateTime.now().year} Denovo Motors. All rights reserved. | Built with Flutter.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}