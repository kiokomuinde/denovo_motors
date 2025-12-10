// lib/common_widgets.dart

import 'package:flutter/material.dart';
import '../main.dart'; // To access denovoRed, denovoBlack, etc.

// --- Helper for Navigation Buttons (Used by both AppBars) ---
Widget _buildNavButton(BuildContext context, String text, String route, bool isActive) {
  return TextButton(
    onPressed: () {
      if (!isActive) {
        // Use pushNamedAndRemoveUntil for Home to clear the stack
        if (route == '/') {
          Navigator.of(context).pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false);
        } else {
          Navigator.pushNamed(context, route);
        }
      }
    },
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

// --- Custom Navbar for SCROLLING PAGES (SliverAppBar for home_page.dart) ---
class CustomSliverAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomSliverAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Logo is wrapped in InkWell to link to home
    final logoWidget = InkWell(
      onTap: () {
        // Navigating home
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Image.asset(
          'images/logo.png',
          height: 40, // Appropriate height for a navbar logo
          width: 150, // Constrain the logo width
          fit: BoxFit.contain,
        ),
      ),
    );

    return SliverAppBar(
      backgroundColor: denovoBlack,
      pinned: true,
      floating: true,
      expandedHeight: 0,
      title: logoWidget,
      actions: <Widget>[
        _buildNavButton(context, 'Home', '/', true), 
        _buildNavButton(context, 'Inventory', '/inventory', false),
        _buildNavButton(context, 'Financing', '/financing', false),
        _buildNavButton(context, 'Contact', '/contact', false),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            }, 
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

// --- Custom Navbar for NON-SCROLLING PAGES (Standard AppBar for inventory_page.dart) ---
class CustomStandardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomStandardAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    // Logo is wrapped in InkWell to link to home
    final logoWidget = InkWell(
      onTap: () {
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Image.asset(
          'images/logo.png',
          height: 40,
          width: 150,
          fit: BoxFit.contain,
        ),
      ),
    );

    // This returns a standard AppBar which is suitable for Scaffold.appBar
    return AppBar(
      backgroundColor: denovoBlack,
      automaticallyImplyLeading: false, 
      title: logoWidget,
      actions: <Widget>[
        _buildNavButton(context, 'Home', '/', false),
        _buildNavButton(context, 'Inventory', '/inventory', true), // Highlighted
        _buildNavButton(context, 'Financing', '/financing', false),
        _buildNavButton(context, 'Contact', '/contact', false),
        const SizedBox(width: 20),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/contact');
            },
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

// --- Footer Helper Widgets (Extracted from home_page.dart) ---

Widget _buildSocialIcon(IconData icon) {
  return Container(
    margin: const EdgeInsets.only(right: 15),
    decoration: BoxDecoration(
      color: denovoRed,
      shape: BoxShape.circle,
    ),
    child: IconButton(
      icon: Icon(icon, color: denovoWhite, size: 20),
      onPressed: () {
        debugPrint('Opening social link for: $icon');
      },
    ),
  );
}

Widget _buildContactItem(BuildContext context, IconData icon, String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Icon(icon, color: denovoYellow, size: 20),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: denovoWhite.withOpacity(0.8),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildFooterLinkColumn(BuildContext context, String title, List<String> links) {
  String getRouteForLink(String link) {
    switch (link) {
      case 'Inventory': return '/inventory';
      case 'About Us': return '/about';
      case 'Financing': return '/financing';
      case 'Careers': return '/careers';
      case 'FAQ': return '/faq';
      case 'Warranty': return '/warranty';
      case 'Service & Parts': return '/service';
      case 'Privacy Policy': return '/privacy';
      default: return '/';
    }
  }

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: denovoWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15),
      ...links.map((link) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, getRouteForLink(link));
          },
          child: Text(
            link,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: denovoWhite.withOpacity(0.7),
              fontSize: 16,
            ),
          ),
        ),
      )).toList(),
    ],
  );
}

// --- Custom Footer (Extracted from home_page.dart) ---
class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: denovoBlack,
      padding: const EdgeInsets.all(50.0),
      child: Column(
        children: <Widget>[
          // FIX: Use Expanded and SizedBox to correctly bound children's width
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceAround, <--- REMOVED
            children: <Widget>[
              // 1. Company Info and Socials (Wrapped in Expanded)
              Expanded(
                flex: 2, 
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Logo wrapped in InkWell to link to home
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
                      },
                      child: Image.asset(
                        'images/logo.png',
                        height: 50,
                        width: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Driving luxury, delivering excellence.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: denovoWhite.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Social Icons
                    Row(
                      children: <Widget>[
                        _buildSocialIcon(Icons.facebook),
                        _buildSocialIcon(Icons.person), // Instagram/Generic
                        _buildSocialIcon(Icons.tiktok), // TikTok/Generic
                        _buildSocialIcon(Icons.calendar_month), // YouTube/Video
                        _buildSocialIcon(Icons.alternate_email), // X/Generic Link
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50), // Spacer
              
              // 2. Links 1 (Wrapped in Expanded)
              Expanded(
                flex: 1,
                child: _buildFooterLinkColumn(context, 'QUICK LINKS', ['Inventory', 'About Us', 'Financing', 'Careers']),
              ),
              const SizedBox(width: 50), // Spacer
              
              // 3. Links 2 (Wrapped in Expanded)
              Expanded(
                flex: 1,
                child: _buildFooterLinkColumn(context, 'SUPPORT', ['FAQ', 'Warranty', 'Service & Parts', 'Privacy Policy']),
              ),
              const SizedBox(width: 50), // Spacer
              
              // 4. Contact (Wrapped in Expanded)
              Expanded(
                flex: 2,
                child: Column(
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
              ),
            ],
          ),
          const Divider(color: Colors.grey, height: 80),
          Text(
            // Use current year placeholder
            '© ${DateTime.now().year} Denovo Motors. All rights reserved. | Built with Flutter.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14),
          ),
        ],
      ),
    );
  }
}