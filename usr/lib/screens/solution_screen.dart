import 'package:flutter/material.dart';
import '../models/solution.dart';

class SolutionScreen extends StatelessWidget {
  final List<Solution> solutions;
  final String originalProblem;

  const SolutionScreen({
    super.key,
    required this.solutions,
    required this.originalProblem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Solutions'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Challenge:',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  originalProblem,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'Tech Recommendations',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          ...solutions.map((solution) => _buildSolutionCard(context, solution)),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.search),
              label: const Text('Search Again'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(BuildContext context, Solution solution) {
    final isPhysical = solution.type == SolutionType.physical;
    final colorScheme = Theme.of(context).colorScheme;
    
    // Map string icon names to actual IconData
    IconData getIcon(String name) {
      switch (name) {
        case 'timer': return Icons.timer;
        case 'calendar_today': return Icons.calendar_today;
        case 'headset': return Icons.headset;
        case 'nature': return Icons.eco; // nature/forest
        case 'location_searching': return Icons.location_searching;
        case 'wb_sunny': return Icons.wb_sunny;
        case 'smartphone': return Icons.smartphone;
        case 'view_column': return Icons.view_column;
        case 'toys': return Icons.toys;
        case 'note_add': return Icons.note_add;
        case 'watch': return Icons.watch;
        default: return Icons.lightbulb;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: isPhysical ? Colors.orange.shade100 : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    getIcon(solution.iconName),
                    color: isPhysical ? Colors.orange.shade800 : Colors.blue.shade800,
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        solution.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isPhysical ? Colors.orange.shade50 : Colors.blue.shade50,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isPhysical ? Colors.orange.shade200 : Colors.blue.shade200,
                          ),
                        ),
                        child: Text(
                          isPhysical ? 'Physical Tech' : 'Digital Tech',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: isPhysical ? Colors.orange.shade900 : Colors.blue.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              solution.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
