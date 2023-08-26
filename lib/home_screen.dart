//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:practice_app/api_screen.dart';
import 'package:practice_app/providers/login_notifier.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    int count = 0;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset : false,
        backgroundColor:const Color(0xff24BEBE),
        body: SingleChildScrollView(
          child: Column(
           children: [
             SizedBox(height: 20),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Container(
                   height: 100,
                   width: 90,
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(15),
                     boxShadow: [
                       BoxShadow(
                       color: Colors.black26,
                       blurRadius: 15.0,
                       spreadRadius: 5.0,
                       offset: Offset(5.0, 5.0)
                     )
                     ],
                   ),
                 //  child: Icon(Icons.confirmation_num_sharp),
                 ),
               ],
             ),
             SizedBox(height: 50,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Text(
                   'ELYA',
                   style: TextStyle(
                       color: Colors.white,
                       fontSize: 45,
                       fontWeight: FontWeight.bold
                   ),
                 ),
               ],
             ),
             SizedBox(height: 20,),
             Row(

               children: [
                 SizedBox(width: 20,),
                 Text(
                     'All Your Finances Inside\na Fancy App',
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 30,
                 ),),
               ],
             ),
             SizedBox(height: 10,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Container(
                   height: 10,
                   width: 30,
                   color: Colors.white54,
                 ),
               ],
             ),
             SizedBox(height: 130,),
             Container(
               height: 65,
               width: 350,
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                       color: Colors.black26,
                       blurRadius: 15.0,
                       spreadRadius: 5.0,
                       offset: Offset(2.0, 5.0)
                   ),
                 ],
               ),
               child: Center(
                 child: Consumer<MyData>(
                   builder: (context,value,child){
                     return InkWell(
                       onTap: (){
                         count++;
                         if(count%2 == 0)
                           {
                             value.setName( "Anonymous" );
                           }
                         if(count%2 == 1)
                           {
                             value.setName( "Hamza" );
                           }

                       },
                       child: Text(
                         'LOGIN',
                         style: TextStyle(
                           fontSize: 25,
                         ),
                       ),
                     );
                   },
                   // child: InkWell(
                   //   onTap: (){
                   //
                   //   },
                   //   child: Text(
                   //       'LOGIN',
                   //     style: TextStyle(
                   //       fontSize: 25,
                   //     ),
                   //   ),
                   // ),
                 ),
               ),
             ),
             SizedBox(height: 20,),
             Container(
               height: 65,
               width: 350,
               decoration: BoxDecoration(
                 color: Color(0xff70BCC2),
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: Colors.black26,
                     blurRadius: 15.0,
                     spreadRadius: 5.0,
                     offset: Offset(2.0, 5.0)
                 )],
               ),
               child: Center(
                 child: InkWell(
                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => ApiScreen()));
                   },
                   child: Text(
                     'SIGN UP',
                     style: TextStyle(
                       fontSize: 25,
                       color:Colors.white54
                     ),
                   ),
                 ),
               ),
             ),
             SizedBox(height: 60,),
             Row(
               children: [
                 SizedBox(width: 20,),
                 Container(
                   height: 5,
                   width: 340,
                   color: Colors.white54,
                 ),
               ],
             ),
             SizedBox(height: 10,),
             Consumer<MyData>(

               builder: (context , value , child ){
                 // String ch = " ";
                 // if(value.name != null)
                 //   {
                 //     ch = value.name;
                 //   }
                 return Text('Designes by Royalz ' + value.name ,
                   style: TextStyle(
                       color: Colors.white54
                   ),
                 );
               },
             )
           ],
          ),
        ),
      ),
    );
  }
}
