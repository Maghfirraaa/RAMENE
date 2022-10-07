import 'package:flutter/material.dart';
import 'package:tugasfigma/Register.dart';
import 'package:tugasfigma/SharedPref.dart';
import 'package:tugasfigma/login.dart';

Future<void> main() async{
  runApp(const MyApp());
  await SharedPref.init();
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              Image.asset(
                'image/img_1.png',
                width: 85,
                height: 77,
              ),
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'image/image.png',
                width: 261.11,
                height: 262,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "All your \n favorite ramen",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                "Delicious as is or tossed with your\nfavorite ingredients",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black45,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Builder(
                builder: (context) => RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => login()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(130, 16, 130, 16),
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
          Builder(
            builder: (context) =>OutlinedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            side: BorderSide(color: Colors.black54)))),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(130, 16, 130, 16),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                ),
              )
            ),
            ],
          ),
        ),
      ),
    );
  }
}
