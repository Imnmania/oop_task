import 'package:flutter/material.dart';

class ReloadButton extends StatelessWidget {
  final VoidCallback onTap;
  const ReloadButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: const Text('Reload'),
      ),
    );
  }
}
