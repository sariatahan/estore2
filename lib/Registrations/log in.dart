import 'package:estore2/Registrations/password%20page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:estore2/Registrations/sign_up.dart';
import 'package:estore2/Screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool rememberMe = false;
  bool isLoading = false;

  String buttonText = "قم بإنشاء حساب الآن";

  Future<void> _loginUser() async {
    setState(() {
      isLoading = true;
    });
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
      // User is successfully logged in, navigate to HomeScreen
      Navigator.pushNamed(context, HomeScreen.id);
    } on FirebaseAuthException catch (e) {
      String errorMessage;

      if (e.code == 'user-not-found') {
        errorMessage = 'لم يتم العثور على مستخدم بهذا البريد الإلكتروني.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'كلمة المرور غير صحيحة.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'عنوان البريد الإلكتروني غير صحيح.';
      } else {
        errorMessage = 'حدث خطأ أثناء تسجيل الدخول. الرجاء المحاولة مرة أخرى.';
      }

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('فشل تسجيل الدخول'),
            content: Text(errorMessage),
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
      isLoading = false;
    });

  }
  void _handleGoogleSignIn() async {
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
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: SingleChildScrollView(
        child: Container(
          height: null,
          width: size.width,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                'تسجيل الدخول',
                style: GoogleFonts.almarai(
                  height: 5,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF515C6F),
                ),
              ),
              Container(
                height: 200,
                width: size.width * 0.8,
                margin: EdgeInsets.all(25.0),
                padding: EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(27.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
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
                        labelText: 'USERNAME / EMAIL',
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
                        prefixIcon: Icon(
                          Icons.lock,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: size.width * 0.8,
                height: 30,
                decoration: BoxDecoration(
                  color: Color(0xFF008080),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                  onPressed: isLoading ? null : _loginUser,
                  child: isLoading
                      ? SpinKitFadingCircle(
                          color: Colors.white,
                          size: 25.0,
                        )
                      : Text(
                          'تسجيل دخول',
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
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, PasswordPage.id);
                      },
                      child: Text(
                        'هل نسيت كلمة السر؟',
                        style: GoogleFonts.almarai(
                          height: 1,
                          color: Color(0xFF515C6F),
                          fontStyle: FontStyle.normal,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'تذكرني',
                          style: GoogleFonts.almarai(
                            height: 1,
                            color: Color(0xFF515C6F),
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                        Container(
                          child: Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value!;
                              });
                            },
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(right: 1),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, SignupPage.id);
                                },
                                child: Text(
                                  'قم بإنشاء حساب الآن',
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
                            'لا تملك حساب؟',
                            style: GoogleFonts.almarai(
                              height: 1,
                              fontSize: 15.0,
                              color: const Color(0xFF515C6F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '______________',
                          style: TextStyle(
                            color: Color(0xFF008080),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'أو',
                          style: TextStyle(
                            color: Color(0xFF008080),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '________________',
                          style: TextStyle(
                            color: Color(0xFF008080),
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: size.width * 0.8,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFF008080),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ElevatedButton(
                  onPressed: _handleGoogleSignIn,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'images/google.png',
                        width: 25,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 15),
                      Text(
                        'سجل دخول عن طريق',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF008080),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
