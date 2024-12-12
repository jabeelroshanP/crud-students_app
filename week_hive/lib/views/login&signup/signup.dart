import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:week_hive/homescreen.dart';
import 'package:week_hive/views/login&signup/login.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}
 
class _signState extends State<sign> {

  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void>signin()async{
    if(username.text.isNotEmpty && password.text.isNotEmpty){
      final shared= await SharedPreferences.getInstance();
      await shared.setString("username", username.text);
      await shared.setString("password", password.text);
      await shared.setBool("isSigned", true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home(),));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Successfully registered")));
    }else{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Register First with username and Password")));

    }
  }

  @override
  Widget build(BuildContext context) {
  




    return Scaffold(
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 150.0),
                child: Text("Sign Up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black),),
              ),
            ],
            
            
          ),
          const SizedBox(height: 15,),
           Padding(
             padding: const EdgeInsets.all(20.0),
             child: Column(
              children: [
                TextFormField(
                  controller: username,
                  decoration:const InputDecoration(border: OutlineInputBorder(),hintText: "User Name"),
                
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Password"),),const SizedBox(height: 15,),

                ElevatedButton(onPressed: (){
                  signin();
                },style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), child: const Text("Sign Up",style: TextStyle(color: Colors.white),)),
                const SizedBox(height: 20,),
              ],
                       ),
                       
           ),
           Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
                const Text("Already have an Account?"),const SizedBox(width: 5,),
               GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login(),));
                },
                child: const Text ("Login",style:TextStyle(color: Colors.blue)))
            ],
           )
         
        ],
      ),
    );
  } 
}