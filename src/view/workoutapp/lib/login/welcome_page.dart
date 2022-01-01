import 'package:flutter/material.dart';

class WelocomePage extends StatelessWidget {
  const WelocomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ElevatedButton(
                child: Text("Login"),
                onPressed: () {
                  print("login");
                },
              ),
              ElevatedButton(
                child: Text("Sign Up"),
                onPressed: () {
                  print("Sign Up");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}