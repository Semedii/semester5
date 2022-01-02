import 'package:flutter/material.dart';
import 'package:term_roject/Login%20Screens/screens/loginScreen.dart';
import 'package:term_roject/Login%20Screens/screens/signUpScreen.dart';


class DrawerScreen extends StatelessWidget {
  const DrawerScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: const Color(0xff5a5a5a),
        //other styles
      ),
      child: Drawer(
         child: SafeArea(
          child: Column(children: [

            Row(
              children: [

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Container(
                        height: 200,
                        decoration: const BoxDecoration(
                          color: Color(0xff12c387),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(50, 70, 50, 50),
                          child: Center(child: Text("Login Page", style: TextStyle(fontSize: 30, color: Colors.black))),
                        )),
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),
                ));
              },
              child: const Card(
                  child: ListTile(
                    tileColor: Color(0xff12c387),
                    leading:Icon(Icons.login),
                    title: Text("Login"),
                  ),

                ),
            ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen(),
              ));
            },
            child: const Card(
                  child: ListTile(
                    tileColor: Color(0xff12c387),
                    leading:Icon(Icons.app_registration_outlined),
                    title: Text("Signup"),
                  ),
                ),
          )
          ]),
        ),
      ),
    );
  }
}