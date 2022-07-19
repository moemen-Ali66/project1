
import 'package:flutter/material.dart';
import 'package:login/shared/components/components.dart';

class log extends StatelessWidget {
  var mycontroller=TextEditingController();
  var mycontrollerpass=TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(
          Icons.login_outlined,
        ),
        title:const Text(
          'login',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        actions:const [
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
                    Container(
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return 'email must not be embty';
                          }
                            return null ;
                        } ,
                        controller: mycontroller,
                        onFieldSubmitted: (val) {
                          print(val);
                        },
                        onChanged: (val) {
                          print(val);
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_sharp),
                          label: Text('E-mail'),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          hintText: 'writeE-mail',
                          hintStyle: TextStyle(backgroundColor: Colors.white10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      child: TextFormField(
                        validator:(value){
                          if(value!.isEmpty){
                            return 'password must not be embty';
                          }
                          return null ;
                        } ,
                        controller: mycontrollerpass,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (val) {
                          print(val);
                        },
                        obscureText: true,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.visibility),
                          prefixIcon: Icon(Icons.lock),
                          label: Text('password'),
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          hintText: 'Entre password',
                          hintStyle: TextStyle(backgroundColor: Colors.white10),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    default_button(
                      background: Colors.blue,
                      function:(){
                        if (formkey.currentState!.validate()){
                          print(mycontroller.text);
                          print(mycontrollerpass.text);
                        }

                    },
                      text: 'login',
                      width: double.infinity,
                    ),
                    SizedBox(height: 10.0,),

                    Container(

                      child:

                      Row(children: [

                        Text('Don\'t have anaccount?',style: TextStyle(color: Colors.blue),),
                        SizedBox(width: 10.0,),
                        TextButton(onPressed: (){}, child: const Text('Registere',
                          style: TextStyle(backgroundColor: Colors.blue,color:Colors.white,fontWeight:FontWeight.bold,),),)
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
