enum SolutionType {
  physical,
  digital,
}

class Solution {
  final String title;
  final String description;
  final SolutionType type;
  final String iconName; // We'll use this to pick an IconData later
  final String? productLink; // Placeholder for a real link

  const Solution({
    required this.title,
    required this.description,
    required this.type,
    required this.iconName,
    this.productLink,
  });
}
