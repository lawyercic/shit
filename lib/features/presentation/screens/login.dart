import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lawer/features/presentation/controller/bloc/lawyerd%20bloc/lawyerd_bloc.dart';
import 'package:lawer/features/presentation/screens/home.dart';
import 'package:lawer/features/presentation/screens/signup.dart';

class LogInScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Future signin() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword
      (email: _emailController.text.trim(),
      password: _passwordController.text.trim(),);
  }


  @override
  void  dispose(){

    _emailController.dispose();
    _passwordController.dispose();
  }
  final keyLogin = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: keyLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Image
                  SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: 90,
                    child: Image.asset(
                      'assets/ask.png',
                      height: 90,
                    ),
                    backgroundColor: Color(0xffF0CC41),
                  ),

                  SizedBox(height: 20),

                  // Title
                  Text(
                    ''
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),

                  Text(
                    ''
                    'اهلا بيك',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Email Textfield
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب ادخال عنوان البريد الالكتروني';
                            }
                            return null;
                          },
                          controller:
                          _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'عنوان البريد الإلكتروني'),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  //pasword testfiled
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'يجب ادخال كلمه السر';
                            }
                            return null;
                          },
                          controller:
                              _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'كلمة السر'),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  //sign in bottom
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: GestureDetector(
                      onTap: signin,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xffF0CC41),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text('تسجيل الدخول',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Text sign up

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => SignupScreen()),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "انشاء حساب",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF0CC41)),
                          )),
                      SizedBox(
                        width: 5,
                      ),
                      Text(('ليس لديك حساب ؟ قم ب')),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
