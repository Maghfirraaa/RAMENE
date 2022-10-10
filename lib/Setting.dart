
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import "HomePage.dart";
import 'SharedPref.dart';

class Setting extends StatefulWidget {
  Function setTheme;
  Setting({Key? key, required this.setTheme}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isDarkmode = SharedPref.pref?.getBool('isDarkmode')??false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.orange,
          title: const Text(
            "Setting",
            style: TextStyle(color: Colors.white),
          ),
        ),

        body:Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[

              Padding(
                padding: EdgeInsets.only(top: 70),
              ),
              Container(
                child: Text("Dark Mode",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                padding: EdgeInsets.all(0.0),
              ),
              Container(
                child: Text(""),
                padding: EdgeInsets.all(16.0),
              ),
              Container(
                padding: EdgeInsets.only(right: 12.0),
                child: ToggleSwitch(
                    minWidth: 90.0,
                    cornerRadius: 20.0,
                    activeBgColors: [[Colors.red[800]!], [Colors.green[800]!]],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    initialLabelIndex: 1,
                    totalSwitches: 2,
                    labels: ['Off', 'On'],
                    radiusStyle: true,
                    onToggle: (index) {
                      print('switched to: $index');
                      // if(index==1){
                      //   isDarkmode=!isDarkmode;
                      // }else if(index==0) {
                      //   isDarkmode=!isDarkmode;
                        isDarkmode = !isDarkmode;
                        widget.setTheme(isDarkmode);
                      }
                    // }
                ),
              ),
            ]
        )
    );
    //   Column(
    //     children: [
    //       Padding(
    //            padding: EdgeInsets.only(right: 250, top: 28, left: 5),
    //             child: Text(
    //             'Dark Mode',
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //
    //
    // },
    // ),
    //     ],
    //   ),
  }
}
