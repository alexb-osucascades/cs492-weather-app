import 'package:flutter/material.dart';
import 'package:weatherapp/widgets/location/set_location/location_button.dart';

class LocationButtons extends StatelessWidget {
  const LocationButtons(
      {super.key,
      required this.setLocation,
      required this.setLocationFromGps,
      required this.clearLocation});

  final void Function() setLocation;
  final void Function() setLocationFromGps;
  final void Function() clearLocation;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8.0,
      runSpacing: 8.0,
      children: [
        LocationButton(
            callbackFunction: setLocation, description: "Search", icon: Icons.search),
        LocationButton(
            callbackFunction: setLocationFromGps, description: "Use GPS", icon: Icons.my_location),
        LocationButton(
            callbackFunction: clearLocation, description: "Clear", icon: Icons.clear),
      ],
    );
  }
}