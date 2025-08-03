import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: Colors.grey[100],
        useMaterial3: true,
      ),
      home: const WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/uchiha.jpeg',
              width: 120, // Ajustement de la taille de l'image
            )
                .animate()
                .scale(duration: 800.ms)
                .then(delay: 200.ms)
                .shake(hz: 4, duration: 300.ms),

            const SizedBox(height: 40),

            // affichage du titre en glissant 
            const Text(
              'Bienvenue chez les Uchiha!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ).animate().fadeIn(duration: 600.ms).slideX(
                  begin: -1,
                  curve: Curves.easeOut,
                ),

            const SizedBox(height: 20),

            // le texte apparaissant avec un effet de scintillement
            const Text(
              'Découvrez la magie du charingan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .fadeIn(duration: 600.ms)
                .then(delay: 800.ms)
                .shimmer(
                  duration: 1800.ms,
                  color: Colors.blue.withOpacity(0.3),
                ),

            const SizedBox(height: 40),

            // Bouton avec une apparition "élastique"
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Commencer'),
            ).animate().scale(
                  duration: 500.ms,
                  curve: Curves.elasticOut,
                  delay: 400.ms,
                ),

            const SizedBox(height: 30),

            // Les étoiles qui apparaissent en cascade
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AnimateList(
                interval: 200.ms,
                effects: [
                  FadeEffect(duration: 400.ms, curve: Curves.easeOut),
                  ScaleEffect(curve: Curves.easeOutBack),
                ],
                children: List.generate(
                  5,
                  (_) => const Icon(Icons.star, color: Colors.amber, size: 30),
                ),
              ),
            ),
          ],
        )
            // Animation d'apparition globale pour toute la colonne
            .animate()
            .fadeIn(duration: 500.ms)
            .moveY(
              begin: 50,
              end: 0,
              curve: Curves.easeOut,
            ),
      ),
    );
  }
}