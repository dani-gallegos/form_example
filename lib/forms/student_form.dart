import 'package:flutter/material.dart';
import 'package:form_example/models/app.dart';
import 'package:form_example/models/student.dart';
import 'package:form_example/services/student_service.dart';
import 'package:form_example/widgets/checkbox_form_field.dart';
import 'package:provider/provider.dart';

class StudentForm extends StatefulWidget {
  const StudentForm({Key? key}) : super(key: key);

  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _nomController = TextEditingController();
  final _cognomsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nomController.dispose();
    _cognomsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var app = context.watch<AppModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(app.titol),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Text("Menú de l'aplicació"),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              title: Text("Estudiant"),
              onTap: () {
                Navigator.pushNamed(context, '/estudiant');
              },
            ),
            ListTile(
              title: Text("Login"),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nom',
                ),
                autofocus: true,
                controller: _nomController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El text és obligatori';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Cognoms',
                ),
                autofocus: true,
                controller: _cognomsController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El text és obligatori';
                  }
                  return null;
                },
              ),
              CheckboxFormField(
                label: "Accepto les condicions d'ús",
                validator: (value) {
                  if (value == null || value == false) {
                    return "Cal acceptar les condicions d'ús";
                  }
                },
                hint: "Les condicions d'ús són les següents: ...",
                errorColor: Theme.of(context).errorColor,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                    child: Text('Grava'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text('Gravant estudiant')));

                        Student estudiant =
                            new Student.named(_nomController.text, _cognomsController.text);

                        SaveStudent(estudiant);

                        await Future.delayed(Duration(seconds: 1));

                        Navigator.pop(context);
                      }
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
