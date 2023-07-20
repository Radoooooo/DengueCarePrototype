import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AdminReportCasePage extends StatefulWidget {
  const AdminReportCasePage({super.key});

  @override
  State<AdminReportCasePage> createState() => _AdminReportCasePageState();
}

class _AdminReportCasePageState extends State<AdminReportCasePage> {
  bool _headache = true;
  bool _bodymalaise = false;
  bool _myalgia = false;
  bool _arthralgia = false;
  bool _retroOrbitalPain = false;
  bool _anorexia = false;
  bool _nausea = true;
  bool _vomiting = true;
  bool _diarrhea = false;
  bool _flushedSkin = true;
  final bool _fever = true;
  final bool _lowPlateLet = true;
  String? value;
  final sex = ['Male', 'Female'];
  String? valueStatus;
  final status = ['Suspect', 'Probable', 'Confirmed'];
  String? valueAdmitted;
  final admitted = ["Yes", "No"];
  String? valueRecovered;
  final recovered = ["Yes", "No"];

  DateTime selectedDateofSymptoms = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateofSymptoms,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDateofSymptoms) {
      setState(() {
        selectedDateofSymptoms = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case report'),
        leading: const BackButton(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: Form(
          child: Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                constraints: const BoxConstraints(maxWidth: 400),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        enabled: false,
                        decoration: const InputDecoration(
                          labelText: 'Jane Russel',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              enabled: false,
                              decoration: const InputDecoration(
                                labelText: '8',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: sex.map(buildMenuItem).toList(),
                                  value: sex[1],
                                  //hint: const Text('Sex'),
                                  onChanged: null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      IntlPhoneField(
                        enabled: false,
                        initialCountryCode: 'PH',
                        decoration: const InputDecoration(
                          labelText: '9151234123',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {},
                        onCountryChanged: (country) {},
                      ),
                      _gap(),
                      TextFormField(
                        enabled: false,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'KM.11, FORESTAL',
                          hintText: 'Enter your address (optional)',
                          prefixIcon: Icon(Icons.home),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Symptoms",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      _gap(),
                      Row(
                        //! row for headache & body malaise
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _headache,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _headache = value;
                                });
                              },
                              title: const Text('Headache'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _bodymalaise,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _bodymalaise = value;
                                });
                              },
                              title: const Text('Body Malaise'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //! row for Myalgia & Arthralgia
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _myalgia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _myalgia = value;
                                });
                              },
                              title: const Text('Myalgia'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _arthralgia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _arthralgia = value;
                                });
                              },
                              title: const Text('Arthralgia'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //! row for retro_orbital_pain & anorexia
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _retroOrbitalPain,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _retroOrbitalPain = value;
                                });
                              },
                              title: const Text('Retro Orbital Pain'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _anorexia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _anorexia = value;
                                });
                              },
                              title: const Text('Anorexia'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //! row for nausea & vomiting
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _nausea,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _nausea = value;
                                });
                              },
                              title: const Text('Nausea'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _vomiting,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _vomiting = value;
                                });
                              },
                              title: const Text('Vomiting'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //! row for Diarrhea & Flushed skin and Skin rash
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _diarrhea,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _diarrhea = value;
                                });
                              },
                              title: const Text('Diarrhea'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _flushedSkin,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _flushedSkin = value;
                                });
                              },
                              title: const Text('Rashes'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        //! row for On and off fever AND Low platelet count
                        children: <Widget>[
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _fever,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _diarrhea = value;
                                });
                              },
                              title: const Text('On and off fever'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              enabled: false,
                              value: _lowPlateLet,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _flushedSkin = value;
                                });
                              },
                              title: const Text('Low platelet count'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Status : "),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: status.map(buildMenuItemStatus).toList(),
                                value: valueStatus,
                                hint: const Text(' '),
                                onChanged: (value) =>
                                    setState(() => valueStatus = value),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Container(
                        margin: const EdgeInsets.all(3.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Date of first symptom:"),
                                const SizedBox(width: 16),
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  child: const Text('Select date'),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Selected date:"),
                                const SizedBox(width: 16),
                                Text("${selectedDateofSymptoms.toLocal()}"
                                    .split(' ')[0]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _gap(),
                      Container(
                        margin: const EdgeInsets.all(3.0),
                        padding: const EdgeInsets.all(3.0),
                        constraints: const BoxConstraints(maxWidth: 400),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text("Patient Admitted? : "),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      items: admitted
                                          .map(buildMenuItemAdmitted)
                                          .toList(),
                                      value: valueAdmitted,
                                      hint: const Text(' '),
                                      onChanged: (value) =>
                                          setState(() => valueAdmitted = value),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text("If YES :")],
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    enabled: true,
                                    decoration: const InputDecoration(
                                      labelText: 'Hospital name',
                                      prefixIcon:
                                          Icon(Icons.local_hospital_rounded),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      _gap(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Patient Recovered? : "),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                items: recovered
                                    .map(buildMenuItemRecovered)
                                    .toList(),
                                value: valueRecovered,
                                hint: const Text(' '),
                                onChanged: (value) =>
                                    setState(() => valueRecovered = value),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget _gap() => const SizedBox(height: 16);
DropdownMenuItem<String> buildMenuItem(String sex) => DropdownMenuItem(
      enabled: false,
      value: sex,
      child: Text(sex),
    );

DropdownMenuItem<String> buildMenuItemStatus(String status) => DropdownMenuItem(
      value: status,
      child: Text(status),
    );
DropdownMenuItem<String> buildMenuItemAdmitted(String admitted) =>
    DropdownMenuItem(
      value: admitted,
      child: Text(admitted),
    );
DropdownMenuItem<String> buildMenuItemRecovered(String recovered) =>
    DropdownMenuItem(
      value: recovered,
      child: Text(recovered),
    );
