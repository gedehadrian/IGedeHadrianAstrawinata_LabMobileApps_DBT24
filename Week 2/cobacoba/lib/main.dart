import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile Apps',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.red)),
      home: const MyHomePage(title: 'Awesome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            shadowColor: Colors.black26,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // ICON
                  Icon(
                    Icons.directions_run,
                    size: 36,
                    color: Theme.of(context).colorScheme.primary,
                  ),

                  const SizedBox(height: 12),

                  // TITLE
                  const Text(
                    "RUNNER UP",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.4,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // SUBTITLE
                  const Text(
                    "Tim Kuat dan Hebat",
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),

                  const SizedBox(height: 20),

                  // IMAGE
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLLrGMvqJVCcmaE73GgoRSvvp7NpaIRiA89g&s',
                      width: 220,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // DESCRIPTION
                  const Text(
                    "Bersama Koh Delwyn kita melangkah\n"
                    "Hijume anak emas",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, height: 1.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
