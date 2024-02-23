import 'package:flutter/material.dart';
import '../firebase/user_repository.dart';
// import '../register/register_page.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton(this._userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text("data");
  }

  // @override
  // Widget build(BuildContext context) {
  //   return FlatButton(
  //     child: Text(
  //         'Create a Account'
  //     ),
  //     onPressed: (){
  //       // Navigator.of(context).push(
  //       //     MaterialPageRoute(builder: (context){
  //       //       return RegisterPage(userRepository: _userRepository);
  //       //     })
  //       // );
  //     },
  //   );
  // }
}