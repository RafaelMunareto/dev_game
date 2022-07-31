import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

class IdentityWidget extends StatelessWidget {
  final String title;
  final String responsabilidade;
  const IdentityWidget(
      {Key? key, required this.title, required this.responsabilidade})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Card(
        color: Colors.black26,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                responsabilidade,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 10),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () => FollowerWidget.remove('identify'),
                  child: const Text('OK'))
            ],
          ),
        ),
      ),
    );
  }
}
