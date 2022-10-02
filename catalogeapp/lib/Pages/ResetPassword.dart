import 'package:catalogeapp/Pages/loginpage.dart';
import 'package:catalogeapp/utils/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:basic_utils/basic_utils.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  final _formkey = GlobalKey<FormState>();

  bool changebutton = false;

  bool isLoading = false;

  Future<FirebaseApp>? _firebaseapp;
  TextEditingController email = TextEditingController();
  bool isloading = false;

  void inistate() {
    super.initState();
    _firebaseapp = Firebase.initializeApp();
  }

  moveToLogin(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(Duration(seconds: 2));
      await Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) {
        return LoginPage();
      }));
      setState(() {
        changebutton = false;
      });
    }
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Form(
            key: _formkey,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    ClipRRect(
                      child: Image.asset('assets/images/logo04.png'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Reset Link will be sent to your email id',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "Email cannot be empty";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: (() async {
                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email.text);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text('Link is sent on email'),
                          duration: const Duration(milliseconds: 2000),
                        ));
                        moveToLogin(context);
                      }),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 2000),
                        width: changebutton ? 50 : 150,
                        height: 50,
                        alignment: Alignment.center,
                        child: changebutton
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                "Send",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 50 : 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
