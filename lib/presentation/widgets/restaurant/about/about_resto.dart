import 'package:e_menu_app/core/extensions/_extensions.dart';
import 'package:e_menu_app/core/themes/e_colors.dart';
import 'package:e_menu_app/data/models/restaurant/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

// About section on Restaurant Page
class AboutResto extends StatelessWidget {
  const AboutResto({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Resto Name
              Text(
                restaurant.name,
                style: EColors.black.w700.s20,
              ),
              const SizedBox(height: 10),
              // Resto Description
              Text(restaurant.about, style: EColors.black.w400),
              const SizedBox(height: 10),
              // Resto Phone Number
              Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.phone, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    restaurant.phone,
                    style: EColors.black.w400,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      final Uri phoneLaunchUri = Uri(
                        scheme: 'tel',
                        path: restaurant.phone,
                      );

                      if (!await launchUrl(phoneLaunchUri)) {
                        throw 'Could not launch ${phoneLaunchUri.toString()}';
                      }
                    },
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: EColors.orangeSecondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Call',
                        textAlign: TextAlign.center,
                        style: EColors.white.w700.s12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Resto Email
              Row(
                children: [
                  const SizedBox(width: 10),
                  const Icon(Icons.email, size: 20),
                  const SizedBox(width: 10),
                  Text(
                    restaurant.email,
                    style: EColors.black.w400,
                  ),
                  const Spacer(),
                  // email button
                  InkWell(
                    onTap: () {
                      final Uri emailLaunchUri = Uri(
                        scheme: 'mailto',
                        path: restaurant.email,
                      );

                      launchUrl(emailLaunchUri);
                    },
                    child: Container(
                      width: 70,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        color: EColors.orangeSecondary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Email',
                        textAlign: TextAlign.center,
                        style: EColors.white.w700.s12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          color: EColors.greyBackground,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Maps',
                style: EColors.black.w700.s20,
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: FlutterMap(
                    options: MapOptions(
                      center: LatLng(
                        double.tryParse(restaurant.address.latitude) ?? 0.0,
                        double.tryParse(restaurant.address.longitude) ?? 0.0,
                      ),
                      zoom: 14,
                      interactiveFlags: InteractiveFlag.none,
                    ),
                    nonRotatedChildren: const [
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution('OpenStreetMap contributors'),
                        ],
                      ),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.tryParse(restaurant.address.latitude) ??
                                  0.0,
                              double.tryParse(restaurant.address.longitude) ??
                                  0.0,
                            ),
                            builder: (ctx) => const Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
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
      ],
    );
  }
}
