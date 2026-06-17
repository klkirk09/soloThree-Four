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
            if (dogImageUrl != null) ...[
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.insertDog(
                    Dog(imageUrl: dogImageUrl!),
                  );

                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Dog saved')),
                  );
                },
                child: const Text('Save Favorite'),
              ),
            ],
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

class SavedDogsPage extends StatefulWidget {
  const SavedDogsPage({super.key});

  @override
  State<SavedDogsPage> createState() => _SavedDogsPageState();
}

class _SavedDogsPageState extends State<SavedDogsPage> {
  late Future<List<Dog>> _dogsFuture;

  @override
  void initState() {
    super.initState();
    _dogsFuture = DatabaseHelper.instance.getAllDogs();
  }

  Future<void> _reloadDogs() async {
    setState(() {
      _dogsFuture = DatabaseHelper.instance.getAllDogs();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Dogs'),
        actions: [
          TextButton(
            onPressed: () async {
              await DatabaseHelper.instance.clearAllDogs();
              if (!mounted) return;
              setState(() {
                _dogsFuture = DatabaseHelper.instance.getAllDogs();
              });
            },
            child: const Text('Clear All'),
          ),
        ],
      ),
      body: FutureBuilder<List<Dog>>(
        future: _dogsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text('Could not load saved dogs.'),
            );
          }

          final dogs = snapshot.data ?? [];

          if (dogs.isEmpty) {
            return const Center(
              child: Text('No saved dogs yet.'),
            );
          }

          return RefreshIndicator(
            onRefresh: _reloadDogs,
            child: ListView.builder(
              itemCount: dogs.length,
              itemBuilder: (context, index) {
                final dog = dogs[index];
                return ListTile(
                  leading: Image.network(
                    dog.imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Saved Dog #${dog.id ?? ''}'),
                  subtitle: Text(dog.imageUrl),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () async {
                      if (dog.id == null) return;
                      await DatabaseHelper.instance.deleteDog(dog.id!);
                      if (!mounted) return;
                      setState(() {
                        _dogsFuture = DatabaseHelper.instance.getAllDogs();
                      });
                    },
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  static const _dbName = 'dogs.db';
  static const _tableDogs = 'saved_dogs';
  static const _colId = 'id';
  static const _colImageUrl = 'imageUrl';

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB(_dbName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_tableDogs (
        $_colId INTEGER PRIMARY KEY AUTOINCREMENT,
        $_colImageUrl TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertDog(Dog dog) async {
    final db = await database;
    return db.insert(_tableDogs, {
      _colImageUrl: dog.imageUrl,
    });
  }

  Future<List<Dog>> getAllDogs() async {
    final db = await database;
    final rows = await db.query(_tableDogs, orderBy: '$_colId DESC');
    return rows.map((row) => Dog.fromMap(row)).toList();
  }

  Future<int> deleteDog(int id) async {
    final db = await database;
    return db.delete(
      _tableDogs,
      where: '$_colId = ?',
      whereArgs: [id],
    );
  }

  Future<int> clearAllDogs() async {
    final db = await database;
    return db.delete(_tableDogs);
  }
}