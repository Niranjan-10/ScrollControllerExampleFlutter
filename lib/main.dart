import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List data = [];

  final _scrollController = ScrollController();

  void generateData(){
    for(var i =0; i<15; i++){
     setState(() {
       data.add("new value ---> $i");
     });
      
    }
  }

//  void addData(){
//    final data1 = ["working here","working here","working here","working here","working here","working here","working here","working here","working here","working here","working here","working here","working here","working here","working here"];
//    setState(() {
//          data.addAll(data1);
//       });
  
//   }

@override
  void initState() {
    super.initState();
    
    generateData();

    _scrollController.addListener(() {

      // print("working here");
      double maxScroll = _scrollController.position.maxScrollExtent;
            double currentScroll = _scrollController.position.pixels;
            double delta = 300.0; // or something else..
            if ( maxScroll - currentScroll <= delta) { // whatever you determine here
            // if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
                //.. load more

                print("working here 2");
                generateData();
            }

    });

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: ListView.builder(
            physics: ScrollPhysics(),
            reverse: true,
            controller: _scrollController,
            itemCount: data.length+1,
            itemBuilder: (context,index){
              if(index == data.length){
                return CupertinoActivityIndicator(); 
              }

              return ListTile(
                title: Text(data[index].toString()),
              );
            },
          ),
        ),
      ),
    );
  }
}

