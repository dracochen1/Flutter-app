import 'package:flutter/material.dart';
import 'package:todolist1/model/task.dart';
import 'package:todolist1/screen/tasks.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
        '/welcome': (context) => TaskList
          (tasks:
        [
          Task(1,"Faire le ménage",false,"nétoyer la maison"),
          Task(2,"Planter des fleur",false,"Plutot des roses blanches cette année"),
          Task(3,"Payer les impots",true,"Ca fait mal"),
          Task(4,"Aller voir les grands parents",false,"Un bon repas en vue"),
          Task(4,"Aller voir les grands parents",false,"Un bon repas en vue")
        ]
        ),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }
  Widget build(BuildContext context) {
    return Form(
      onChanged: _updateFormProgress,
        child: SingleChildScrollView(
        child: Column(
        children: [
          Text('Sign up', style: Theme
              .of(context)
              .textTheme
              .headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white;
                } else {
                  return Colors.white;
                }
              }),
              backgroundColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.white;
                } else {
                  return Colors.blue;
                }
              }),
            ),
            onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
            child: Text('Sign up'),
          ),
        ],
      ),
        ),
    );
  }
}
