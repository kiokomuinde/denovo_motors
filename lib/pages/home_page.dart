// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; 
import 'dart:async'; // Required for the automatic carousel Timer
import '../main.dart'; // To access denovoRed, denovoBlack, etc.
import '../common_widgets.dart'; // <-- NEW IMPORT for Navbar and Footer

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

// ✅ UPDATED: All imageUrls now use local asset paths: images/car1.webp to images/car18.webp
final List<CarModel> baseFeaturedCars = [
  // --- Requested Brands (Toyota, Range Rover, Mazda, Nissan, Porsche, Lexus, Subaru) ---

  // 1. Toyota
  CarModel(
    name: 'Toyota GR Supra',
    imageUrl: 'images/car1.webp', // Local Asset: car1.webp
    year: 2023,
    price: 54900.00,
    description: 'The return of the legendary Japanese sports coupe.',
  ),
  // 2. Toyota
  CarModel(
    name: 'Toyota Land Cruiser 300',
    imageUrl: 'images/car2.webp', // Local Asset: car2.webp
    year: 2024,
    price: 88500.00,
    description: 'Unmatched off-road capability and luxury.',
  ),
  // 3. Range Rover
  CarModel(
    name: 'Range Rover Sport SVR',
    imageUrl: 'images/car3.webp', // Local Asset: car3.webp
    year: 2023,
    price: 130000.00,
    description: 'High-performance luxury SUV with a supercharged engine.',
  ),
  // 4. Mazda
  CarModel(
    name: 'Mazda MX-5 Miata RF',
    imageUrl: 'images/car4.webp', // Local Asset: car4.webp
    year: 2024,
    price: 36000.00,
    description: 'The definitive lightweight roadster experience.',
  ),
  // 5. Nissan
  CarModel(
    name: 'Nissan GT-R Nismo',
    imageUrl: 'images/car5.webp', // Local Asset: car5.webp
    year: 2022,
    price: 210000.00,
    description: 'Godzilla: track-focused supercar performance.',
  ),
  // 6. Porsche
  CarModel(
    name: 'Porsche 911 Carrera S',
    imageUrl: 'images/car6.webp', // Local Asset: car6.webp
    year: 2023,
    price: 125000.00,
    description: 'The timeless German sports car icon.',
  ),
  // 7. Porsche
  CarModel(
    name: 'Porsche Taycan Turbo S',
    imageUrl: 'images/car7.webp', // Local Asset: car7.webp
    year: 2024,
    price: 195000.00,
    description: 'Electric power meets Porsche precision.',
  ),
  // 8. Lexus
  CarModel(
    name: 'Lexus LC 500 Convertible',
    imageUrl: 'images/car8.webp', // Local Asset: car8.webp
    year: 2024,
    price: 115000.00,
    description: 'Open-air luxury with a powerful naturally aspirated V8.',
  ),
  // 9. Lexus
  CarModel(
    name: 'Lexus RC F Track Edition',
    imageUrl: 'images/car9.webp', // Local Asset: car9.webp
    year: 2022,
    price: 98000.00,
    description: 'Track-ready performance in a stylish coupe.',
  ),
  // 10. Subaru
  CarModel(
    name: 'Subaru WRX STI S209',
    imageUrl: 'images/car10.webp', // Local Asset: car10.webp
    year: 2021,
    price: 65000.00,
    description: 'Limited edition rally heritage with aggressive styling.',
  ),
  // 11. Subaru
  CarModel(
    name: 'Subaru BRZ Premium',
    imageUrl: 'images/car11.webp', // Local Asset: car11.webp
    year: 2024,
    price: 32000.00,
    description: 'Pure, balanced, and fun-to-drive coupe.',
  ),

  // --- Other High-Demand Brands ---

  // 12. Mercedes-Benz
  CarModel(
    name: 'Mercedes-AMG GT Black Series',
    imageUrl: 'images/car12.webp', // Local Asset: car12.webp
    year: 2021,
    price: 325000.00,
    description: 'A true race car for the road.',
  ),
  // 13. BMW
  CarModel(
    name: 'BMW M3 Competition',
    imageUrl: 'images/car13.webp', // Local Asset: car13.webp
    year: 2024,
    price: 85000.00,
    description: 'Iconic sedan blending track performance and daily driveability.',
  ),
  // 14. Audi
  CarModel(
    name: 'Audi RS 7 Sportback',
    imageUrl: 'images/car14.webp', // Local Asset: car14.webp
    year: 2023,
    price: 128000.00,
    description: 'Coupe styling with incredible power and utility.',
  ),
  // 15. Ford
  CarModel(
    name: 'Ford Bronco Raptor',
    imageUrl: 'images/car15.webp', // Local Asset: car15.webp
    year: 2024,
    price: 75000.00,
    description: 'Extreme off-road performance and rugged design.',
  ),
  // 16. Chevrolet
  CarModel(
    name: 'Chevrolet Corvette Stingray',
    imageUrl: 'images/car16.webp', // Local Asset: car16.webp
    year: 2023,
    price: 70000.00,
    description: 'Mid-engine revolutionizing American performance.',
  ),
  // 17. Volvo
  CarModel(
    name: 'Volvo Polestar 1',
    imageUrl: 'images/car17.webp', // Local Asset: car17.webp
    year: 2021,
    price: 155000.00,
    description: 'A luxurious and powerful electric hybrid coupe.',
  ),
  // 18. Alfa Romeo
  CarModel(
    name: 'Alfa Romeo Giulia Quadrifoglio',
    imageUrl: 'images/car18.webp', // Local Asset: car18.webp
    year: 2024,
    price: 82000.00,
    description: 'Italian flair with a Ferrari-derived twin-turbo V6.',
  ),
];

