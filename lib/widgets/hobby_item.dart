import 'package:flutter/material.dart';

class HobbyItem extends StatelessWidget {
  final String hobby;
  final int index;

  const HobbyItem({Key? key, required this.hobby, required this.index})
      : super(key: key);

  IconData _getHobbyIcon(String hobby) {
    if (hobby.toLowerCase().contains('musik') ||
        hobby.toLowerCase().contains('music')) {
      return Icons.music_note;
    } else if (hobby.toLowerCase().contains('game') ||
        hobby.toLowerCase().contains('gaming')) {
      return Icons.sports_esports;
    } else if (hobby.toLowerCase().contains('olahraga') ||
        hobby.toLowerCase().contains('sport')) {
      return Icons.sports_soccer;
    } else if (hobby.toLowerCase().contains('baca') ||
        hobby.toLowerCase().contains('read')) {
      return Icons.menu_book;
    } else if (hobby.toLowerCase().contains('traveling') ||
        hobby.toLowerCase().contains('jalan')) {
      return Icons.flight_takeoff;
    } else if (hobby.toLowerCase().contains('coding') ||
        hobby.toLowerCase().contains('program')) {
      return Icons.code;
    }
    return Icons.favorite;
  }

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
    ];
    final color = colors[index % colors.length];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(_getHobbyIcon(hobby), color: color, size: 20),
          const SizedBox(width: 8),
          Text(
            hobby,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}