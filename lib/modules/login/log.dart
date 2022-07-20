
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/shared/components/components.dart';
class log extends StatefulWidget {
 const log({Key? key}) : super(key: key);

  @override
  State<log> createState() => _logState();
}

class _logState extends State<log> {
  var mycontroller=TextEditingController();
  var mycontrollerpass=TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool chek=true;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.login_outlined,
        ),
        title: const Text(
          'login',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        actions: const [
          Icon(
            Icons.login_rounded,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    default_Form(
                      control: mycontroller,
                      keyboard: TextInputType.emailAddress,
                      label: 'E_mail address',
                    hinttext: 'write e_mail address',
                    icon:Icon(Icons.email_outlined) ,
                      validate: (value){
                        if (value.isEmpty){
                          return 'email is empty';
                        }
                        return null;
                      }
                    ),

                    const SizedBox(height: 30.0),
                    default_Form(control: mycontrollerpass,
                        keyboard: TextInputType.visiblePassword,
                        label: 'password',
                        hinttext: 'write password',
                        icon:Icon(Icons.lock) ,
                        suficon: Icon(Icons.remove_red_eye_outlined),
                        validate: (value){
                          if (value.isEmpty){
                            return 'password is empty';
                          }
                          return null;
                        }),
                    SizedBox(height: 30.0),
                    default_button(
                          function: () {
                            if (formkey.currentState!.validate()) {
                              print(mycontroller.text);
                              print(mycontrollerpass.text);
                            }
                          },
                      text: 'login',
                         ),
                    SizedBox(height: 10.0,),
                    Container(
                      child:
                      Row(children: [
                        Text('Don\'t have anaccount?',
                          style: TextStyle(color: Colors.blue),),
                        SizedBox(width: 10.0,),
                        TextButton(onPressed: () {},
                          child: const Text('Registere',
                            style: TextStyle(
                              backgroundColor: Colors.blue,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,),),)
                      ],),
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}



