import 'package:e_wallet/screens/profile.dart';
import 'package:e_wallet/util/sign.dart';
import 'package:e_wallet/widgets/custom_app_bar.dart';
import 'package:e_wallet/widgets/custom_card.dart';
import 'package:flutter/material.dart';

import '../widgets/profile_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar:CustomAppBar(title: 'Home',
      actions: [ProfileButton(),],
      ),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: [
                Container(
                  transformAlignment: Alignment.center,
                  transform: Matrix4.rotationZ(-.07),
                  child: CustomCard(child: SizedBox(
                    height: 180,
                    width: double.infinity,
                  ), backgroundColor: Color(0x80FE7D77),
                  grad: false,),
                ),
                Container(
                  transformAlignment: Alignment.center,
                  transform: Matrix4.rotationZ(.07),
                  child: CustomCard(child:  SizedBox(
                    height: 180,
                    width: double.infinity,
                  ), backgroundColor: Color(0x80F3B2D9),
                  grad: false,
                  ),
                ),
                CustomCard(child: SizedBox(
                  height: 180,
                  width: double.infinity,
                ),
                  backgroundColor: Color(0xffffffff),
                grad: true,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    height: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${UserID.userdata['name']}',style: TextStyle(color:Colors.white,fontSize: 30),),
                            Text('123 456 789',style: TextStyle(color:Colors.white,fontFamily: 'Roboto',fontSize: 20),),
                          ],
                        ),
                        SizedBox(height: 30,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Balance',style: TextStyle(color:Colors.white,fontFamily: 'Roboto',fontSize: 17.5),),
                            Text('2000 EGP',style: TextStyle(color:Colors.white,fontFamily: 'Roboto',fontSize: 25),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){Navigator.pushNamed(context,'Send' );},
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                      ),
                      child: Icon(Icons.arrow_upward_rounded,size: 65,color: Color(0xffF3B2D9),),
                    ),
                    SizedBox(height: 8,),
                    Text('SEND',),
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context,'Pay' );},
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.add_rounded,size: 65,color: Color(0xffF8B8B5),),
                  ),
                  SizedBox(height: 8,),
                  Text('Pay',),
                ],),
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context,'Bill' );},
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),
                      color: Colors.white,
                    ),
                    child: Icon(Icons.arrow_downward_rounded,size: 65,color: Color(0xffB8B8E3),),
                  ),
                  SizedBox(height: 8,),
                  Text('Bill',),
                ],),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.4399,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color(0xff6FC3E7),

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [

                ],
              ),
            ),
          ),
        ],
      ),),

    );
  }
}
