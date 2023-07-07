import 'package:flutter/material.dart';
import 'package:prototype_denguecare/pages/admin_report_content_model.dart';
import 'package:prototype_denguecare/pages/admin_report_list.dart';

class AdminReportPage extends StatefulWidget {
  const AdminReportPage({super.key});

  @override
  State<AdminReportPage> createState() => _AdminReportPageState();
}

class _AdminReportPageState extends State<AdminReportPage> {
  List<ReportContents> reportContents = [
    ReportContents(
        name: "Jane Russel", contactnumber: "09123424323", time: "Now"),
    ReportContents(
        name: "Gladys Murphy", contactnumber: "09123424323", time: "Yesterday"),
    ReportContents(
        name: "Jorge Henry", contactnumber: "09123424323", time: "31 Mar"),
    ReportContents(
        name: "Philip Fox", contactnumber: "09123424323", time: "28 Mar"),
    ReportContents(
        name: "Debra Hawkins", contactnumber: "09123424323", time: "23 Mar"),
    ReportContents(
        name: "Jacob Pena", contactnumber: "09123424323", time: "17 Mar"),
    ReportContents(
        name: "Andrey Jones", contactnumber: "09123424323", time: "24 Feb"),
    ReportContents(
        name: "John Wick", contactnumber: "09123424323", time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 16),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AdminReportList(
                      name: reportContents[index].name,
                      contactnumber: reportContents[index].contactnumber,
                      time: reportContents[index].time,
                      isMessageRead: (index == 0 || index == 3) ? true : false);
                }),
          ],
        ),
      ),
    );
  }
}
