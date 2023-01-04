import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import '../model/model.dart';

class Homescreen extends StatefulWidget {
 static final routeName = './HomeScreen';

  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List <TransModel> transactionlist=[];
  final titleController = TextEditingController();
  final expenseController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Expensee'),actions: [IconButton(onPressed: (){
          showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
                title: Text("Add your Expenses"),
                content: Container(
                  height:219,
                  width:200,
                  child: Column(
                    children: [
                
                      Padding(
                        padding: const EdgeInsets.only(top:9.0),
                        child:
                        TextField(
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.name,
                           controller: titleController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),),
                            ),
                            labelText: "Purpose ",
                          )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:9.0),
                        child: TextField(
                          textCapitalization: TextCapitalization.sentences,
                          keyboardType: TextInputType.number,
                          controller: expenseController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8),),
                            ),
                            labelText: "Expense amount",
                          )),
                      ),
                    ],
                  ),
                ),
                actions: [
                  
                  OutlinedButton(onPressed: (){
                    transactionlist.add(TransModel(
            title:titleController.text,Expense:double.parse(expenseController.text),Date: DateTime.now()));
            setState(() {
              Navigator.pop(context);
            });
                  }, child: Text('Add'),),
                ],
              );
        });
          
      }, icon: Icon(Icons.add))],),
      body: Container(
        height: 300,
        width: 800,

        child: Column(
          children: [
            Container(
              // height: 50,
              // width: 100,
              color: Colors.blue,
            ),
            Container(
              height: 300,
              width: 300,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount:transactionlist.length,
                itemBuilder: (context, index) => ListTile(
                  trailing: Text(transactionlist[index].Expense.toString(),

              textScaleFactor: 1.0,
),
                  subtitle: Text(
                  

              transactionlist[index].Date.toString(),

              textScaleFactor: 1.0,

          ),

          title: Text(

              transactionlist[index].title.toString(),

              textScaleFactor: 1.0,

          ),

        ),

      ),
            ),
          ],
        ),
      ),
    );
  }
}
