// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CardWidget extends StatefulWidget {
  // final String name;
  // final int number;
  final VoidCallback onSelect;

  const CardWidget({
    super.key,
    required this.onSelect,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  late bool isChecked;

  @override
  void initState() {
    super.initState();
    isChecked = false;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap:  () {
        // setState(() {
        //   isChecked = !isChecked;
        // });
        widget.onSelect();},
      child: Card(
          elevation: 8,
          color: isChecked ? Colors.orangeAccent : Colors.white,
          child: ListTile(
            leading: const Icon(Icons.person),
            title:const Text(
            "Subbu",
              style:  TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text("8977778784"),
            trailing: Checkbox(
                      value: isChecked,
                      activeColor: Colors.greenAccent,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
          )
      
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 widget.name.toString(),
          //                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          //               ),
          //               Text(widget.number.toString()),
          //             ],
          //           ),
          //           Checkbox(
          //             value: isChecked,
          //             activeColor: Colors.greenAccent,
          //             onChanged: (value) {
          //               setState(() {
          //                 isChecked = value!;
          //               });
          //             },
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          ),
    );
  }
}
