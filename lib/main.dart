import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dog.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    }

     catch (e, stackTrace) {
  debugPrint('fetchDog error: $e');
  debugPrintStack(stackTrace: stackTrace);
  if (!mounted) return;
  setState(() {
  errorMessage = 'Could not fetch a dog image. Please try again.';
  });
}

    finally {
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
            if (isLoading) const CircularProgressIndicator(),
            if (errorMessage != null) Text(errorMessage!),
            if (dogImageUrl != null) Image.network(dogImageUrl!),
            // TODO: Empty state

            // TODO: Loading state

            // TODO: Error state

            // TODO: Success state

            ElevatedButton(
              onPressed: isLoading ? null : fetchDog,
              child: const Text('Fetch Dog'),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SavedDogsPage()),
                );
              },
              child: const Text('View Saved Dogs'),
            ),
          ],
        ),
      ),
    );
  }
}

class SavedDogsPage extends StatelessWidget {
  const SavedDogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Dogs'),
      ),
      body: const Center(
        child: Text('No saved dogs yet.'),
      ),
    );
  }
}

class DatabaseHelper {

  // Singleton instance
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Database? _database;

  // TODO: Open database
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('dogs.db');
    return _database!;
  }

  // TODO: Create database file
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,

      // TODO: Create table when database is first created
      onCreate: _createDB,
    );
  }

  // TODO: Create saved_dogs table
  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE saved_dogs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        imageUrl TEXT NOT NULL
      )
    ''');
  }

  // TODO: Save a dog
  Future<void> insertDog() async {

  }

  // TODO: Load all saved dogs
  Future<List<dynamic>> getAllDogs() async {
    return [];
  }

  // TODO: Delete one dog
  Future<void> deleteDog(int id) async {

  }

  // TODO: Delete all dogs
  Future<void> clearAllDogs() async {

  }
}