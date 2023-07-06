import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AdminReportCasePage extends StatefulWidget {
  const AdminReportCasePage({super.key});

  @override
  State<AdminReportCasePage> createState() => _AdminReportCasePageState();
}

class _AdminReportCasePageState extends State<AdminReportCasePage> {
  bool _headache = false;
  bool _bodymalaise = false;
  bool _myalgia = false;
  bool _arthralgia = false;
  bool _retroOrbitalPain = false;
  bool _anorexia = false;
  bool _nausea = false;
  bool _vomiting = false;
  bool _diarrhea = false;
  bool _flushedSkin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report a case'),
        leading: const BackButton(),
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text("Report a case",
                            style: Theme.of(context).textTheme.headlineSmall),
                      ),
                      _gap(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("Please enter the following details.",
                            style: Theme.of(context).textTheme.bodySmall,
                            textAlign: TextAlign.center),
                      ),
                      _gap(),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      IntlPhoneField(
                        initialCountryCode: 'PH',
                        decoration: const InputDecoration(
                          labelText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          ),
                        ),
                        onChanged: (phone) {},
                        onCountryChanged: (country) {},
                      ),
                      _gap(),
                      TextFormField(
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          labelText: 'Address',
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
                              value: _headache,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _headache = value;
                                });
                              },
                              title: const Text('Sakit ng ulo'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _bodymalaise,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _bodymalaise = value;
                                });
                              },
                              title: const Text('Paghihina ng katawan'),
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
                              value: _myalgia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _myalgia = value;
                                });
                              },
                              title: const Text('Pananakit ng kalamnan'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _arthralgia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _arthralgia = value;
                                });
                              },
                              title: const Text('Sakit ng kasukasuan'),
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
                              value: _retroOrbitalPain,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _retroOrbitalPain = value;
                                });
                              },
                              title: const Text('Pananakit ng mata sa likod'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _anorexia,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _anorexia = value;
                                });
                              },
                              title: const Text('Kawalan ng ganang kumain'),
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
                              value: _nausea,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _nausea = value;
                                });
                              },
                              title: const Text('Pagkahilo o Sakit sa tiyan'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _vomiting,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _vomiting = value;
                                });
                              },
                              title: const Text('Pagsusuka'),
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
                              value: _diarrhea,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _diarrhea = value;
                                });
                              },
                              title: const Text('Pagtatae'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              value: _flushedSkin,
                              onChanged: (value) {
                                if (value == null) return;
                                setState(() {
                                  _flushedSkin = value;
                                });
                              },
                              title: const Text(
                                  'Pamumula ng balat, pangangati o pamamantal'),
                              controlAffinity: ListTileControlAffinity.leading,
                              dense: true,
                              contentPadding: const EdgeInsets.all(0),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
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
