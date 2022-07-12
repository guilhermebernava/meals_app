import 'package:flutter/material.dart';

class Filter extends StatelessWidget {
  static const route = "/filters";
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filters"),
      ),
      body: const Center(
        child: Text("FILTERS PAGE"),
      ),
    );
  }
}
