import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:tugasfigma/Setting.dart';
import 'SharedPref.dart';


Future<void> main() async {
  /* WidgetFlutterBinding digunakan untuk berinteraksi dengan mesin Flutter.
  SharedPref.init() perlu memanggil kode asli untuk menginisialisasi, oleh karena itu
  perlu memanggil ensureInitialized() untuk memastikan terdapat instance yang bisa dijalankan */

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  // runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeData themeData = ThemeData.light();
  /* fungsi mengubah tema sesuai inputan parameter */
  void setTheme(bool isDarkmode) {
    setState(() {
      /* jika isDarkmode true maka ThemeData adalah dark dan sebaliknya */
      themeData = (isDarkmode)? ThemeData.dark():ThemeData.light();

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

  DateTime timeBackPressed = DateTime.now();
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    // String isDarkMode = SharedPref.pref.getString('isDarkMode') as String;

    // print(isDarkMode);

    List<String> kumpulanGambar = [
      "img_1.png",
      "image.png",
      "mie.png",
      "mie2.png",
      "mie2.png",
      "mie2.png",
      "mie2.png",
    ];
    // String isDarkMode= SharedPref.pref.getString('isDarkMode') as String;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          "RAMENEKU",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings,
                color: const Color.fromARGB(255, 253, 251, 251)),

            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Setting(setTheme: setTheme)),
              );
            },
          )
        ],
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 15)),
          Container(
            width: 320,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                color: Color.fromARGB(255, 39, 40, 40),
                width: 1,
              ),
            ),
            child: TextFormField(
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(left: 20),
                labelText: "Search",
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          const Padding(
            padding: EdgeInsets.only(right: 250, top: 28, left: 5),
            child: Text(
              'Top Menu',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 5)),
          Expanded(
            child: GridView.builder(
              itemCount: kumpulanGambar.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('image/${kumpulanGambar[i]}'),
                );
              },
            ),
          )
        ],
      ),
      // ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => _currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Beranda'),
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.message),
            title: Text('Chat'),
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.work_history),
            title: Text(
              'History',
            ),
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
            activeColor: Colors.orange,
            inactiveColor: Colors.black,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavBar(
      //   showElevation: true,
      //   selectedIndex: _currentIndex,
      //   onItemSelected: (index) {
      //     setState(() => _currentIndex = index);
      //   },
      //   items: <BottomNavBarItem>[
      //     BottomNavBarItem(
      //       title: 'Home',
      //       icon: const Icon(Icons.home),
      //       activeColor: Colors.white,
      //       inactiveColor: Colors.black,
      //       activeBackgroundColor: Colors.orange,
      //     ),
      //     BottomNavBarItem(
      //       title: 'Chat',
      //       icon: const Icon(Icons.chat_bubble),
      //       activeColor: Colors.white,
      //       inactiveColor: Colors.black,
      //       activeBackgroundColor: Colors.orange,
      //     ),
      //     BottomNavBarItem(
      //       title: 'History',
      //       icon: const Icon(Icons.history),
      //       inactiveColor: Colors.black,
      //       activeColor: Colors.white,
      //       activeBackgroundColor: Colors.orange,
      //     ),
      //     BottomNavBarItem(
      //       title: 'Account',
      //       icon: const Icon(Icons.person),
      //       inactiveColor: Colors.black,
      //       activeColor: Colors.black,
      //       activeBackgroundColor: Colors.orange,
      //     ),
      // ],
      // )
    );
  }
}
