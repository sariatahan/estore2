import 'package:estore2/Screens/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:estore2/Registrations/log in.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupPage extends StatefulWidget {
  static const String id = 'signup_page';

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool _showSpinner = false;

  Future<void> signUp() async {
    String email = _emailController.text;
    String username = _usernameController.text;
    String password = _passwordController.text;

    setState(() {
      _showSpinner = true;
    });

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Registration successful, you can navigate to the desired screen
      // Example:
      Navigator.pushNamed(context, Login.id);
    } catch (e) {
      if (e is FirebaseAuthException) {
        String errorMessage;

        if (e.code == 'email-already-in-use') {
          errorMessage = 'هذا البريد الإلكتروني مستخدم بالفعل.';
        } else if (e.code == 'invalid-email') {
          errorMessage = 'عنوان البريد الإلكتروني غير صحيح.';
        } else {
          errorMessage = 'حدث خطأ أثناء التسجيل. الرجاء المحاولة مرة أخرى.';
        }

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("فشل تسجيل الدخول"),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
    Future<void> _signInWithGoogle() async {
      try {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // User is successfully logged in, navigate to HomeScreen
        Navigator.pushNamed(context, HomeScreen.id);
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('فشل تسجيل الدخول'),
              content: Text(
                  'حدث خطأ أثناء تسجيل الدخول باستخدام حساب Google. الرجاء المحاولة مرة أخرى.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }

      setState(() {
        _showSpinner = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Container(
                child: Text(
                  'انشاء حساب ',
                  style: GoogleFonts.almarai(
                    height: 5,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF515C6F),
                  ),
                ),
              ),
              Container(
                height: 260,
                width: size.width * 0.8,
                margin: EdgeInsets.all(25.0),
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(27.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 15,
                      blurRadius: 7,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'USERNAME',
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'PASSWORD',
                        prefixIcon: Icon(Icons.lock_open_sharp),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF008080),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                  onPressed: signUp,
                  child: _showSpinner
                      ? SpinKitFadingCircle(
                          color: Colors.white,
                          size: 25.0,
                        )
                      : Text(
                          'انشاء الحساب ',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF008080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(65.0),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      height: 130,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(right: 1),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()),
                                  );
                                },
                                child: Text(
                                  'سجل دخول الان',
                                  style: GoogleFonts.almarai(
                                    height: 1,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: const Color(0xFF008080),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'تملك حساب؟',
                            style: GoogleFonts.almarai(
                              height: 1,
                              fontSize: 15.0,
                              color: const Color(0xFF515C6F),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
