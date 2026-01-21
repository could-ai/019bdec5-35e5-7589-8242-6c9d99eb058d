import 'package:flutter/material.dart';
import '../services/recommendation_service.dart';
import 'solution_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _problemController = TextEditingController();
  bool _isLoading = false;

  final List<String> _quickTags = [
    "Can't focus",
    "Always late",
    "Lost my keys",
    "Overwhelmed",
    "Procrastinating",
    "Can't sleep",
  ];

  void _getSolutions(String problem) async {
    if (problem.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      final solutions = await RecommendationService.getSolutions(problem);
      
      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SolutionScreen(
            solutions: solutions,
            originalProblem: problem,
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Something went wrong. Please try again.')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _problemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADHD Tech Helper'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'What are you struggling with right now?',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Describe your challenge, and we\'ll suggest a tech solution.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            TextField(
              controller: _problemController,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'e.g., I keep forgetting to take my medication...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.surfaceContainerHighest.withOpacity(0.3),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Quick Select:',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _quickTags.map((tag) {
                return ActionChip(
                  label: Text(tag),
                  onPressed: () {
                    _problemController.text = tag;
                  },
                  avatar: const Icon(Icons.touch_app, size: 16),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 56,
              child: FilledButton.icon(
                onPressed: _isLoading
                    ? null
                    : () => _getSolutions(_problemController.text),
                icon: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(Icons.lightbulb_outline),
                label: Text(
                  _isLoading ? 'Thinking...' : 'Find Solution',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
