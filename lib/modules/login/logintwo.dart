
import 'package:flutter/material.dart';

class logintwo extends StatefulWidget {
  const logintwo({Key? key}) : super(key: key);

  @override
  State<logintwo> createState() => _logintwoState();
}

class _logintwoState extends State<logintwo> {
  @override
  Widget build(BuildContext context) {
    var mycontroller = TextEditingController();
    var mycontrollerpass = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.login),
        title: const Text(
          'LOGIN',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          Row(
            children: const [
              Text('EXIT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                width: 20,
              ),
              Icon(Icons.exit_to_app_rounded),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: const [
                  Text(
                    'LOGIN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 70),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                child: TextFormField(
                  controller: mycontroller,
                  onFieldSubmitted: (val) {
                    print(val);
                  },
                  onChanged: (val) {
                    print(val);
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    label: Text('E_Mail Address'),
                    labelStyle: TextStyle(
                      fontSize: 30,
                    ),
                    hintText: 'Write E_Mail Address',
                    hintStyle: TextStyle(backgroundColor: Colors.white10),
                    prefixIcon: Icon(Icons.email_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                child: TextFormField(
                  obscureText: true,
                  controller: mycontrollerpass,
                onFieldSubmitted: (val) {
    },
    onChanged: (val) {
                    print(val);
                  },
                  keyboardType: TextInputType.visiblePassword,
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    labelStyle: TextStyle(
                      fontSize: 30,
                    ),
                    hintText: 'Write Password',
                    hintStyle: TextStyle(backgroundColor: Colors.white10),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.visibility),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    print(mycontroller.text);
                    print(mycontrollerpass.text);
                  },
                  child: const Text('Submit'),
                  color: Colors.blue,
                ),
              ),
              Container(
                child: Row(
                  children: [
                    const Text(
                      'Don\'t have anaccount?',
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Registere',
                        style: TextStyle(
                          backgroundColor: Colors.white,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
