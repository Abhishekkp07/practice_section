import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice_section/advanced_sections/storage/sqfliteeee/sqflite_functions.dart';

class Sq_registration extends StatelessWidget {

  var formkey=GlobalKey<FormState>();
  var name_cntrl=TextEditingController();
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
                controller: name_cntrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Name"),

                ),
              ),
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
              ElevatedButton(onPressed: (){
                var valid=formkey.currentState!.validate();
                if(valid==true){
                  registerUser(name_cntrl.text,email_cntrl.text,pass_cntrl.text);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please verify all the fileds")));
                }
              },
                  child: Text("Register now"))
            ],
          ),
        ),
      ),
    );
  }


  void registerUser(String name, String email, String pass) async{
    var id= await SQ_Functions.addUser(name,email,pass);
  }
}
