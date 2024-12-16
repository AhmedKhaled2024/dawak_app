// import 'dart:io';

// import 'package:dawak_24/core/theming/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:location/location.dart';

// class UploadPrescriptionScreen extends StatefulWidget {
//   @override
//   _UploadPrescriptionScreenState createState() => _UploadPrescriptionScreenState();
// }

// class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
//   final ImagePicker _picker = ImagePicker();
//   XFile? _image;
//   LocationData? _location;

//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//     setState(() {
//       _image = pickedFile;
//     });
//   }

//   Future<void> _getLocation() async {
//     Location location = new Location();
//     bool _serviceEnabled;
//     PermissionStatus _permissionGranted;

//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }

//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }

//     final loc = await location.getLocation();
//     setState(() {
//       _location = loc;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading:Builder(
//     builder: (BuildContext context) {
//       return IconButton(
//         icon: const Icon(Icons.menu,color: Colors.white,),
//         onPressed: () { Scaffold.of(context).openDrawer(); },
//         tooltip:

//         MaterialLocalizations.of(context).openAppDrawerTooltip,
//       );
//     },
//   ),


         
//         elevation: 20,
//         backgroundColor: Color(0xff6149F7),
//         centerTitle: true,
//         title: Text('Order Medicine',style: TextStyle(color: Colors.white),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Text('حدد موقعك',style: TextStyles.font13purpleRegular,),
//             ElevatedButton(
//               onPressed: _getLocation,
//               child: Text('تحديد الموقع'),
//             ),
//             if (_location != null)
//               Text('Location: ${_location!.latitude}, ${_location!.longitude}'),
//             SizedBox(height: 25),
//             Text('ما الذي تبحث عنه؟'),
//             ElevatedButton.icon(
//               onPressed: () => _pickImage(ImageSource.camera),
//               icon: Icon(Icons.camera_alt),
//               label: Text('استشير صيدلي'),
//             ),
//             ElevatedButton.icon(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               icon: Icon(Icons.photo),
//               label: Text('صورة المنتج'),
//             ),
//             ElevatedButton.icon(
//               onPressed: () => _pickImage(ImageSource.gallery),
//               icon: Icon(Icons.photo),
//               label: Text('روشتة/موافقة طبية'),
//             ),
//             if (_image != null)
//               Image.file(File(_image!.path), height: 200),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:io';

class UploadPrescriptionScreen extends StatefulWidget {
  @override
  _UploadPrescriptionScreenState createState() => _UploadPrescriptionScreenState();
}

class _UploadPrescriptionScreenState extends State<UploadPrescriptionScreen> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  LocationData? _location;
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading:Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu,color: Colors.white,),
        onPressed: () { Scaffold.of(context).openDrawer(); },
        tooltip:

        MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    },
  ),


         
        elevation: 20,
        backgroundColor: Color(0xff6149F7),
        centerTitle: true,
        title: Text('Order Medicine',style: TextStyle(color: Colors.white),),
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
                  onPressed: _getLocation,
                  child: Text('تحديد الموقع'),
                ),
                if (_location != null)
                  Text('Location: ${_location!.latitude}, ${_location!.longitude}'),
              ],
            ),
            isActive: _currentStep >= 0,
            state: _currentStep > 0 ? StepState.complete : StepState.indexed,
          ),
          Step(
            title: Text('ما الذي تبحث عنه؟'),
            content: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('استشير صيدلي'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo),
                  label: Text('صورة المنتج'),
                ),
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
            title: Text('Confirm Details'),
            content: Column(
              children: [
                if (_location != null)
                  Text('Location: ${_location!.latitude}, ${_location!.longitude}'),
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
