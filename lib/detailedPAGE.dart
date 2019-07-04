import 'package:flutter/material.dart';

class Detailed extends StatelessWidget{


  String name,revenue,imgURL,info;
  Detailed(this.name,this.revenue,this.imgURL,this.info);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detailed View',style: TextStyle(color: Colors.greenAccent),)),
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag:imgURL,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(imgURL))),
              ),
            ),
            Text(name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
            Text(revenue,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(info,style: TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,fontSize: 26,color: Colors.greenAccent,),textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}