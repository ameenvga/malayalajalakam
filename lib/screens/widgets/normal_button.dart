import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;

  NormalButton({required this.title, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = OutlinedButton.styleFrom(
        shape: StadiumBorder(),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.primary,
        ));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        style: style,
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
