import 'package:flutter/material.dart';

class BuildWidget extends StatelessWidget {
  const BuildWidget({super.key});

  void showButtomSheet(BuildContext context) {
    Scaffold.of(context).showBottomSheet(
      (context) {
        return const ShowBottomSheet();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Build Context'),
      ),
      body: Builder(
        builder: (context) {
          return TextButton(
            onPressed: () => showButtomSheet(context),
            child: const Text('BUTTON'),
          );
        },
      ),
    );
  }
}

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      color: Colors.green,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Buttom Sheet'),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close Buttom'),
            ),
          ],
        ),
      ),
    );
  }
}
