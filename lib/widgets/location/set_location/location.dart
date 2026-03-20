import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:weatherapp/providers/location_provider.dart';
import 'package:weatherapp/widgets/location/set_location/location_buttons.dart';
import 'package:weatherapp/widgets/location/saved_locations/saved_locations.dart';
import 'package:weatherapp/widgets/location/set_location/location_input.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  final TextEditingController _locationController = TextEditingController();
  bool _showError = false;

  late LocationProvider _locationActions;

  @override
  void initState() {
    super.initState();
    _locationController.addListener(() {
      if (_locationController.text.isNotEmpty) {
        setState(() {
          _showError = false;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _locationActions = context.read<LocationProvider>();
  }

  void _setLocation() {
    if (_locationController.text.isEmpty) {
      setState(() {
        _showError = true;
      });
    } else {
      _locationActions.setLocationFromString(_locationController.text);
    }
  }

  void _clearLocation() {
    _locationActions.setLocationFromString(null);
    _locationController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = context.watch<LocationProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          LocationInput(
            controller: _locationController,
            showError: _showError,
            onSubmitted: (_) => _setLocation(),
          ),
          const SizedBox(height: 12),
          LocationButtons(
            setLocation: _setLocation,
            setLocationFromGps: _locationActions.setLocationFromGps,
            clearLocation: _clearLocation,
          ),
          const SizedBox(height: 16),
          Text(
            locationProvider.location != null
                ? "Current: ${locationProvider.location?.city}, ${locationProvider.location?.state} ${locationProvider.location?.zip}"
                : "No Location Set",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold
            ),
          ),
          const Divider(height: 32),
          const Expanded(
            child: SizedBox(
              width: 500,
              child: SavedLocations()
            ),
          )
        ],
      ),
    );
  }
}