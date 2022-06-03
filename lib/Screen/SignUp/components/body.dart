import 'package:flutter/material.dart';
import 'package:selibu/Screen/Login/login.dart';
import 'package:selibu/components/punya_akuncek.dart';
import 'package:selibu/Screen/Login/component/background.dart';
import 'package:selibu/components/rounded_button.dart';
import 'package:selibu/constants.dart';

bool seePass = true;

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    // Textfield Controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Selamat Datang Di Selibu",
              style: TextStyle(
                fontFamily: "Made-Tommy",
                fontWeight: FontWeight.w700,
                fontSize: 28
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            const Text(
              "Yuk, Bikin Akunmu Sendiri!",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 24),
            ),
      
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.20),
                    blurRadius: 20
                  )
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color(0XFF838383),
                  ),
                  hintText: "Email",
                  border: InputBorder.none
                ),
              ),
            ),
      
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.20),
                    blurRadius: 20
                  )
                ],
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: seePass,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: const Icon(
                    Icons.lock,
                    color: Color(0xFF838383),
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.visibility,
                      color: Color(0xFF838383),
                    ),
                    onPressed: (){
                      setState(() {
                        seePass = !seePass;
                      });
                    },
                  ),
                  border: InputBorder.none
                ),
                validator: (value) {
                  RegExp regex = RegExp(r'^.{6,}$');
                    if (value!.isEmpty) {
                      return "Password cannot be empty";
                    }
                    if (!regex.hasMatch(value)) {
                      return ("please enter valid password min. 6 character");
                    } else {
                      return null;
                    }
                },
              ),
            ),
      
            // InputEmail(
            //   hintText: "Email",
            //   onchanged: (value) {},
            // ),
            // input_password(
            //   onChanged: (value) {},
            // ),
            RoundedButton(
              text: "Kuy Daftar",
              press: () {},
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const login();
                    },
                  ),
                );
              },
              child: const Text(
                "Udah Punya Akun?",
                style: TextStyle(
                    color: Color(0xFF838383),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

