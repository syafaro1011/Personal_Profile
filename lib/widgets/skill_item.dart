import 'package:flutter/material.dart';
import '../models/profile.dart';

class SkillItem extends StatelessWidget {
  final Skill skill;

  const SkillItem({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              skill.icon,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 12),
            Text(
              skill.nama,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  index < skill.level ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              skill.getLevelText(),
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
          ],
        ),
      ),
    );
  }
}