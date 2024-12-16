
import 'dart:io';
import 'package:dawak_24/Feature/uploading_Prescription/ui/widgets/location_picker_screen.dart';
import 'package:dawak_24/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class UploadPrescriptionScreen extends StatefulWidget {
  @override
  _UploadPrescriptionScreenState createState() => _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  LocationData? _location;
  String? _address;
  int _currentStep = 0;
  

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);
    setState(() {
      _image = pickedFile;
    });
  }

  Future<void> _getLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final loc = await location.getLocation();
    setState(() {
      _location = loc;
      _getAddressFromLatLng();
    });
  }

  Future<void> _getAddressFromLatLng() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _location!.latitude!,
        _location!.longitude!,
      );

      Placemark place = placemarks[0];
      setState(() {
        _address = "${place.street}, ${place.locality}, ${place.administrativeArea}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Medicine'),
      ),
      body: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep < 2) {
            setState(() {
              _currentStep += 1;
            });
          }
        },
        onStepCancel: () {
          if (_currentStep > 0) {
            setState(() {
              _currentStep -= 1;
            });
          }
        },
        steps: [
          Step(
            title: Text('حدد موقعك'),
            content: Column(
              children: [
                ElevatedButton(
          //         onPressed:
          //          (){
          //           Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          // return  LocationPickerScreen();}));
          //          // LocationPickerScreen
          //         },
                 onPressed: _getAddressFromLatLng,
                  child: Text('تحديد الموقع'),
                ),
                // if (_location != null)
                //   Text('Location: ${_location!.latitude}, ${_location!.longitude}'),
                if (_address != null)
                  Text('Address: $_address'),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('تحميل صوره الروشته'),
            content: Column(
              children: [
                ElevatedButton.icon(
                style: 
                ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                ),
                
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('صورة المنتج'),
                ),
                // ElevatedButton.icon(
                //   onPressed: () => _pickImage(ImageSource.gallery),
                //   icon: Icon(Icons.photo),
                //   label: Text('صورة المنتج'),
                // ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo),
                  label: Text('روشتة/موافقة طبية'),
                ),
                if (_image != null)
                  Image.file(File(_image!.path), height: 200),
              ],
            ),
            isActive: _currentStep >= 1,
            state: _currentStep > 1 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('اطلب الآن'),
            content: Column(
              children: [
                if (_location != null)
                  Text('Location: ${_location!.latitude}, ${_location!.longitude}'),
                if (_address != null)
                  Text('Address: $_address'),
                if (_image != null)
                  Image.file(File(_image!.path), height: 200),
              ],
            ),
            isActive: _currentStep >= 2,
            state: _currentStep == 2 ? StepState.complete : StepState.indexed,
          ),
        ],
      ),
    );
  }
}