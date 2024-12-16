import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:location/location.dart';
import 'package:google_maps_webservice/places.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  GoogleMapController? mapController;
  LatLng _initialPosition = LatLng(30.0444, 31.2357); // Default location: Cairo, Egypt
  LatLng? _pickedLocation;
  TextEditingController _searchController = TextEditingController();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onCameraMove(CameraPosition position) {
    _pickedLocation = position.target;
  }

  Future<void> _searchAndNavigate() async {
    final places = GoogleMapsPlaces(apiKey: '3e987d3f755de110c00c329aab5252c941ce7ed2');
    final response = await places.searchByText(_searchController.text);

    if (response.results.isNotEmpty) {
      final result = response.results.first;
      final location = result.geometry!.location;

      final position = LatLng(location.lat, location.lng);
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: position, zoom: 15.0),
      ));

      setState(() {
        _pickedLocation = position;
      });
    }
  }

  void _saveLocation() {
    Navigator.pop(context, _pickedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Location'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: _searchAndNavigate,
          ),
        ],
      ),
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search location',
              suffixIcon: IconButton(
                icon: Icon(Icons.search),
                onPressed: _searchAndNavigate,
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _initialPosition,
                zoom: 10.0,
              ),
              onCameraMove: _onCameraMove,
            ),
          ),
          ElevatedButton(
            onPressed: _saveLocation,
            child: Text('Save Location'),
          ),
        ],
      ),
    );
  }
}
