// lib/data/car_data.dart

import 'package:flutter/material.dart';

// --- DUMMY DATA MODEL ---
class CarModel {
  final String name;
  final String imageUrl;
  final int year;
  final double price;
  final String description;
  final String make;
  final String model;

  CarModel({
    required this.name,
    required this.imageUrl,
    required this.year,
    required this.price,
    required this.description,
    required this.make,
    required this.model,
  });
}

// --- FULL INVENTORY DATA (18 CARS) ---
// This list will be used for both the featured section (a subset) and the full inventory page.
final List<CarModel> allCars = [
  // 1. Toyota
  CarModel(
    name: 'Toyota GR Supra',
    imageUrl: 'images/car1.webp',
    year: 2023,
    price: 54900.00,
    description: 'The return of the legendary Japanese sports coupe.',
    make: 'Toyota',
    model: 'Supra',
  ),
  // 2. Toyota
  CarModel(
    name: 'Toyota Land Cruiser 300',
    imageUrl: 'images/car2.webp',
    year: 2024,
    price: 88500.00,
    description: 'Unmatched off-road capability and luxury.',
    make: 'Toyota',
    model: 'Land Cruiser',
  ),
  // 3. Range Rover
  CarModel(
    name: 'Range Rover Sport SVR',
    imageUrl: 'images/car3.webp',
    year: 2023,
    price: 130000.00,
    description: 'High-performance luxury SUV with a supercharged engine.',
    make: 'Range Rover',
    model: 'Sport SVR',
  ),
  // 4. Mazda
  CarModel(
    name: 'Mazda MX-5 Miata RF',
    imageUrl: 'images/car4.webp',
    year: 2024,
    price: 36000.00,
    description: 'The definitive lightweight roadster experience.',
    make: 'Mazda',
    model: 'MX-5 Miata RF',
  ),
  // 5. Nissan
  CarModel(
    name: 'Nissan GT-R Nismo',
    imageUrl: 'images/car5.webp',
    year: 2022,
    price: 210000.00,
    description: 'Godzilla: track-focused supercar performance.',
    make: 'Nissan',
    model: 'GT-R Nismo',
  ),
  // 6. Porsche
  CarModel(
    name: 'Porsche 911 Carrera S',
    imageUrl: 'images/car6.webp',
    year: 2023,
    price: 125000.00,
    description: 'The timeless German sports car icon.',
    make: 'Porsche',
    model: '911 Carrera S',
  ),
  // 7. Porsche
  CarModel(
    name: 'Porsche Taycan Turbo S',
    imageUrl: 'images/car7.webp',
    year: 2024,
    price: 195000.00,
    description: 'Electric power meets Porsche precision.',
    make: 'Porsche',
    model: 'Taycan Turbo S',
  ),
  // 8. Lexus
  CarModel(
    name: 'Lexus LC 500 Convertible',
    imageUrl: 'images/car8.webp',
    year: 2024,
    price: 115000.00,
    description: 'Open-air luxury with a powerful naturally aspirated V8.',
    make: 'Lexus',
    model: 'LC 500 Convertible',
  ),
  // 9. Lexus
  CarModel(
    name: 'Lexus RC F Track Edition',
    imageUrl: 'images/car9.webp',
    year: 2022,
    price: 98000.00,
    description: 'Track-ready performance in a stylish coupe.',
    make: 'Lexus',
    model: 'RC F Track Edition',
  ),
  // 10. Subaru
  CarModel(
    name: 'Subaru WRX STI S209',
    imageUrl: 'images/car10.webp',
    year: 2021,
    price: 65000.00,
    description: 'Limited edition rally heritage with aggressive styling.',
    make: 'Subaru',
    model: 'WRX STI S209',
  ),
  // 11. Subaru
  CarModel(
    name: 'Subaru BRZ Premium',
    imageUrl: 'images/car11.webp',
    year: 2024,
    price: 32000.00,
    description: 'Pure, balanced, and fun-to-drive coupe.',
    make: 'Subaru',
    model: 'BRZ Premium',
  ),

  // 12. Mercedes-Benz
  CarModel(
    name: 'Mercedes-AMG GT Black Series',
    imageUrl: 'images/car12.webp',
    year: 2021,
    price: 325000.00,
    description: 'A true race car for the road.',
    make: 'Mercedes-Benz',
    model: 'AMG GT Black Series',
  ),
  // 13. BMW
  CarModel(
    name: 'BMW M3 Competition',
    imageUrl: 'images/car13.webp',
    year: 2024,
    price: 85000.00,
    description: 'Iconic sedan blending track performance and daily driveability.',
    make: 'BMW',
    model: 'M3 Competition',
  ),
  // 14. Audi
  CarModel(
    name: 'Audi RS 7 Sportback',
    imageUrl: 'images/car14.webp',
    year: 2023,
    price: 128000.00,
    description: 'Coupe styling with incredible power and utility.',
    make: 'Audi',
    model: 'RS 7 Sportback',
  ),
  // 15. Ford
  CarModel(
    name: 'Ford Bronco Raptor',
    imageUrl: 'images/car15.webp',
    year: 2024,
    price: 75000.00,
    description: 'Extreme off-road performance and rugged design.',
    make: 'Ford',
    model: 'Bronco Raptor',
  ),
  // 16. Chevrolet
  CarModel(
    name: 'Chevrolet Corvette Stingray',
    imageUrl: 'images/car16.webp',
    year: 2023,
    price: 70000.00,
    description: 'Mid-engine revolutionizing American performance.',
    make: 'Chevrolet',
    model: 'Corvette Stingray',
  ),
  // 17. Volvo
  CarModel(
    name: 'Volvo Polestar 1',
    imageUrl: 'images/car17.webp',
    year: 2021,
    price: 155000.00,
    description: 'A luxurious and powerful electric hybrid coupe.',
    make: 'Volvo',
    model: 'Polestar 1',
  ),
  // 18. Alfa Romeo
  CarModel(
    name: 'Alfa Romeo Giulia Quadrifoglio',
    imageUrl: 'images/car18.webp',
    year: 2024,
    price: 82000.00,
    description: 'Italian flair with a Ferrari-derived twin-turbo V6.',
    make: 'Alfa Romeo',
    model: 'Giulia Quadrifoglio',
  ),
];

// Helper lists for filtering/dropdowns
final List<String> availableMakes = allCars.map((car) => car.make).toSet().toList()..sort();
final List<int> availableYears = allCars.map((car) => car.year).toSet().toList()..sort((a, b) => b.compareTo(a));