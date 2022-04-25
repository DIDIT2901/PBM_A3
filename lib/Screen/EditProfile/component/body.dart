import 'package:flutter/material.dart';
// import 'package:selibu/Screen/EditProfile/component/background.dart';
import 'package:selibu/Data/Buku.dart';
import 'package:selibu/components/rounded_button.dart';

class Body extends StatefulWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

bool seePass = false;

class _BodyState extends State<Body> { 
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Images/Vector_7.png"),
            fit: BoxFit.cover,
          )
        ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 30,
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Mau Edit Profile?",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w700,
                  fontSize: 36
                ),
              ),

              Text(
                "Bikin Profile Yang Keren Ya!",
                style: TextStyle(
                  fontFamily: "Made-Tommy",
                  fontWeight: FontWeight.w400,
                  fontSize: 24
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Center(
                  child: Stack(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 70.0,
                        backgroundImage: AssetImage("assets/Images/user.png"),
                        backgroundColor: Colors.white,
                      ),
                      Positioned(
                        bottom: 20,
                        right: 10,
                        child: Icon(
                          Icons.image,
                          color: Colors.black,
                          size: 28,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person, color: Colors.black, size: 24,),
                    hintText: "Kinoy",
                    labelText: "Username"
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail, color: Colors.black, size: 24,),
                    hintText: "enjoykinoy7@gmail.com",
                    labelText: "Email"
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  obscureText: seePass,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black, size: 24,),
                    hintText: "**********",
                    labelText: "Password",
                    suffixIcon: IconButton(
                    icon: Icon(
                      Icons.visibility,
                    ),
                    onPressed: (){
                      setState(() {
                        seePass = !seePass;
                      });
                    },
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.house, color: Colors.black, size: 24,),
                    hintText: "Perum Punden Ayem, Kec.SumberSari, Kota Jember",
                    labelText: "Alamat"
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Text(
                  "Hapus Akun",
                  style: TextStyle(
                    color: Color(0xFF838383),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: RoundedButton(
                  text: "Simpan",
                  press: () {},
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
