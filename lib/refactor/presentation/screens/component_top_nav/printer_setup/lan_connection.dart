import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/top_navigation/printer/c_lan.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';
import 'package:squadra_pos/refactor/utils/custom_formatter.dart';

class LanConnection extends StatelessWidget {
  LanConnection({super.key});

  final _lanController = Get.find<LanController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(
        vertical: size.height / 8,
        horizontal: size.width / 5,
      ),
      content: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Obx(() {
          final state = _lanController.status.value;

           if (state.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 4,
                      strokeCap: StrokeCap.round,
                      valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(_lanController.information.value,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'NanumGothic',
                      color: customBodyText,
                    ),
                  )
                ],
              ),
            );
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Obx(() {
                  final state = _lanController.status.value;

                  if (state.isError) {
                    return Center(
                      child: Text(state.errorMessage ?? '---',
                        style: TextStyle(
                          fontFamily: 'NanumGothic',
                          color: customBodyText,
                        ),
                      ),
                    );
                  }

                  final data = _lanController.ipList;

                  if (data.isEmpty) {
                    return Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/errors/box-empty.webp", width: size.height * 0.2, fit: BoxFit.cover),
                          const SizedBox(height: 10),
                          Text("No network printers found.\nMake sure your printer is connected to the same network.",
                            style: TextStyle(
                              fontFamily: 'NanumGothic',
                              color: customBodyText,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final device = data[index];
                        
                        return ListTile(
                          title: Text('Printer ${index + 1}',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "UbuntuBold",
                              color: primaryColor,
                            ),
                          ),
                          subtitle: Text(device,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "NanumGothic",
                              color: customHeadingText,
                            ),
                          ),
                          trailing: SizedBox(
                            width: 350.r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: primaryColor,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(70, 30),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await _lanController.connectAndTestPrint(device);
                                  },
                                  child: Text('Test Print',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: "UbuntuBold",
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                ElevatedButton(
                                  onPressed: _lanController.connectedPrinter.value == device ? null : () {
                                    _lanController.setAsPrimaryPrinter(device);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:const Size(70, 30),
                                    backgroundColor: _lanController.connectedPrinter.value == device ? customGreen : primaryColor,
                                    foregroundColor: Colors.white,
                                    disabledBackgroundColor: customGreen,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                  ),
                                  child: Text('Set Primary',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: "UbuntuBold",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),

              Expanded(
                child: Obx(() {
                  final data = _lanController.stations;

                  return ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final station = data[index];

                      return ListTile(
                        title: Text(station.stationName,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "UbuntuBold",
                            color: primaryColor,
                          ),
                        ),
                        trailing: SizedBox(
                          width: 300.r,
                          height: 40,
                          child: Container(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            decoration: BoxDecoration(
                              color: customLightGrey, 
                              border: Border.all(
                                color: customLightGrey,
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(() {
                                return DropdownButton2(
                                  isDense: true,
                                  isExpanded: true,
                                  value: _lanController.selectedPrinters[index],
                                  hint: const Text("Select Printer",
                                    style: TextStyle(
                                      fontFamily: 'NexaRegular',
                                      color: Colors.grey,
                                    ),
                                  ),
                                  
                                  dropdownStyleData: DropdownStyleData(
                                    width: 300.r,
                                    elevation: 0,
                                    offset: const Offset(-20, -10), 
                                    decoration: BoxDecoration(
                                      color: customLightGrey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: null,
                                      child: Text('None',
                                        style: TextStyle(
                                          fontFamily: 'NexaRegular',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'to Primary',
                                      child: Text('to Primary',
                                        style: TextStyle(
                                          fontFamily: 'NexaRegular',
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    ..._lanController.ipList.map((val) {
                                      return DropdownMenuItem(
                                        value: val,
                                        child: Text(val.toString(),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                  onChanged: (value) {
                                    _lanController.updateSelectedPrinter(index: index, stationName: station.stationName, value: value);
                                  },
                                );
                              }),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                })
              ),
            ],
          );
        }),
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  minimumSize: const Size(80, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
                onPressed: () => Get.back(),
                child: const Text('Close',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'UbuntuBold',
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// import 'dart:io';
// import 'dart:typed_data';

// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_printer/esc_pos_printer.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';
// import 'package:squadra_pos/Database/database_helper.dart';
// import 'package:image/image.dart' as img;
// import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_station/g_station.dart';
// import 'package:squadra_pos/refactor/utils/constants.dart';

// class LanConnection extends StatefulWidget {
//   const LanConnection({super.key});

//   @override
//   State<LanConnection> createState() => _LanConnectionState();
// }

// class _LanConnectionState extends State<LanConnection>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   bool _isLoading = false;
//   String loadingInformation = '';
//   String _connectedPrinter = '';
//   final dbHelper = DatabaseHelper();

//   Map<int, String?> selectedPrinters = {};

//   List<String> ipPrinter = [];

//   void getPrinterIPDevice() async {
//     setState(() {
//       _isLoading = true;
//       loadingInformation = 'Checking Network Printer';
//     });

//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     List<String>? primaryPrinter =
//         sharedPreferences.getStringList("primaryPrinter");
//     if (primaryPrinter != null) {
//       if (primaryPrinter[0] == 'LanPrinter') {
//         setState(() {
//           _connectedPrinter = primaryPrinter[1];
//         });
//       }
//     }
//     // var connectedLanPrinter =
//     //     sharedPreferences.getString("connectedLanPrinter");

//     // if (connectedLanPrinter != null) {
//     //   setState(() {
//     //     _connectedPrinter = connectedLanPrinter;
//     //   });
//     // }

//     var ipLocal = '';
//     for (var interface in await NetworkInterface.list()) {
//       for (var addr in interface.addresses) {
//         if (addr.type == InternetAddressType.IPv4) {
//           var ipLocal0 = addr.address;
//           var ipArr = ipLocal0.split('.');
//           ipLocal = '${ipArr[0]}.${ipArr[1]}.${ipArr[2]}';
//           break;
//         }
//       }
//     }

//     // CODE GPT
//     ipPrinter.clear();
//     const port = 9100;
//     const concurrency = 20;

//     final ips = List.generate(254, (i) => '$ipLocal.${i + 1}');
//     int found = 0;

//     for (var i = 0; i < ips.length; i += concurrency) {
//       final batch = ips.skip(i).take(concurrency).toList();

//       await Future.wait(batch.map((ip) async {
//         try {
//           final socket = await Socket.connect(ip, port,
//               timeout: const Duration(milliseconds: 500));
//           socket.destroy();
//           ipPrinter.add(ip);
//           found++;
//           print('Found device: $ip:$port');
//         } catch (_) {
//           // Ignore timeout/connection errors
//         }
//       }));
//     }

//     print('Finish. Found $found device(s)');
//     getStationLite();
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   // CODE LAMA
//   //   ipPrinter.clear();
//   //   const port = 9100;
//   //   final stream = NetworkAnalyzer.discover2(
//   //     ipLocal,
//   //     port,
//   //     timeout: const Duration(milliseconds: 5000),
//   //   );

//   //   int found = 0;
//   //   stream.listen((NetworkAddress addr) {
//   //     if (addr.exists) {
//   //       found++;
//   //       print('Found device: ${addr.ip}:$port');
//   //       ipPrinter.add(addr.ip.toString());
//   //     }
//   //   }).onDone(() {
//   //     print('Finish. Found $found device(s)');
//   //     if (found == 0) {
//   //       print("Not Found");
//   //     } else {}

//   //     setState(() {
//   //       _isLoading = false;
//   //     });
//   //   });
//   // }

//   void setThisPrinter(ipPrint) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

//     await sharedPreferences.remove("connectedBluetoothPrinter");
//     List<String> primaryPrinterEmpty = ["", ""];
//     sharedPreferences.setStringList("primaryPrinter", primaryPrinterEmpty);

//     await Future.delayed(const Duration(milliseconds: 500));

//     // sharedPreferences.setString("connectedLanPrinter", ipPrint);
//     List<String> primaryPrinter = ["LanPrinter", ipPrint];
//     sharedPreferences.setStringList("primaryPrinter", primaryPrinter);
//     setState(() {
//       _connectedPrinter = ipPrint;
//       _isLoading = false;
//     });
//   }

//   void connectPrinterTest(printerIP) async {
//     const PaperSize paper = PaperSize.mm80;
//     final profile = await CapabilityProfile.load();
//     final printer = NetworkPrinter(paper, profile);
//     final ByteData data = await rootBundle.load('assets/images/logoText.png');

//     final PosPrintResult res = await printer.connect(printerIP, port: 9100);

//     if (res == PosPrintResult.success) {
//       testReceipt(printer, data);
//       printer.disconnect();
//     }
//     print('Print result: ${res.msg}');
//   }

//   // void testReceipt(NetworkPrinter printer) {
//   Future<void> testReceipt(NetworkPrinter printer, data) async {
//     final Uint8List bytes = data.buffer.asUint8List();
//     final img.Image? image = img.decodeImage(bytes);
//     printer.image(image!);

//     printer.text('SQUADRA POS', styles: const PosStyles(bold: true));
//     printer.feed(2);
//     printer.text('TEST PRINT', styles: const PosStyles(align: PosAlign.center));
//     printer.feed(2);
//     printer.text(
//       'TEST PRINT',
//       styles: const PosStyles(
//         height: PosTextSize.size2,
//         width: PosTextSize.size2,
//       ),
//     );
//     printer.feed(10);
//     printer.cut();
//   }

//   var stations = <StationLiteModel>[];
//   void getStationLite() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     List<Map<String, dynamic>> stationRes = await dbHelper.getStation();
//     if (mounted) {
//       setState(() {
//         Iterable list = stationRes;
//         print(stationRes[0]['StationName']);

//         stations = list.map((model) => StationLiteModel.fromJson(model)).toList();

//         for (int i = 0; i < stations.length; i++) {
//           var sPrinter = sharedPreferences.getString(stations[i].stationName);
//           if (sPrinter != null) {
//             if (sPrinter != 'to Primary') {
//               bool isExactMatch = ipPrinter.any((ip) => ip == sPrinter);
//               if (isExactMatch) {
//                 selectedPrinters[i] = sPrinter;
//               }
//             } else {
//               selectedPrinters[i] = sPrinter;
//             }
//             // selectedPrinters[i] = sPrinter;
//           }
//         }
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();

//     getPrinterIPDevice();

//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black.withAlpha(128),
//       body: Container(
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(
//             horizontal: MediaQuery.of(context).size.width / 5,
//             vertical: MediaQuery.of(context).size.height / 7),
//         child: Container(
//           width: double.infinity,
//           height: double.infinity,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: _isLoading
//               ? Container(
//                   padding: EdgeInsets.fromLTRB(10, 50, 10, 50),
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         CircularProgressIndicator(
//                             valueColor: AlwaysStoppedAnimation<Color>(
//                                 primaryColor)),
//                         SizedBox(
//                           height: 20.h,
//                         ),
//                         Text(
//                           loadingInformation,
//                           style: TextStyle(
//                             fontSize: 14,
//                             fontFamily: 'NanumGothic',
//                             color: customBodyText,
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ipPrinter.isNotEmpty
//                         ? Expanded(
//                             child: ListView.builder(
//                               itemCount: ipPrinter.length,
//                               shrinkWrap: true,
//                               physics: const ScrollPhysics(),
//                               itemBuilder: (context, index) {
//                                 return ListTile(
//                                   title: Text(
//                                     'Printer ${index + 1}',
//                                     style: TextStyle(
//                                         fontFamily: "UbuntuBold",
//                                         fontSize: 18,
//                                         color: primaryColor),
//                                   ),
//                                   subtitle: Text(
//                                     ipPrinter[index],
//                                     style: TextStyle(
//                                         fontFamily: "NanumGothic",
//                                         fontSize: 14,
//                                         color: customHeadingText),
//                                   ),
//                                   trailing: SizedBox(
//                                     width: 350.r,
//                                     child: Row(
//                                       mainAxisAlignment: MainAxisAlignment.end,
//                                       children: [
//                                         ElevatedButton(
//                                           style: ElevatedButton.styleFrom(
//                                             backgroundColor: primaryColor,
//                                             minimumSize: const Size(70, 30),
//                                             shape: const RoundedRectangleBorder(
//                                               borderRadius: BorderRadius.all(
//                                                   Radius.circular(50)),
//                                             ),
//                                             elevation: 0,
//                                           ),
//                                           onPressed: () {
//                                             connectPrinterTest(
//                                                 ipPrinter[index]);
//                                           },
//                                           child: Text(
//                                             'Test Print',
//                                             style: TextStyle(
//                                               fontFamily: "UbuntuBold",
//                                               fontSize: 11,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5.w,
//                                         ),
//                                         _connectedPrinter == ipPrinter[index]
//                                             ? ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor:
//                                                       customGreen,
//                                                   minimumSize:
//                                                       const Size(70, 30),
//                                                   shape:
//                                                       const RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 50)),
//                                                   ),
//                                                   elevation: 0,
//                                                 ),
//                                                 onPressed: () {},
//                                                 child: Text(
//                                                   'Set Primary',
//                                                   style: TextStyle(
//                                                     fontFamily: "UbuntuBold",
//                                                     fontSize: 11,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               )
//                                             : ElevatedButton(
//                                                 style: ElevatedButton.styleFrom(
//                                                   backgroundColor: primaryColor,
//                                                   minimumSize:
//                                                       const Size(70, 30),
//                                                   shape:
//                                                       const RoundedRectangleBorder(
//                                                     borderRadius:
//                                                         BorderRadius.all(
//                                                             Radius.circular(
//                                                                 50)),
//                                                   ),
//                                                   elevation: 0,
//                                                 ),
//                                                 onPressed: () {
//                                                   setThisPrinter(
//                                                       ipPrinter[index]);
//                                                 },
//                                                 child: Text(
//                                                   'Set Primary',
//                                                   style: TextStyle(
//                                                     fontFamily: "UbuntuBold",
//                                                     fontSize: 11,
//                                                     color: Colors.white,
//                                                   ),
//                                                 ),
//                                               ),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           )
//                         : Expanded(
//                             child: Center(
//                               child: Text(
//                                 "No Printer Device Found",
//                                 textAlign: TextAlign.center,
//                                 style: const TextStyle(
//                                     fontFamily: 'NanumGothic', fontSize: 18),
//                               ),
//                             ),
//                           ),
//                     Expanded(
//                       child: ListView.builder(
//                         itemCount: stations.length,
//                         shrinkWrap: true,
//                         physics: const ScrollPhysics(),
//                         itemBuilder: (context, index) {
//                           return Container(
//                             margin: EdgeInsets.only(bottom: 5),
//                             child: ListTile(
//                               title: Text(
//                                 stations[index].stationName,
//                                 style: TextStyle(
//                                     fontFamily: "UbuntuBold",
//                                     fontSize: 18,
//                                     color: primaryColor),
//                               ),
//                               trailing: SizedBox(
//                                 width: 300.r,
//                                 child: Container(
//                                   height: 60,
//                                   padding:
//                                       const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                                   decoration: BoxDecoration(
//                                       color: customLightGrey, // Background color
//                                       border: Border.all(
//                                         color: customLightGrey,
//                                       ),
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(50))),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton(
//                                       dropdownColor:
//                                          Colors.white,
//                                       iconEnabledColor:
//                                           Colors.black,
//                                       isExpanded: true,
//                                       hint: const Text(
//                                         "Select Printer",
//                                         style: TextStyle(
//                                           fontFamily: 'NexaRegular',
//                                           color: Colors.grey,
//                                         ),
//                                       ),
//                                       value: selectedPrinters[index],
//                                       // items: ipPrinter.map((val) {
//                                       //   return DropdownMenuItem(
//                                       //     value: val,
//                                       //     child: Text(
//                                       //       val.toString(),
//                                       //       style: TextStyle(
//                                       //         color: ColorForm()
//                                       //             .hexToColor('#000000'),
//                                       //       ),
//                                       //     ),
//                                       //   );
//                                       // }).toList(),
//                                       items: [
//                                         const DropdownMenuItem(
//                                           value: null,
//                                           child: Text(
//                                             'None',
//                                             style: TextStyle(
//                                               fontFamily: 'NexaRegular',
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         const DropdownMenuItem(
//                                           value: 'to Primary',
//                                           child: Text(
//                                             'to Primary',
//                                             style: TextStyle(
//                                               fontFamily: 'NexaRegular',
//                                               color: Colors.grey,
//                                             ),
//                                           ),
//                                         ),
//                                         ...ipPrinter.map((val) {
//                                           return DropdownMenuItem(
//                                             value: val,
//                                             child: Text(
//                                               val.toString(),
//                                               style: TextStyle(
//                                                 color: Colors.black,
//                                               ),
//                                             ),
//                                           );
//                                         }).toList(),
//                                       ],

//                                       onChanged: (value) async {
//                                         SharedPreferences sharedPreferences =
//                                             await SharedPreferences
//                                                 .getInstance();
//                                         setState(() {
//                                           selectedPrinters[index] = value;
//                                         });

//                                         if (value == null) {
//                                           sharedPreferences.remove(
//                                               stations[index].stationName);
//                                         } else {
//                                           sharedPreferences.setString(
//                                               stations[index].stationName,
//                                               value);
//                                         }
//                                         // SharedPreferences sharedPreferences =
//                                         //     await SharedPreferences
//                                         //         .getInstance();
//                                         // setState(() {
//                                         //   selectedPrinters[index] = value;
//                                         // });
//                                         // sharedPreferences.setString(
//                                         //     stations[index].stationName,
//                                         //     value!);
//                                       },
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           // SizedBox(
//                           //   width: 150,
//                           //   child: ElevatedButton(
//                           //     style: ElevatedButton.styleFrom(
//                           //         backgroundColor: primaryColor,
//                           //         minimumSize: const Size(80, 45),
//                           //         shape: const RoundedRectangleBorder(
//                           //           borderRadius:
//                           //               BorderRadius.all(Radius.circular(50)),
//                           //         ),
//                           //         elevation: 0),
//                           //     onPressed: () {},
//                           //     child: const Text(
//                           //       'Disconnect All',
//                           //       style: TextStyle(
//                           //         fontSize: 12,
//                           //         color: Colors.white,
//                           //         fontFamily: 'UbuntuBold',
//                           //       ),
//                           //     ),
//                           //   ),
//                           // ),
//                           // SizedBox(
//                           //   width: 10.w,
//                           // ),
//                           SizedBox(
//                             width: 150,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: primaryColor,
//                                   minimumSize: const Size(80, 45),
//                                   shape: const RoundedRectangleBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(50)),
//                                   ),
//                                   elevation: 0),
//                               onPressed: () {
//                                 Navigator.pop(context);
//                               },
//                               child: const Text(
//                                 'Close Page',
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   color: Colors.white,
//                                   fontFamily: 'UbuntuBold',
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

