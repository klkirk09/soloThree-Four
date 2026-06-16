import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DogHomePage(),
    );
  }
}

class DogHomePage extends StatefulWidget {
  const DogHomePage({super.key});

  @override
  State<DogHomePage> createState() => _DogHomePageState();
}

class _DogHomePageState extends State<DogHomePage> {

  // Store the current dog image URL
  String? dogImageUrl;

  // Loading state
  bool isLoading = false;

  // Error message
  String? errorMessage;

  // TODO: Create function to fetch dog image
  Future<void> fetchDog() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dog Breed Diary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // TODO: Empty state

            // TODO: Loading state

            // TODO: Error state

            // TODO: Success state

            ElevatedButton(
              onPressed: fetchDog,
              child: const Text('Fetch Dog'),
            ),
          ],
        ),
      ),
    );
  }
}