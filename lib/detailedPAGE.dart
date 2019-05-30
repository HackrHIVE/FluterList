import 'package:flutter/material.dart';

import 'model.dart';

class Detailed extends StatelessWidget{

  Model model;
  Detailed(this.model);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Detailed View',style: TextStyle(color: Colors.greenAccent),)),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        children: <Widget>[
          Hero(
            tag: model.imgURL,
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: NetworkImage(model.imgURL))),
            ),
          ),
          Text(model.name,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          Text(model.revenue,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(model.info,style: TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic,fontSize: 26,color: Colors.greenAccent,),textAlign: TextAlign.center,),
          )

        ],
      ),
    );
  }

}