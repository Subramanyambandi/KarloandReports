import 'package:flutter/material.dart';
import 'package:reports/screens/shift_management_screen.dart';
import 'package:reports/screens/walk_through_screen.dart';
import 'package:reports/widgets/filters_widget.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

enum FilterOptions { adminLogin, userLogin }

class _ReportsScreenState extends State<ReportsScreen> {
  late double width;
  FilterOptions _selectedOption = FilterOptions.adminLogin;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Reports"),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const FilterWidget();
            },
          );
        },
        label: const Text("Filters"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _buildOptionContainer(
                FilterOptions.adminLogin,
                Icons.receipt_long_outlined,
                "Billing Login",
              ),
              _buildOptionContainer(
                FilterOptions.userLogin,
                Icons.person_2_outlined,
                "User Login",
              ),
            ],
          ),
          const SizedBox(height: 20),
          _buildFilterOption(),
          SizedBox(
            height: 10,
          ),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShiftManagementScreen(),
                ),
              );
            },
            child: const Text("ShiftManagement"),
          ),
          const SizedBox(
            height: 10,
          ),
          FilledButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WalkThroughScreen(),
                ),
              );
            },
            child: const Text("Walk Through"),
          ),
          FilledButton(
            onPressed: () {},
            child: const Text("Dummy Button"),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionContainer(
      FilterOptions option, IconData icon, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
      },
      child: Material(
        child: Container(
          width: (width - (16 * 3)) / 2,
          height: (width - (16 * 3)) / 2,
          decoration: BoxDecoration(
            color: _selectedOption == option
                ? Theme.of(context).colorScheme.primary
                : Color(0XFFFFFFFF),
            // boxShadow: [
            //   BoxShadow(color: Colors.grey.withOpacity(0.2)),
            // ],
            border: Border.all(
              color: Colors.grey.withOpacity(0.5), // Border color
              width: 2.0,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Radio<FilterOptions>(
                  activeColor: Colors.white,
                  value: option,
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    size: width / 7,
                    color: _selectedOption == option
                        ? Colors.white70
                        : Colors.black54,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: _selectedOption == option
                          ? Colors.white70
                          : Color(0XFF130925),
                      fontSize: 20,
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
      case FilterOptions.adminLogin:
        return const Text("Selected from admin");
      case FilterOptions.userLogin:
        return const Text("Selected by user");
    }
  }
}

// class FilledButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final Widget child;

//   const FilledButton({
//     required this.onPressed,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       child: child,
//     );
//   }
// }