// The featuredCars list now only contains the 18 unique cars.
final List<CarModel> featuredCars = baseFeaturedCars;

// --- HOMEPAGE START ---

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          // 1. Sliver App Bar (NOW USING THE SHARED WIDGET)
          const CustomSliverAppBar(), // <-- Updated from _BuildSliverAppBar

          // 2. The main body content as a Sliver List
          SliverList(
            delegate: SliverChildListDelegate( 
              <Widget>[
                // Hero Section
                const _BuildHeroSection(),
                
                const _BuildSearchFilterBar(),

                const SizedBox(height: 60),

                // 🌟 UPDATE: Title and Subtitle changed to 'Curated Vehicle Portfolio'
                _BuildSectionHeaderWithButton( // Not const
                  title: 'Curated Vehicle Portfolio', 
                  subtitle: 'A hand-selected collection of the world\'s finest vehicles.',
                  buttonText: 'EXPLORE ALL VEHICLES',
                  // Action to navigate to inventory
                  action: () => Navigator.pushNamed(context, '/inventory'), 
                ),
                // END REPLACEMENT

                const SizedBox(height: 20),
                // FEATURED: Controlled Carousel (Now 18 unique items)
                const _BuildFeaturedCarousel(), 

                const SizedBox(height: 80),

                const _BuildSectionHeader(title: 'The Denovo Difference', subtitle: 'Why thousands choose us for their next drive.'),
                const SizedBox(height: 20),
                const _BuildWhyChooseUs(), 

                const SizedBox(height: 80),

                const _BuildSectionHeader(title: 'What Our Drivers Say', subtitle: 'Trusted by car enthusiasts worldwide.'),
                // Testimonials Carousel is now Stateful and Auto-Swiping
                const _BuildTestimonialsCarousel(), 

                const SizedBox(height: 80),

                // FIX: Removed const keyword
                const _BuildCTABanner(), 

                const SizedBox(height: 80),

                const CustomFooter(), // <-- Updated from _BuildFooter
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// NOTE: The following widgets (like _PulsingButton, _BuildHeroSection, _BuildSearchFilterBar,
// etc.) remain in this file as they are specific to the Home Page content.

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
              // FIX 6 APPLIED: Navigate to the Inventory page
              onPressed: () {
                Navigator.pushNamed(context, '/inventory');
              },
              icon: const Icon(Icons.arrow_forward),
              // Use 'EXPLORE INVENTORY' here as a high-level action
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
          // Local Asset Image
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
                // 1. UPDATED ORDER: Main Title Text (Now at the top)
                Text(
                  'WE DELIVER, YOU DRIVE!',
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
                // 2. UPDATED ORDER: New Subtitle Text (Now below the title)
                Text(
                  'Explore the finest selection of luxury and performance vehicles.',
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
            // ✅ Title is 'Find Your Perfect Vehicle'
            Text(
              'Find Your Perfect Vehicle',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: denovoBlack, 
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(child: _buildFilterDropdown(context, 'Select Make', ['Toyota', 'Porsche', 'Range Rover', 'Nissan'])),
                const SizedBox(width: 20),
                Expanded(child: _buildFilterDropdown(context, 'Select Model', ['Supra', '911', 'SVR', 'GT-R'])),
                const SizedBox(width: 20),
                Expanded(child: _buildFilterDropdown(context, 'Price Range', ['\$30k - \$80k', '\$80k - \$150k', 'Over \$150k'])),
                const SizedBox(width: 20),
                SizedBox(
                  height: 60,
                  child: ElevatedButton.icon(
                    // FIX 7 APPLIED: Add a placeholder action
                    onPressed: () {
                      debugPrint('Executing search filters...');
                    },
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

// --- WIDGET 4: SECTION HEADER (WITHOUT BUTTON) ---
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

// --- WIDGET: SECTION HEADER WITH BUTTON ---
class _BuildSectionHeaderWithButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  // The action parameter is NOT const
  final VoidCallback? action; // Optional callback for the button
  
  const _BuildSectionHeaderWithButton({ 
    super.key, // Added super.key for consistency
    required this.title, 
    required this.subtitle, 
    required this.buttonText, 
    this.action, 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          // Left Side: Title and Subtitle
          Column(
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
          // Right Side: Button
          SizedBox(
            height: 45, // Match the height of the button in the Sliver AppBar
            child: ElevatedButton.icon(
              onPressed: action,
              icon: const Icon(Icons.arrow_forward_ios, size: 18),
              label: Text(buttonText),
              style: ElevatedButton.styleFrom(
                backgroundColor: denovoRed,
                foregroundColor: denovoWhite,
                textStyle: const TextStyle(fontSize: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: denovoRed.withOpacity(0.5), width: 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET 5: FEATURED CAROUSEL (LEFT ALIGNMENT & FULL SCROLL FIX) ---
class _BuildFeaturedCarousel extends StatefulWidget {
  const _BuildFeaturedCarousel();

  @override
  State<_BuildFeaturedCarousel> createState() => _BuildFeaturedCarouselState();
}

class _BuildFeaturedCarouselState extends State<_BuildFeaturedCarousel> {
  // Constants for the carousel
  final int _totalCars = featuredCars.length;
  final int _cardsPerPage = 4;
  // The viewportFraction is crucial for controlling how many cards are visible
  final double _viewportFraction = 1 / 4.0; // Show 4 cards at once
  // 18 cars / 4 cards per page = 4.5, ceiling is 5 total pages
  late final int _totalPages = (_totalCars / _cardsPerPage).ceil();

  // Initialize PageController with the desired viewport fraction
  final PageController _pageController = PageController(viewportFraction: 1 / 4.0);
  int _currentCarIndex = 0;

  // Track if the page controller has been initialized and offset applied
  bool _isInitialized = false;

  // The fixed left and right padding for the entire content area
  static const double _horizontalPadding = 50.0;
  // The small horizontal space between cards
  // static const double _cardSpacing = 5.0; // Unused variable

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
      // (Total Viewport Width * (1 - viewportFraction)) / 2 = Centering offset for a centered page
      // To left-align: we need to scroll by this amount PLUS the horizontal padding.
      final double centeringOffset = (viewportWidth * (1 - _viewportFraction)) / 2;

      // The final scroll position to simulate left-alignment is the negative of the centering offset,
      // plus the actual page padding we want (50.0)
      final double targetOffset = centeringOffset + _horizontalPadding;

      // Scroll to the calculated offset
      _pageController.jumpTo(targetOffset);

      // We must set the flag so this only runs once and not on every rebuild
      _isInitialized = true;
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_updateCurrentIndex);
    _pageController.dispose();
    super.dispose();
  }

  // Helper to build a single beautiful car card
  Widget _buildCarCard(BuildContext context, CarModel car) {
    // FIX 10 APPLIED: Swapped denovoWhite and denovoBlack to improve contrast in the card title/body
    return Padding(
      padding: const EdgeInsets.only(right: 20.0), // Space between cards
      child: Container(
        width: 350, // Fixed width for card
        decoration: BoxDecoration(
          color: denovoBlack,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(color: denovoRed.withOpacity(0.5), width: 1.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Car Image
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
                // ✅ UPDATED: Switched from Image.network to Image.asset
                child: Image.asset(
                  car.imageUrl, // Now using local asset path
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200, 
                  // Removed loadingBuilder and errorBuilder for network image
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
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
                          // FIX 11 APPLIED: Add navigation for View Details button
                          onPressed: () {
                            Navigator.pushNamed(context, '/inventory');
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
            ),
          ],
        ),
      ),
    );
  }

  // Helper to build the Dot Indicators (Grouped for better UX)
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
        // The number of dots is 5 for 18 items (4 per page)
        children: List.generate(_totalPages, (index) {
          // Determine if this dot represents the currently visible group
          bool isActive = index == activeGroupIndex;
          
          return GestureDetector(
            onTap: () {
              // Clicking a dot jumps to the start of that group
              _pageController.animateToPage(
                // Ensure we don't jump past the max scrollable index (14)
                (index * _cardsPerPage).clamp(0, _totalCars - _cardsPerPage),
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

  // Helper to build the Arrow Controls
  Widget _buildArrowButton(bool isRight) {
    return Positioned(
      left: isRight ? null : _horizontalPadding - 30, // Adjusted for padding
      right: isRight ? _horizontalPadding - 30 : null, // Adjusted for padding
      child: Container(
        decoration: BoxDecoration(
          color: denovoBlack.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(
            isRight ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
            color: denovoWhite,
          ),
          onPressed: () {
            // FIX 12 APPLIED: Use pageController.jumpToPage to control navigation
            int targetPage = isRight
                ? (_currentCarIndex + _cardsPerPage).clamp(0, _totalCars - _cardsPerPage)
                : (_currentCarIndex - _cardsPerPage).clamp(0, 0);

            // Animate to the target page index (which represents the first card of that group)
            _pageController.animateToPage(
              targetPage,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Must call initialization function here if we didn't do it in initState,
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
            itemCount: _totalCars,
            itemBuilder: (context, index) {
              return _buildCarCard(context, featuredCars[index]);
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
          crossAxisSpacing: 30.0,
          mainAxisSpacing: 30.0,
          childAspectRatio: 1.0, // Ensure boxes are roughly square
        ),
        itemCount: features.length,
        itemBuilder: (context, index) {
          final feature = features[index];
          return _buildFeatureBox(context, feature['icon'] as IconData, feature['title'] as String, feature['subtitle'] as String);
        },
      ),
    );
  }
}

// --- WIDGET 7: TESTIMONIALS CAROUSEL (FIXED SYNTAX ERRORS) ---
class _BuildTestimonialsCarousel extends StatefulWidget {
  const _BuildTestimonialsCarousel();

  @override
  State<_BuildTestimonialsCarousel> createState() => _BuildTestimonialsCarouselState();
}

class _BuildTestimonialsCarouselState extends State<_BuildTestimonialsCarousel> {
  final List<Map<String, String>> _testimonials = const [
    {'quote': 'The entire process was seamless and professional. Denovo made the experience safe, easy, and completely trustworthy.', 'name': 'Jessica L.'},
    {'quote': 'The financing options were excellent and the 24/7 support answered all my technical questions instantly.', 'name': 'David W.'},
    {'quote': 'The quality control on their vehicles is unmatched. It felt brand new, not just used.', 'name': 'Chris P.'},
    {'quote': 'Absolutely loved the door-to-door delivery service. It saved me so much time!', 'name': 'Emily H.'},
    {'quote': 'Best inventory selection I have ever seen. Found a rare model immediately.', 'name': 'Robert B.'},
    {'quote': 'Five stars for the smooth paperwork and quick turnaround. Driving my new vehicle today!', 'name': 'Laura T.'},
  ];

  final PageController _pageController = PageController();
  late Timer _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // Start auto-swiping every 5 seconds
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_pageController.hasClients) {
        // Get the current page and calculate the next one, wrapping around to the start
        _currentPage = _pageController.page!.round();
        int nextPage = (_currentPage + 1) % _testimonials.length;
        
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
    });

    // Listen to user swipes to update the dot indicators
    _pageController.addListener(() {
      if (_pageController.page != null && _pageController.page!.round() != _currentPage) {
        setState(() {
          _currentPage = _pageController.page!.round();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel(); // Must cancel the timer to prevent memory leaks
    _pageController.dispose();
    super.dispose();
  }

  // Helper to build the Dot Indicators
  Widget _buildDotIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_testimonials.length, (index) {
        bool isActive = index == _currentPage;
        return GestureDetector(
          onTap: () {
            // Allows user to tap a dot to jump to that testimonial
            _pageController.animateToPage(
              index,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // Fixed height for the carousel
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _testimonials.length,
            itemBuilder: (context, index) {
              final review = _testimonials[index];
              return Center(
                child: Container(
                  width: 800, // Constrain the testimonial card width
                  padding: const EdgeInsets.all(40.0),
                  margin: const EdgeInsets.symmetric(horizontal: 50.0),
                  decoration: BoxDecoration(
                    color: denovoBlack.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(color: denovoYellow, width: 2),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Icon(Icons.format_quote, color: denovoRed, size: 50),
                      const SizedBox(height: 20),
                      // FIX: Corrected Text widget constructor syntax
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
              );
            },
          ),
          // Dot Indicators placed at the bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: _buildDotIndicators(),
          ),
        ],
      ),
    );
  }
}

// --- WIDGET 8: CTA BANNER (REMOVED CONST) ---
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
            // FIX 13 APPLIED: Added navigation for the CTA button
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
            icon: const Icon(Icons.phone),
            label: const Text('CONTACT SALES'),
            style: ElevatedButton.styleFrom(
              backgroundColor: denovoYellow,
              foregroundColor: denovoBlack,
              minimumSize: const Size(200, 60),
              textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }
}