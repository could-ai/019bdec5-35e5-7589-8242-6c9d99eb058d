import '../models/solution.dart';

class RecommendationService {
  // A simple keyword-based mock recommendation engine
  static Future<List<Solution>> getSolutions(String problem) async {
    // Simulate network delay for a realistic feel
    await Future.delayed(const Duration(seconds: 1));

    final lowerProblem = problem.toLowerCase();
    List<Solution> solutions = [];

    if (lowerProblem.contains('time') ||
        lowerProblem.contains('late') ||
        lowerProblem.contains('schedule') ||
        lowerProblem.contains('blindness')) {
      solutions.add(const Solution(
        title: 'Visual Timer',
        description:
            'A physical timer that shows time passing visually (e.g., a red disk disappearing). Helps with time blindness by making time concrete.',
        type: SolutionType.physical,
        iconName: 'timer',
      ));
      solutions.add(const Solution(
        title: 'Smart Calendar Alerts',
        description:
            'Use a digital calendar (like Google Calendar) with multiple notifications: 1 day before, 1 hour before, and 10 minutes before events.',
        type: SolutionType.digital,
        iconName: 'calendar_today',
      ));
    }

    if (lowerProblem.contains('focus') ||
        lowerProblem.contains('distract') ||
        lowerProblem.contains('noise') ||
        lowerProblem.contains('concentrate')) {
      solutions.add(const Solution(
        title: 'Noise Canceling Headphones',
        description:
            'Active noise canceling headphones can block out distracting background noises, creating a "bubble" of silence for deep work.',
        type: SolutionType.physical,
        iconName: 'headset',
      ));
      solutions.add(const Solution(
        title: 'Forest App',
        description:
            'Gamify your focus. Plant a virtual tree that grows while you work. If you leave the app to check social media, the tree dies.',
        type: SolutionType.digital,
        iconName: 'nature',
      ));
    }

    if (lowerProblem.contains('lost') ||
        lowerProblem.contains('find') ||
        lowerProblem.contains('forget') ||
        lowerProblem.contains('keys')) {
      solutions.add(const Solution(
        title: 'Bluetooth Trackers',
        description:
            'Attach trackers (like AirTags or Tile) to essential items like keys, wallet, and backpack. Ring them from your phone when lost.',
        type: SolutionType.physical,
        iconName: 'location_searching',
      ));
    }

    if (lowerProblem.contains('sleep') ||
        lowerProblem.contains('awake') ||
        lowerProblem.contains('bed')) {
      solutions.add(const Solution(
        title: 'Sunrise Alarm Clock',
        description:
            'Simulates a natural sunrise to wake you up gently. Helps regulate circadian rhythms which are often delayed in ADHD brains.',
        type: SolutionType.physical,
        iconName: 'wb_sunny',
      ));
      solutions.add(const Solution(
        title: 'Blue Light Filter',
        description:
            'Install software like f.lux or use built-in "Night Shift" modes on devices to reduce blue light exposure in the evening.',
        type: SolutionType.digital,
        iconName: 'smartphone',
      ));
    }

    if (lowerProblem.contains('overwhelm') ||
        lowerProblem.contains('too much') ||
        lowerProblem.contains('start') ||
        lowerProblem.contains('procrastinate')) {
      solutions.add(const Solution(
        title: 'Kanban Board',
        description:
            'A visual project management tool (like Trello). Create columns for "To Do", "Doing", and "Done". Limit "Doing" to avoid overwhelm.',
        type: SolutionType.digital,
        iconName: 'view_column',
      ));
      solutions.add(const Solution(
        title: 'Fidget Cube',
        description:
            'A small handheld device with buttons and switches. Provides sensory input that can help lower anxiety and increase focus during tasks.',
        type: SolutionType.physical,
        iconName: 'toys',
      ));
    }

    // Default fallback if no specific keywords match
    if (solutions.isEmpty) {
      solutions.add(const Solution(
        title: 'Digital Note-Taking System',
        description:
            'An "external brain" like Obsidian or Notion. Capture every thought immediately so you don\'t have to hold it in working memory.',
        type: SolutionType.digital,
        iconName: 'note_add',
      ));
      solutions.add(const Solution(
        title: 'Smart Watch',
        description:
            'Use a smartwatch for haptic reminders and timers. It vibrates on your wrist, which is harder to ignore than a phone notification.',
        type: SolutionType.physical,
        iconName: 'watch',
      ));
    }

    return solutions;
  }
}
