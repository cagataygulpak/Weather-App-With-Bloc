// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SearchLocation extends StatefulWidget {
  const SearchLocation({super.key});

  @override
  State<SearchLocation> createState() => _SearchLocationState();
}

class _SearchLocationState extends State<SearchLocation> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose City"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: const InputDecoration(
                      labelText: "City",
                      hintText: "Choose a city",
                      border: OutlineInputBorder()),
                ),
              ),
              IconButton(
                onPressed: () =>
                    Navigator.of(context).pop(_textEditingController.text),
                icon: const Icon(Icons.search_outlined),
              ),
            ],
          ),
        ));
  }
}
