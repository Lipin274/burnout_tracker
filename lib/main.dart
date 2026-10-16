import 'package:flutter/material.dart';

void main(){
    runApp(const MyApp());
}

class MyApp extends StatelessWidget{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context){
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                 appBar: AppBar(
                    title: const Text("Kudamonoya",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 25.0,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        ),
                    ),
                    backgroundColor: Colors.black,
                 ),//Appbar
                 body: Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Column(
                        children:[
                 Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                       // 📦 BOX 1: The Apple Container
                        Container(
                        width:110, // 💡 Tip: Sized down to 110 so three boxes fit cleanly side-by-side on phone screens!
                        height:110,
                        decoration: const BoxDecoration(
                            color: Color(0xFFDCD29D),
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Stack(
                            children:[
                           Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text("Ringo"),
                            ),),
                           Align(
                             alignment: Alignment.center,
                             child: Text("🍎",style: TextStyle(
                                fontSize:45.0,
                             ),),
                           ), 
                            ],
                           
                        ),
                       ), 
                        //orange container
                                Container(
                            width:110,
                            height:110,
                            decoration: const BoxDecoration(
                                color: Color(0xFFE5A65D),
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: const Stack( 
                                   children:[
                           Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text("orenji"),
                            ),),
                           Align(
                             alignment: Alignment.center,
                             child: Text("🍊",style: TextStyle(
                                fontSize:45.0,
                             ),),
                           ), 
                            ],
                            ),
                           ),
                         //grape container
                                Container(
                            width:110,
                            height:110,
                            decoration: const BoxDecoration( // 🟢 Added const
                                color: Color(0xFFD1C4E9), // 🍇 Swapped color to matching purple hue
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            ),
                            child: const Stack( // 🟢 Added const
                                   children:[
                           Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 4.0),
                              child: Text("budō"),
                            ),),
                           Align(
                             alignment: Alignment.center,
                             child: Text("🍇",style: TextStyle(
                                fontSize:45.0,
                             ),),
                           ), 
                            ],
                            ),
                           ),   
                      
                    ],
                 ),//row
                 
                 // 💡 Ready for Row 2! You can place a SizedBox and your next row right here later.
                 
                    ],),
              ), // 🟢 2. Fixed mismatched brackets here
            ),//Scaffold   
        ); // Closes MaterialApp
    }
}
