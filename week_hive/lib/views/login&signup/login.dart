import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_hive/homescreen.dart';
import 'package:week_hive/views/login&signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController username =TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void>log()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String?savedusername=prefs.getString("username");
    String?savedpassword=prefs.getString("password");
    if(savedusername==username.text && savedpassword == password.text){
      await prefs.setBool("isLogined", true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home(),));
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Successfully log in")));
    }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Enter your Registered Username and password")));

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Text(
                  "Log in",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                )
              ),
            ],
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "User Name",
                  ),
                ),
                SizedBox(height: 15),
                TextFormField(   
                  controller: password,
                  obscureText: true,
                           decoration: InputDecoration(
                    border: OutlineInputBorder(),
                
                    hintText: "Password",
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: (){
                    log();
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Log In",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an Account?"),
              SizedBox(width: 5),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => sign()),
                  );
                },
                child: Text(
                  "Signup",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
