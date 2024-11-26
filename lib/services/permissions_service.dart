// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  Future<void> requestCameraPermission(BuildContext context) async {
    PermissionStatus status = await Permission.camera.request();

    status.isGranted
        ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Camera Diterima",
              ),
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Camera Ditolak",
              ),
            ),
          );
  }

  Future<void> requestLocationPermission(BuildContext context) async {
    PermissionStatus status = await Permission.location.request();

    status.isGranted
        ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Location Diterima",
              ),
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Location Diterima",
              ),
            ),
          );
  }

  Future<void> requestStoragePermission(BuildContext context) async {
    PermissionStatus status = await Permission.storage.request();

    status.isGranted
        ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Storage Diterima",
              ),
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Storage Diterima",
              ),
            ),
          );
  }

  Future<void> requestMicrophonePermission(BuildContext context) async {
    PermissionStatus status = await Permission.microphone.request();

    status.isGranted
        ? ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Microphone Diterima",
              ),
            ),
          )
        : ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Izin Microphone Diterima",
              ),
            ),
          );
  }
}
