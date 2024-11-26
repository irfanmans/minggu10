import 'package:flutter/material.dart';
import 'package:minggu10/services/permissions_service.dart';

class InputDataScreen extends StatefulWidget {
  final Function(String, String) onDataSubmitted;

  const InputDataScreen({super.key, required this.onDataSubmitted});

  @override
  State<InputDataScreen> createState() => _InputDataScreenState();
}

class _InputDataScreenState extends State<InputDataScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  PermissionsService permissionsService = PermissionsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Input Data",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        await permissionsService
                            .requestCameraPermission(context);
                      },
                      icon: const Icon(Icons.camera_alt),
                    ),
                    IconButton(
                      onPressed: () async {
                        await permissionsService
                            .requestLocationPermission(context);
                      },
                      icon: const Icon(Icons.location_on),
                    ),
                    IconButton(
                      onPressed: () async {
                        await permissionsService
                            .requestStoragePermission(context);
                      },
                      icon: const Icon(Icons.storage),
                    ),
                    IconButton(
                      onPressed: () async {
                        await permissionsService
                            .requestMicrophonePermission(context);
                      },
                      icon: const Icon(Icons.mic),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        widget.onDataSubmitted(
                          _nameController.text,
                          _emailController.text,
                        );
                        Navigator.pop(context);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
