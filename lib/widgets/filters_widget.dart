import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:reports/screens/filters_screen.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

enum FilterOptions { monthOrders, dateRange, date, timeRange }

class _FilterWidgetState extends State<FilterWidget> {
  final TextEditingController _monthController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  FilterOptions _selectedOption = FilterOptions.monthOrders;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Filter Order Lists",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RadioListTile<FilterOptions>(
                    title: const Text("Month Orders"),
                    value: FilterOptions.monthOrders,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<FilterOptions>(
                    title: const Text("Date Range Order"),
                    value: FilterOptions.dateRange,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<FilterOptions>(
                    title: const Text("Date Orders"),
                    value: FilterOptions.date,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  RadioListTile<FilterOptions>(
                    title: const Text("Time Range"),
                    value: FilterOptions.timeRange,
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  _buildFilterOption(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FilledButton(
                          onPressed: () {
                            _clearAll();
                          },
                          child: const Text("Clear All"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        FilledButton(
                          onPressed: () {
                            _applyFilters();
                          },
                          child: const Text("Apply"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterOption() {
    switch (_selectedOption) {
      case FilterOptions.monthOrders:
        return TextFormField(
          controller: _monthController,
          readOnly: true,
          onTap: () {
            selectMonth(context);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.date_range_outlined),
            labelText: 'Select the month',
            border: OutlineInputBorder(),
          ),
        );
      case FilterOptions.dateRange:
        return Column(
          children: [
            TextFormField(
              controller: _startDateController,
              readOnly: true,
              onTap: () {
                _selectStartDate(context);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                labelText: 'Start the date',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _endDateController,
              readOnly: true,
              onTap: () {
                _selectEndDate(context);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.date_range_outlined),
                labelText: 'Select the end date',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
      case FilterOptions.date:
        return TextFormField(
          controller: _dateController,
          readOnly: true,
          onTap: () {
            _selectDate(context);
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.date_range_outlined),
            labelText: 'Select the date',
            border: OutlineInputBorder(),
          ),
        );
      case FilterOptions.timeRange:
        return Column(
          children: [
            TextFormField(
              controller: _startTimeController,
              readOnly: true,
              onTap: () {
                _selectStartTime(context);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.access_time),
                labelText: 'Select the start time',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _endTimeController,
              readOnly: true,
              onTap: () {
                _selectEndTime(context);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.access_time),
                labelText: 'Select the end time',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        );
    }
  }

  Future<void> selectMonth(BuildContext context) async {
    final DateTime? picked = await showMonthPicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _monthController.text = _getFormattedMonth(picked);
      });
    }
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _startDateController.text = _getFormattedDate(picked);
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _endDateController.text = _getFormattedDate(picked);
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        _dateController.text = _getFormattedDate(picked);
      });
    }
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _startTimeController.text = _formatTimeOfDay(picked);
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
      initialEntryMode: TimePickerEntryMode.dial,
      helpText: 'Select end time',
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _endTimeController.text = _formatTimeOfDay(picked);
      });
    }
  }

  String _getFormattedMonth(DateTime date) {
    return DateFormat('MMM/yyyy').format(date);
  }

  String _getFormattedDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  String _formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dateTime = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    return DateFormat.jm().format(dateTime);
  }

  void _clearAll() {
    Navigator.pop(context);
    setState(() {
      _monthController.clear();
      _startDateController.clear();
      _endDateController.clear();
      _dateController.clear();
      _startTimeController.clear();
      _endTimeController.clear();
    });
  }

  void _applyFilters() {
    print("Applying Filters...");
    switch (_selectedOption) {
      case FilterOptions.monthOrders:
        if (_monthController.text.isEmpty) {
          _showToast("Please select a month.");
        } else {
          print("Month Orders: ${_monthController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                name: _monthController.text,
              ),
            ),
          );
        }
        break;
      case FilterOptions.dateRange:
        if (_startDateController.text.isEmpty ||
            _endDateController.text.isEmpty) {
          _showToast("Please select start and end dates.");
        } else {
          print("Start Date: ${_startDateController.text}");
          print("End Date: ${_endDateController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                name:
                    '${_startDateController.text} To ${_endDateController.text}',
              ),
            ),
          );
        }
        break;
      case FilterOptions.date:
        if (_dateController.text.isEmpty) {
          _showToast("Please select a date.");
        } else {
          print("Date: ${_dateController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                name: _dateController.text,
              ),
            ),
          );
        }
        break;
      case FilterOptions.timeRange:
        if (_startTimeController.text.isEmpty ||
            _endTimeController.text.isEmpty) {
          return _showToast("Please select start and end times.");
        } else {
          print("Start Time: ${_startTimeController.text}");
          print("End Time: ${_endTimeController.text}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => FiltersScreen(
                name:
                    '${_startTimeController.text} To ${_endTimeController.text}',
              ),
            ),
          );
        }
        break;
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
