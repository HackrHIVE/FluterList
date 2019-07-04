import 'package:flutter/material.dart';
import 'model.dart';
import 'detailedPAGE.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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


class homepage extends StatefulWidget {

  @override
  _firebaseState createState() =>_firebaseState();

}

class _firebaseState extends State<homepage>{

  Future parseData() async{
    var collectionRef =Firestore.instance;
    QuerySnapshot snap = await collectionRef.collection('companies').getDocuments();
    return snap.documents;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      parseData();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Center(child:Text('Top 10 Companies',style: TextStyle(color: Colors.indigo),)),
        backgroundColor: Colors.greenAccent,
      ),
      body: FutureBuilder(
        future: parseData(),
          builder: (_,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: Text('Loading.....'),
            );
          }
          return ListView.builder(
//            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data.length,
            itemBuilder: (_,index){
              return SampleObj(snapshot.data[index].data['name'],   snapshot.data[index].data['revenue'], snapshot.data[index].data['img'],snapshot.data[index].data['info']);
            },
          );
          },
      ),
    );
  }
}

class SampleObj extends StatelessWidget{

  String name,revenue,imgURL,info;
  SampleObj(this.name,this.revenue,this.imgURL,this.info);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Detailed(name, revenue, imgURL, info)));},
      child: Card(
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
      ),
    );
  }

}