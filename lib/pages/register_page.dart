import 'package:connect/services/auth/auth_service.dart';
import 'package:connect/components/my_button.dart';
import 'package:connect/components/my_text_field.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _confirmPwdController = TextEditingController();
  
  
  final void Function()? onTap;
  
  
  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context) async{
    final _auth = AuthService();
    if(_pwdController.text == _confirmPwdController.text){
      try{
        _auth.registerWithEmailAndPassword(_emailController.text, _pwdController.text);
      }catch(e){
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
      }
    }else{
      showDialog(
          context: context,
          builder: (context) =>const AlertDialog(
                title: Text("Passwords do not match!!"),
              ));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwdController,
            ),
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmPwdController,
            ),
            const SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Register",
              onTap: ()=>register(context),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
