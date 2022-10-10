import 'package:flutter/material.dart';
import 'package:tugasfigma/Register.dart';
import 'package:tugasfigma/SharedPref.dart';
import 'package:tugasfigma/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();

  runApp(const MyApp());
}

// void main() {
//   runApp(const MyApp());
// }

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData themeData = ThemeData.light();
  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkmode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkmode) ? ThemeData.dark() : ThemeData.light();

      /* simpan nilai boolean pada shared preferences */
      SharedPref.pref?.setBool('isDarkmode', isDarkmode);
      print(isDarkmode);
    });
  }

  /* hanya dijalankan sekali ketika halaman / class MyApp pertama kali di jalankan */
  @override
  void initState() {
    /* default / tema awal dibuat sesuai data yang tersimpan pada shared preferences
    atau jika masih kosong (belum ada yang set) maka akan di berikan nilai false */
    bool isDarkmode = SharedPref.pref?.getBool('isDarkmode') ?? false;
    setTheme(isDarkmode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
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
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login(
                                  setTheme: setTheme,
                                )));
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
                  builder: (context) => OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
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
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
