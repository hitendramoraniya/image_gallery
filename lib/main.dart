import 'package:flutter/material.dart';
import 'package:image_gallery/view/image_gallery_screen.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bindings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBindings(),
      title: 'Image Gallery',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: ImageGalleryScreen(),
    );
  }
}
