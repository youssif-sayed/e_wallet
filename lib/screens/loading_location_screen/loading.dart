import 'package:e_wallet/util/sign.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState(){
    super.initState();

    getData();
  }

  void getData()async{

    await UserID.get_user_data();
    await Future.delayed(const Duration(seconds: 5), (){});
    await Navigator.of(context).pushReplacementNamed('Home');

  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff6FC3E7),
      body: SafeArea(
        child: Center(
          child: SpinKitSquareCircle(color: Color(0xfff1f1f1),size: 100.0,),
        ),
      ),
    );
  }
}
