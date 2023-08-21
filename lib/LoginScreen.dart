import 'package:flutter/material.dart';
import 'package:muliti_role_base_app/AdminScreen%20.dart';
import 'package:muliti_role_base_app/HomeScreen.dart';
import 'package:muliti_role_base_app/StudentScreen.dart';
import 'package:muliti_role_base_app/TeacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final typecontroller = TextEditingController();

  String dropdownValue = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Login Screen'),
        titleTextStyle: TextStyle(color: Colors.black),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailcontroller,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordcontroller,
              decoration: InputDecoration(
                hintText: 'Password',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: agecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(
              height: 30,
            ),
            DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_downward),
              items: <String>['Student', 'Teacher', 'Admin']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
                controller:
                typecontroller;
              },
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('email', emailcontroller.text.toString());
                sp.setString('age', agecontroller.text.toString());
                sp.setBool('islogin', true);
                sp.setString('UserType', dropdownValue.toString());
                String type = sp.getString('UserType') ?? '';
                if (type == 'Student') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                }
                if (type == 'Teacher') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TeacherScreen()));
                }
                if (type == 'Admin') {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminScreen()));
                }

                //async
                //   Future<SharedPreferences> _sp = SharedPreferences.getInstance();
                //   final SharedPreferences sp = await _sp;
                //   sp.setString('name', 'Shivani');
                //   sp.setInt("age", 19);
                //   sp.setBool('islogin', false);

                //   print(sp.getInt('age'));
                //   print(sp.getString('name'));
                //   print(sp.getBool('islogin'));

                //   sp.remove('name');
                //   print(sp.get('name'));
              },
              child: Container(
                color: Colors.amber,
                height: 50,
                width: double.infinity,
                child: Center(
                  child: Text('LogIn'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<void> shivani() async {
  await Future.delayed(Duration(seconds: 5));
  print("delayed");
}
