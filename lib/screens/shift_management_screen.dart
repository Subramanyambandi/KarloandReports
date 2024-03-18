import 'package:flutter/material.dart';
import 'package:reports/screens/profile_screen.dart';
import 'package:reports/widgets/add_shift_person_widget.dart';
import 'package:reports/widgets/card_widget.dart';
class ShiftManagementScreen extends StatefulWidget {
  const ShiftManagementScreen({super.key});

  @override
  State<ShiftManagementScreen> createState() => _ShiftManagementScreenState();
}

class _ShiftManagementScreenState extends State<ShiftManagementScreen> {
  //final List<CardWidget> _cardWidgets = [];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Shift Management"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            showDragHandle: true,
            context: context,
            builder: (BuildContext context) {
              return const AddShiftPersonWidget(
               // onSave: _addShiftPerson,
              );
            },
          );
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Shift Person"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return CardWidget(onSelect: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
          });
        },
      ),
    );
  }

  // void _addShiftPerson(String name, String number, String address) {
  //   setState(() {
  //     _cardWidgets.add(
  //       CardWidget(
  //         name: name,
  //         number: int.parse(number),
  //       ),
  //     );
  //   });
  // }
}
