// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:reports/widgets/filters_widget.dart';

class FiltersScreen extends StatefulWidget {
  final String name;
  const FiltersScreen({
    super.key,
    required this.name,
  });

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 45,
          child: TextFormField(
            controller: _searchController,
            decoration: const InputDecoration(
              labelText: 'Search for orders...',
              //hintText: 'Search for orders...',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)),),
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return const FilterWidget();
                    });
              },
              icon: const Icon(Icons.menu))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Filter Order Type : ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.name,
                  style: const TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
          ),
          //Divider(),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: const BoxDecoration(color: Colors.black12),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "8000",
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold,),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
