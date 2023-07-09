import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

const List<Widget> filterChoices = <Widget>[
  Text('Week'),
  Text('Month'),
  Text('Year'),
];
final List<DengueData> chartData = [
  DengueData(4, 5),
  DengueData(5, 2),
  DengueData(6, 2),
  DengueData(7, 3),
  DengueData(8, 4)
];
late ZoomPanBehavior _zoomPanBehavior;

class AdminDataVizPage extends StatefulWidget {
  const AdminDataVizPage({super.key});

  @override
  State<AdminDataVizPage> createState() => _AdminDataVizPageState();
}

class _AdminDataVizPageState extends State<AdminDataVizPage> {
  final List<bool> _selectedChoice = <bool>[true, false, false];
  bool vertical = false;
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
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        // Enables pinch zooming
        enablePinching: true,
        enableMouseWheelZooming: true);
    super.initState();
  }

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
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 8.0,
              children: List.generate(
                choices.length,
                (index) {
                  return Center(
                    child: SelectCard(
                      choice: choices[index],
                    ),
                  );
                },
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
                    const ListTile(
                      title: Text(''),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    SfCartesianChart(
                      title: ChartTitle(
                          text: "Number of Reported Cases Per Week (2023)"),
                      zoomPanBehavior: _zoomPanBehavior,
                      enableAxisAnimation: true,
                      primaryXAxis:
                          CategoryAxis(title: AxisTitle(text: "Week")),
                      // primaryYAxis: CategoryAxis(title: AxisTitle(text: "Number of Cases")),
                      series: <ChartSeries>[
                        // Renders line chart

                        LineSeries<DengueData, double>(
                            dataSource: chartData,
                            xValueMapper: (DengueData data, _) => data.week,
                            yValueMapper: (DengueData data, _) => data.numbers),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            _gap(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 16),
                  TextButton(
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
                  Visibility(
                    visible: _isShow,
                    child: Column(
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     const SizedBox(width: 16),
                        //     _selectedDateRange == null
                        //         ? const Text("Select a date")
                        //         : Column(
                        //             crossAxisAlignment: CrossAxisAlignment.start,
                        //             children: [
                        //               Text(
                        //                   "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}"),
                        //               const SizedBox(height: 4),
                        //               Text(
                        //                   "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}"),
                        //             ],
                        //           ),
                        //     const SizedBox(width: 16),
                        //     ElevatedButton(
                        //       onPressed: _show,
                        //       style: ElevatedButton.styleFrom(
                        //         shape: const StadiumBorder(),
                        //         //side: const BorderSide(color: Colors.red, width: 2),
                        //       ),
                        //       child: const Text('Date Range'),
                        //     ),
                        //     const SizedBox(width: 16),
                        //   ],
                        // ),
                        // const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Wrap(
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(width: 16),
                                    const Text('Filter by : '),
                                    const SizedBox(width: 16),
                                    ToggleButtons(
                                      direction: vertical
                                          ? Axis.vertical
                                          : Axis.horizontal,
                                      onPressed: (int index) {
                                        // All buttons are selectable.
                                        setState(() {
                                          for (int i = 0;
                                              i < _selectedChoice.length;
                                              i++) {
                                            _selectedChoice[i] = i == index;
                                          }
                                        });
                                      },
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8)),
                                      selectedBorderColor: Colors.green[700],
                                      selectedColor: Colors.white,
                                      fillColor: Colors.green[200],
                                      color: Colors.green[400],
                                      constraints: const BoxConstraints(
                                        minHeight: 40.0,
                                        minWidth: 80.0,
                                      ),
                                      isSelected: _selectedChoice,
                                      children: filterChoices,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
                    const ListTile(
                      title: Text('Dengue Cases as of June 01, 2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    Image.asset('images/boba-bar-graph.png'),
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
                    const ListTile(
                      title: Text('Age group of Dengue Patients'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    Image.asset('images/piechart.png'),
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
                    const ListTile(
                      title: Text('Dengue cases as of January to July 2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    Image.asset('images/boba-two-graphs.png'),
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

class DengueData {
  DengueData(this.week, this.numbers);
  final double week;
  final double numbers;
}

class Choice {
  const Choice({required this.title, required this.number});
  final String title;
  final String number;
}

const List<Choice> choices = <Choice>[
  Choice(title: 'Reported Cases : July', number: "12"),
  Choice(title: 'Confirmed', number: "5")
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key, required this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    //final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
        color: Colors.white70,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Text(
                  choice.number,
                  style: const TextStyle(fontSize: 100),
                )),
                Text(
                  choice.title,
                  style: const TextStyle(fontSize: 18),
                ),
              ]),
        ));
  }
}
