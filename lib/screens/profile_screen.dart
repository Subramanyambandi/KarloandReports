import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  double? width;
  final TextEditingController _startDateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _startDateController.text = _getFormattedDate(_selectedDate);
  }

 

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0XFFF6F7FA),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topCenter,
              height: width,
              color: Color(0XFF130925),
              child: Container(
                alignment: Alignment.center,
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_left,
                          size: 40, color: Color(0XFFFFFFFF)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    // const SizedBox(width: 60,),
                  const Text(
                    "Shift Overview",
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: 20,
                    ),
                  ),
                    // const Padding(
                    //   padding: EdgeInsets.only(right: 16.0),
                    //   child: Icon(Icons.person,
                    //       size: 25,
                    //       //height: 25,
                    //       color: Color(0XFFFFFFFF)),
                    // ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: 80),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.only(top: 60),
                    alignment: Alignment.topCenter,
                    decoration: const BoxDecoration(
                        color: Color(0XFFF6F7FA),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Subramanyam",
                          style: TextStyle(
                            //color: Color(0XFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          "8977778784",
                          style: TextStyle(
                            //color: Color(0XFFFFFFFF),
                            fontSize: 20,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(24.0),
                          child: Column(
                            children: <Widget>[
                              Divider(),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    "Date",
                                    style: TextStyle(
                                      //color: Color(0XFFFFFFFF),
                                      fontSize: 20,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          _startDateController.text.toString()),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(right: 16.0),
                                        child: InkWell(
                                          onTap: () {
                                            _selectStartDate(context);
                                          },
                                          child: const Icon(
                                            Icons.calendar_month_rounded,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                                width: (width! - (16 * 3)) / 2,
                                height: (width! - (16 * 3)) / 2,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2))
                                  ],
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.category_outlined,
                                      size: width! / 7,
                                      weight: 1,

                                      //height: width! / 7,
                                    ),
                                    const Text(
                                      "Total Items",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF130925),
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "100",
                                      style: TextStyle(fontSize: 22),
                                    )
                                  ],
                                )),
                            Container(
                                width: (width! - (16 * 3)) / 2,
                                height: (width! - (16 * 3)) / 2,
                                decoration: BoxDecoration(
                                  color: Color(0XFFFFFFFF),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2))
                                  ],
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.receipt_long_rounded,
                                      size: width! / 7,
                                      //height: width! / 7,
                                    ),
                                    const Text(
                                      "Total Bills",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color(0XFF130925),
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "800",
                                      style: TextStyle(fontSize: 22),
                                    )
                                  ],
                                ))
                          ],
                        ),
                        SizedBox(height: 16),
                        // Row(
                        //   mainAxisSize: MainAxisSize.max,
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: <Widget>[gridItem(2), gridItem(3)],
                        // ),
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                  const CircleAvatar(
                    radius: 50,
                    //backgroundColor: Colors.blue,
                    child: Icon(Icons.person),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
}

String _getFormattedDate(DateTime date) {
  return DateFormat('dd/MM/yyyy').format(date);
}


// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("Profile Screen"),
//       ),
//       body: Column(
//         children: [
//           const Card(
//             elevation: 8,
//             surfaceTintColor: Colors.white,
//             child: Padding(
//               padding: EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Name'),
//                       Text('Subbu'),
//                     ],
//                   ),
//                   Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Number'),
//                       Text('8977778784'),
//                     ],
//                   ),
//                   Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text('Address'),
//                       Text('Pakala(M),Chittoor(D)'),
//                     ],
//                   ),
//                   Divider(),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           const Row(
//             children: [
//               Expanded(
//                 child: SizedBox(
//                   height: 80,
//                   child: Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Total Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           Text("2000")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   height: 80,
//                   child: Card(
//                     child: Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Total Items",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                           Text("80")
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Table(
//                 //defaultVerticalAlignment: TableCellVerticalAlignment.top,
//                 border:
//                      TableBorder.all(), // Allows to add a border decoration around your table
//                 children: const [
//                   TableRow(
//                     decoration: BoxDecoration(
//                         color: Color.fromARGB(255, 214, 212, 212)),
//                     children: [
//                       Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Description',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'Start Time',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             'End Time',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                       Center(
//                         child: Padding(
//                           padding: EdgeInsets.all(8.0),
//                           child: Text(
//                             "Orders",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold, fontSize: 16),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   TableRow(children: [
//                     Center(
//                       child: Text('Coffee'),
//                     ),
//                     Center(
//                       child: Text('10.00'),
//                     ),
//                     Center(
//                       child: Text('2.00'),
//                     ),
//                     Center(
//                       child: Text('200'),
//                     ),
//                   ]),
//                   TableRow(children: [
//                     Center(
//                       child: Text('Biryani'),
//                     ),
//                     Center(
//                       child: Text('10.00'),
//                     ),
//                     Center(
//                       child: Text('2.00'),
//                     ),
//                     Center(
//                       child: Text('1800'),
//                     ),
//                   ]),
//                 ]),
//           ),
//           const Divider(),
//           const Padding(
//             padding: EdgeInsets.only(right: 45),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(
//                   'Total Orders : ',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "200",
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                 )
//               ],
//             ),
//           ),
//           Container(
//               alignment: Alignment.topRight,
//               child: const Divider(
//                 indent: 200,
//               ))
//         ],
//       ),
//     );
//   }
// }
