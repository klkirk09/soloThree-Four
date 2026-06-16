import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
    if (isLoading) return;

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await http.get(
        Uri.parse('https://dog.ceo/api/breeds/image/random'),
      );

      if (response.statusCode != 200) {
        throw Exception('Server returned ${response.statusCode}');
      }

      final decoded = jsonDecode(response.body);

      if (decoded is! Map<String, dynamic>) {
        throw Exception('Unexpected response format');
      }

      final message = decoded['message'];

      if (message is! String || message.isEmpty) {
        throw Exception('No image URL returned');
      }

      if (!mounted) return;
      setState(() {
        dogImageUrl = message;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        errorMessage = 'Could not fetch a dog image. Please try again.';
      });
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
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
              onPressed: isLoading ? null : fetchDog,
              child: const Text('Fetch Dog'),
            ),
          ],
        ),
      ),
    );
  }
}