import 'package:flutter/material.dart';

class AdminDengueFormPage extends StatefulWidget {
  const AdminDengueFormPage({super.key});

  @override
  State<AdminDengueFormPage> createState() => _AdminDengueFormPageState();
}

class _AdminDengueFormPageState extends State<AdminDengueFormPage> {
  String? valueAdmitted;
  String? valueVaccine;
  String? clinicalClass;
  String? caseClass;
  String? ns1;
  String? igg;
  String? igm;
  String? pcr;
  String? outcome;
  final listvalueAdmitted = ['Yes', 'No'];
  final listvalueVaccine = ['Yes', 'No'];
  final listclinicalClass = [
    'N: No warning signs',
    'W: With warning signs',
    'S: Severe Dengue'
  ];
  final listcaseClass = ['S : Suspect', 'P : Probable', 'C : Confirmed'];
  final listNS1 = [
    'P : Positive',
    'N : Negative',
    'E : Equivocal',
    'PR : Pending Result',
    'N/A : Not Done'
  ];
  final listIgg = [
    'P : Positive',
    'N : Negative',
    'E : Equivocal',
    'PR : Pending Result',
    'N/A : Not Done'
  ];
  final listIgm = [
    'P : Positive',
    'N : Negative',
    'E : Equivocal',
    'PR : Pending Result',
    'N/A : Not Done'
  ];
  final listPcr = [
    'P : Positive',
    'N : Negative',
    'E : Equivocal',
    'PR : Pending Result',
    'N/A : Not Done'
  ];
  final listOutcome = ['A : Alive', 'D : Deceased'];
  DateTime selectedDate = DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1999, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dengue Form'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Form(
          child: Center(
            child: Card(
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
                        child: Text(
                          "Case Report Form",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Patient No.',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const VerticalDivider(
                            color: Colors.black,
                            width: 20,
                            thickness: 1,
                            indent: 20,
                            endIndent: 0,
                          ),
                          const Text("Admitted? "),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: listvalueAdmitted
                                      .map(buildMenuItem)
                                      .toList(),
                                  onChanged: (value) =>
                                      setState(() => valueAdmitted = value),
                                  value: valueAdmitted,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Patient's Full name",
                          //hintText: 'Enter your name',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date admitted/\nseen/consulted"),
                          const SizedBox(width: 32),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text(
                            "Date onset of Illness\n(First Symptoms)",
                            style: TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("Vaccinated with \nDengue Vaccine?"),
                          const SizedBox(width: 50),
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: listvalueVaccine
                                      .map(buildMenuItem)
                                      .toList(),
                                  onChanged: (value) =>
                                      setState(() => valueVaccine = value),
                                  value: valueVaccine,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date of First\nVaccination(if Yes)"),
                          const SizedBox(width: 13),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date of Second\nVaccination(if Yes)"),
                          const SizedBox(width: 12),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("Clinical\nClassification "),
                          const SizedBox(width: 4),
                          Flexible(
                            child: Container(
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items: listclinicalClass
                                      .map(buildMenuItem)
                                      .toList(),
                                  onChanged: (value) =>
                                      setState(() => clinicalClass = value),
                                  value: clinicalClass,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      //!NS1
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'NS1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("NS1 Result"),
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
                                  items: listNS1.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => ns1 = value),
                                  value: ns1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date Done"),
                          const SizedBox(width: 12),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      //!IGG
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IgG',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("IgG Result"),
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
                                  items: listIgg.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => igg = value),
                                  value: igg,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date Done"),
                          const SizedBox(width: 12),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      //!IGM
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'IgM',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("IgM Result"),
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
                                  items: listIgm.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => igm = value),
                                  value: igm,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date Done"),
                          const SizedBox(width: 12),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      //!PCR
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'PCR',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("PCR Result"),
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
                                  items: listPcr.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => pcr = value),
                                  value: pcr,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: <Widget>[
                          const Text("Date Done"),
                          const SizedBox(width: 12),
                          Expanded(
                            child:
                                Text("${selectedDate.toLocal()}".split(' ')[0]),
                          ),
                          ElevatedButton(
                            onPressed: () => _selectDate(context),
                            child: const Text('Select date'),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("Case\nClassification "),
                          const SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items:
                                      listcaseClass.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => caseClass = value),
                                  value: caseClass,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      _gap(),
                      Row(
                        children: [
                          const Text("Outcome "),
                          const SizedBox(width: 38),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8.0)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  items:
                                      listOutcome.map(buildMenuItem).toList(),
                                  onChanged: (value) =>
                                      setState(() => outcome = value),
                                  value: outcome,
                                ),
                              ),
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
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              /// do something
                            }
                          },
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
DropdownMenuItem<String> buildMenuItem(String admitted) => DropdownMenuItem(
      value: admitted,
      child: Text(admitted),
    );
