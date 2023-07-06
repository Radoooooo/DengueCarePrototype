import 'package:flutter/material.dart';

class AdminDataVizPage extends StatefulWidget {
  const AdminDataVizPage({super.key});

  @override
  State<AdminDataVizPage> createState() => _AdminDataVizPageState();
}

class _AdminDataVizPageState extends State<AdminDataVizPage> {
  DateTimeRange? _selectedDateRange;
  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime.now(),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      //print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  bool _isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Analysis'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.print),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _gap(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () {
                    setState(
                      () {
                        _isShow = !_isShow;
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    //side: const BorderSide(color: Colors.red, width: 2),
                  ),
                  child: const Text('Filter'),
                ),
              ],
            ),
            _gap(),
            Visibility(
              visible: _isShow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: _show,
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      //side: const BorderSide(color: Colors.red, width: 2),
                    ),
                    child: const Text('Date Range'),
                  ),
                  const SizedBox(width: 16),
                  _selectedDateRange == null
                      ? const Text("Select a date")
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}"),
                            const SizedBox(height: 4),
                            Text(
                                "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}"),
                          ],
                        ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(
                        () {
                          _selectedDateRange == null;
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      //side: const BorderSide(color: Colors.red, width: 2),
                    ),
                    child: const Text('Clear'),
                  ),
                ],
              ),
            ),
            _gap(),
            GestureDetector(
              onTap: (() {}),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset('images/boba-bar-graph.png'),
                    const ListTile(
                      title: Text('Dengue Cases as of June 01, 2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {}),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset('images/piechart.png'),
                    const ListTile(
                      title: Text('Age group of Dengue Patients'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {}),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Image.asset('images/boba-two-graphs.png'),
                    const ListTile(
                      title: Text('Dengue cases as of January to July 2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _gap() => const SizedBox(height: 8);
