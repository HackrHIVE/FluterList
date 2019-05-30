import 'package:flutter/material.dart';
import 'model.dart';
import 'detailedPAGE.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homepage(),
    );
  }
}

class homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    objLister(Model obj)=>InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailed(obj)));},
      child: SampleObj(obj.name,obj.revenue,obj.imgURL),);

    return Scaffold(

      appBar: AppBar(
        title: Center(child:Text('Top 10 Companies',style: TextStyle(color: Colors.indigo),)),
        backgroundColor: Colors.greenAccent,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: listCompanies.map((obj)=>objLister(obj)).toList(),
        ),
      ),
    );
  }
}

class SampleObj extends StatelessWidget{

  String name,revenue,imgURL;
  SampleObj(this.name,this.revenue,this.imgURL);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Hero(
              tag: imgURL,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    offset: Offset(2.0, 3.0),
                    color: Colors.greenAccent
                  )],
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(image: NetworkImage(imgURL),fit: BoxFit.fitHeight)
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  Text(revenue,style: TextStyle(fontSize: 16),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}