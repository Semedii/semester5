import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_roject/Login%20Screens/screens/signUpScreen.dart';
import 'package:term_roject/Login%20Screens/widgets/inputTextWidget.dart';
import '../../nav.dart';
import '../../wrapper.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen() : super();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<LoginScreen> {
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  String goodNews = '';
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double r = (175 / 360);
    final coverHeight = screenWidth * r;
    bool _pinned = false;
    bool _snap = false;
    bool _floating = false;

    final widgetList = [
      Row(
        children: [
          SizedBox(
            width: 28,
          ),
          Text(
            'OTFScore',
            style: TextStyle(
              fontFamily: 'Segoe UI',
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              
            ),
            textAlign: TextAlign.left,
          ),
        ],
      ),
      SizedBox(
        height: 12.0,
      ),
      Form(
          key: _formKey,
          child: Column(
            children: [
              InputTextWidget(
                  controller: _emailController,
                  labelText: "Email Address",
                  icon: Icons.email,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress),
              SizedBox(
                height: 12.0,
              ),
              InputTextWidget(
                  controller: _pwdController,
                  labelText: "Password",
                  icon: Icons.lock,
                  obscureText: true,
                  keyboardType: TextInputType.text),
              Padding(
                padding: const EdgeInsets.only(right: 25.0, top: 10.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    )),
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                height: 55.0,
                child: ElevatedButton(
                  onPressed: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (_formKey.currentState!.validate()) {
                     try {
                      await auth.signInWithEmailAndPassword(
                           email: _emailController.text,
                           password: _pwdController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Wrapper() ),
                      );
                     } catch (e){
                       setState(() {
                         error='Could not sign in with these Credentials';
                       });

                     }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff12c387),
                    elevation: 0.0,
                    minimumSize: Size(screenWidth, 150),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color(0xff12c387),
                              offset: const Offset(1.1, 1.1),
                              blurRadius: 3.0),
                        ],
                        color: Color(0xff12c387),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  goodNews,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          )),
      SizedBox(
        height: 15.0,
      ),
      SizedBox(
        height: 15.0,
      ),
    ];
    return Scaffold(
      backgroundColor: Color (0xFF5a5a5a),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: _pinned,
            snap: _snap,
            floating: _floating,
            expandedHeight: coverHeight - 250,
            backgroundColor:Color(0xff12c387),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                     
                      ),
                  gradient: LinearGradient(
                      colors: <Color>[Color(0xff12c387), Color(0xff12c387)])
                  
                  ),
              width: screenWidth,
              height: 25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: screenWidth,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Color (0xFF5a5a5a),
                      
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(30.0),
                        topRight: const Radius.circular(30.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate:
                  SliverChildBuilderDelegate((BuildContext context, int index) {
            return widgetList[index];
          }, childCount: widgetList.length))
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            height: 50.0,
            color: Color(0xff12c387),
            child: Center(
                child: Wrap(
              children: [
                const Text(
                  "Don't have an account?  ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Material(
                    child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) =>SignUpScreen() ),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                )),
              ],
            )),
          ),
        ],
      ),
    );
  }
}
