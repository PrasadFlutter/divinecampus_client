import 'package:flutter/material.dart';

import '../../Model/AstrologicalModel.dart';
import '../../api_manager/api_response.dart';

class AstroDataScreen extends StatefulWidget {
  final String month;
  final String day;
  final String religion;
  final String sign;
  final String gender;

  const AstroDataScreen({
    Key? key,
    required this.month,
    required this.day,
    required this.religion,
    required this.sign,
    required this.gender,
  }) : super(key: key);

  @override
  State<AstroDataScreen> createState() => _AstroDataScreenState();
}

class _AstroDataScreenState extends State<AstroDataScreen> {
  bool loader = true;
  List<AstroLogicalDataModel> dailyAstroList = [];

  @override
  void initState() {
    super.initState();
    callapi();
  }

  callapi() async {
    dailyAstroList = await ApiManager().ListAstroData(
      widget.day.toString(),
      widget.month,
      widget.religion,
      widget.sign,
      widget.gender,
    );
    setState(() {
      loader = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loader
        ? Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: [
                      DataColumn(
                        label: Text(
                          'Name',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xffe00040),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Meaning',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xffe00040),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Gender',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xffe00040),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Religion',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            color: Color(0xffe00040),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    rows: List.generate(
                      dailyAstroList
                          .length, // Replace with the number of rows you want
                      (index) => DataRow(
                        cells: [
                          DataCell(
                            Text(
                              dailyAstroList[index].astrologicalName.toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              dailyAstroList[index].astrologicalNameMean
                                  .toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              dailyAstroList[index].astrologicalGender
                                  .toString(),
                            ),
                          ),
                          DataCell(
                            Text(
                              dailyAstroList[index].astrologicalReligion
                                  .toString(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
