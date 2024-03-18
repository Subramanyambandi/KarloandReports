import 'package:flutter/material.dart';

class AddShiftPersonWidget extends StatefulWidget {
  //final Function(String, String, String) onSave;

  const AddShiftPersonWidget({super.key});

  @override
  State<AddShiftPersonWidget> createState() => _AddShiftPersonWidgetState();
}

class _AddShiftPersonWidgetState extends State<AddShiftPersonWidget> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Expanded(flex: 1, child: Text("Person Name")),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(flex: 1, child: Text("Number")),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _numberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Expanded(flex: 1, child: Text("Address")),
                      Expanded(
                        flex: 2,
                        child: TextFormField(
                          controller: _addressController,
                          keyboardType: TextInputType.text,
                          decoration:  const InputDecoration(
                            prefixIcon: Icon(Icons.location_on),
                            labelText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40))                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an address';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pop(context);
                          
                          // widget.onSave(
                          //   _nameController.text,
                          //   _numberController.text,
                          //   _addressController.text,
                          // );
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
