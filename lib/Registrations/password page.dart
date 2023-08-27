import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordPage extends StatelessWidget {
  static const String id = 'Password_page';
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              Text(
                'نسيت كلمة السر',
                style: GoogleFonts.almarai(
                  height: 7,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF515C6F),
                ),
              ),
              Text(
                'قم بإدخال البريد الإلكتروني الذي قمت\n بالتسجيل به سيتم إرسال رابط  \nلك لإعادة تعيين كلمة المرور',
                textAlign: TextAlign.center,
                style: GoogleFonts.almarai(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF515C6F),
                ),
              ),
              SizedBox(height: 40),
              PasswordInput(),
              SizedBox(height: 30),
              LoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 100,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(27.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 10,
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'EMAIL',
              prefixIcon: Icon(Icons.email_outlined),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      onPressed: () {
        // يمكنك وضع الإجراء المرتبط بالضغط على الزر هنا
      },
      child: Container(
        width: size.width * 0.8,
        height: 30,
        decoration: BoxDecoration(
          color: Color(0xFF008080),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [


            Text(
              'تسجيل دخول',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(width: 25),
            Icon(
              Icons.add_alarm,
              color: Colors.white,
            ),
          ],
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF008080),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(65.0),
        ),
      ),
    );
  }
}