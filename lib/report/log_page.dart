import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:squadra_pos/Database/database_helper.dart';
import 'package:squadra_pos/refactor/data/models/sql_lite/get/sqllite_log/g_log.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class LogPage extends StatefulWidget {
  const LogPage({super.key});

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {
  bool logLoading = false;

  final dbHelper = DatabaseHelper();

  var logs = <LogLiteModel>[];

  void getLogLite() async {
    setState(() {
      logLoading = true;
    });

    final response = await dbHelper.getLogLite();

    if (mounted) {
      setState(() {
        logs = response.map((model) => LogLiteModel.fromJson(model)).toList();

        logLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getLogLite();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.fromLTRB(100.r, 50.r, 100.r, 50.r),
        color: customWhite3,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: primaryColor, width: 1),
                  left: BorderSide(color: primaryColor, width: 1),
                  right: BorderSide(color: primaryColor, width: 1),
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(21),
                  topRight: Radius.circular(21),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: Table(
                  columnWidths: {
                    5: FixedColumnWidth(150.r),
                    6: FixedColumnWidth(150.r),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(color: primaryColor),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Date Time',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "UbuntuBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Transaction Number',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "UbuntuBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Return Status',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "UbuntuBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Text(
                            'Status',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: "UbuntuBold",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            logLoading
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            primaryColor)),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                                color: customRegularGrey,
                                width: 1), // BORDER KIRI
                            right: BorderSide(
                                color: customRegularGrey,
                                width: 1), // BORDER KANAN
                            bottom: BorderSide(
                                color: customRegularGrey,
                                width: 1), // BORDER BAWAH
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                          child: Table(
                            // columnWidths: {
                            //   5: FixedColumnWidth(150.r),
                            //   6: FixedColumnWidth(150.r),
                            // },
                            children: [
                              ...logs.asMap().entries.map((entry) {
                                int index = entry.key;
                                var res = entry.value;
                                return TableRow(
                                  decoration: BoxDecoration(
                                    color: index % 2 == 0 ? customWhite3 : Colors.white,
                                  ),
                                  children: buildListTrans(res),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  List<TableCell> buildListTrans(res) {
    return [
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            res.dateTime.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              color: customHeadingText,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            res.transactionNumber.toString(),
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              color: customHeadingText,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            res.statusReturn.toString(), // Ganti sesuai field data
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              color: customHeadingText,
            ),
          ),
        ),
      ),
      TableCell(
        verticalAlignment: TableCellVerticalAlignment.middle,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            res.statusMessage.toString(), // Ganti sesuai field data
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'NanumGothic',
              fontSize: 10.sp,
              overflow: TextOverflow.ellipsis,
              color: customHeadingText,
            ),
          ),
        ),
      ),
    ];
  }
}
