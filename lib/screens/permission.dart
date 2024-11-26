import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionRequestScreen extends StatelessWidget {
  const PermissionRequestScreen({super.key});

  // Fungsi untuk meminta izin lokasi
  Future<void> _requestLocationPermission() async {
    PermissionStatus locationStatus = await Permission.location.request();

    if (locationStatus.isGranted) {
      print('Location permission granted');
    } else {
      print('Location permission denied');
    }
  }

  // Fungsi untuk meminta izin penyimpanan
  Future<void> _requestStoragePermission() async {
    PermissionStatus storageStatus = await Permission.storage.request();

    if (storageStatus.isGranted) {
      print('Storage permission granted');
    } else {
      print('Storage permission denied');
    }
  }

  // Fungsi untuk meminta izin mikrofon
  Future<void> _requestMicrophonePermission() async {
    PermissionStatus microphoneStatus = await Permission.microphone.request();

    if (microphoneStatus.isGranted) {
      print('Microphone permission granted');
    } else {
      print('Microphone permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _requestLocationPermission,
              child: const Text('Request Location Permission'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestStoragePermission,
              child: const Text('Request Storage Permission'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _requestMicrophonePermission,
              child: const Text('Request Microphone Permission'),
            ),
          ],
        ),
      ),
    );
  }
}
