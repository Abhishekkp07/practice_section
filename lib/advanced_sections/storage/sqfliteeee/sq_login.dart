import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_section/advanced_sections/storage/sqfliteeee/sq_registration.dart';

void main(){
  runApp(MaterialApp(home:Sq_Login() ,));
}
class Sq_Login extends StatelessWidget {

  var formkey=GlobalKey<FormState>();
  var email_cntrl=TextEditingController();
  var pass_cntrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email_cntrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                  validator: (email){
                    if(email!.isEmpty || !email.contains("@")){
                      return "invalid user name or id";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pass_cntrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                  validator: (pass){
                    if(pass!.isEmpty || pass.length<6){
                      return "invalid password";
                    }else{
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){},
                    child: Text("Login")),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Sq_registration()));
                },
                    child: Text("Register Here")),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
