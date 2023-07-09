import 'package:flutter/material.dart';

import 'admin_report_case_page.dart';

class AdminReportList extends StatefulWidget {
  final String name;
  final String contactnumber;
  final String time;
  final String status;
  final bool isMessageRead;
  const AdminReportList(
      {super.key,
      required this.name,
      required this.contactnumber,
      required this.time,
      required this.status,
      required this.isMessageRead});

  @override
  State<AdminReportList> createState() => _AdminReportListState();
}

class _AdminReportListState extends State<AdminReportList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.name,
      ),
      subtitle: Row(
        children: [
          Text(widget.contactnumber),
          const SizedBox(width: 8),
          Text(widget.status),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.time),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AdminReportCasePage()));
            },
            icon: const Icon(Icons.arrow_forward),
          ),
        ],
      ),
    );
  }
}


// GestureDetector(
//       onTap: () {},
//       child: Container(
//         padding:
//             const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               child: Row(
//                 children: <Widget>[
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: Colors.transparent,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             widget.name,
//                             style: const TextStyle(fontSize: 16),
//                           ),
//                           const SizedBox(
//                             height: 6,
//                           ),
//                           Text(
//                             widget.contactnumber,
//                             style: TextStyle(
//                                 fontSize: 13,
//                                 color: Colors.grey.shade600,
//                                 fontWeight: widget.isMessageRead
//                                     ? FontWeight.bold
//                                     : FontWeight.normal),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Text(
//               widget.time,
//               style: TextStyle(
//                   fontSize: 12,
//                   fontWeight: widget.isMessageRead
//                       ? FontWeight.bold
//                       : FontWeight.normal),
//             ),
//           ],
//         ),
//       ),
//     );