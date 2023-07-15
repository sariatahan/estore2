import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatelessWidget {
  static const String id = 'signup_page';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.0),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'EMAIL',
                        prefixIcon: Icon(
                          Icons.email_outlined
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
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
                        prefixIcon: Icon(
                          Icons.lock_open_sharp
                        ),
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
                  onPressed: () {},
                  child: Text(
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
                                  Navigator.pushNamed(context, SignupPage.id);

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