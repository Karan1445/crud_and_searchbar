import 'dart:async';
import 'package:crud_and_searchbar/Sc2.dart';
import 'package:flutter/material.dart';

class Sc1 extends StatefulWidget{
  Sc1({super.key});

  @override
  State<Sc1> createState() => _Sc1State();

}
Color clr=Colors.red;
bool gess=true;
TextEditingController ex=TextEditingController();
Map temp={};
List display=[
  {"id":1,"name":"Karan"},
  {"id":2,"name":"vansh"},
  {"id":3,"name":"Yagnik"},
  {"id":4,"name":"Ronak"},
  {"id":5,"name":"umang"},

];
List Dummylist=[...display];
class _Sc1State extends State<Sc1> {
  sets(){
    setState(() {
    });
  }
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Hello user",style: TextStyle(color: Colors.white),),backgroundColor: Colors.purple,elevation: 0,),

      body:Container(
        child:Column(
          children: [
            Container(margin: EdgeInsets.only(left:20,right:20,top:10,bottom: 10),
                child: SearchBar(
                  controller: ex,
                  hintText: "Search Users",
                  hintStyle:MaterialStatePropertyAll(TextStyle(color: Colors.black54)),
                  onChanged:Searchbarlogic,
                )
            ),
            ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>Sc2({"id":(display.length+1),"name":""}))).then(
                     (value){
                       if(value!=null){
                         display.add(value);
                         Dummylist.clear();
                         Dummylist.addAll(display);
                         setState(() {
                         });
                       }

                     });
              setState(() {

              });
              }, child: Text("Add")),
            Expanded(
              child: ListView.builder(itemCount: Dummylist.length ,itemBuilder: (context,index){
              return Container(margin: EdgeInsets.only(left:20,right:20,top:10,bottom: 10),
                  child: ListTile(
                    onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Sc2(Dummylist[index]))).then(
                            (value) {
                            for(int i=0;i<display.length;i++){
                             if(display[i]["id"]==value["id"]){
                               display[i]["name"]=value["name"];
                             }
                            }
                            setState(() {});
                            ex.clear();
                            Dummylist.clear();
                            Dummylist.addAll(display);
                            });
                  },
                    shape:RoundedRectangleBorder(side: BorderSide(color:Colors.black54),
                        borderRadius: BorderRadius.circular(20)),
                    titleTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),
                    title: Text(Dummylist[index]["name"]),trailing: GestureDetector(
                    onTap: gess?(){
                        temp=display[index];
                        ScaffoldMessenger.of(context).showSnackBar(SnackDisplay("${display[index]["name"]} Was Deleted"));
                        clr=Colors.red.shade100;
                        display.removeAt(index);
                        Dummylist.clear();
                        Dummylist.addAll(display);
                        gess=false;
                        Timer(Duration(seconds: 5), (){setState(() { gess=true;
                        clr=Colors.red;
                        });});
                        setState(() {
                        });
                      }:(){}
                    ,
                      child: Icon(Icons.delete,color: clr,)),));
              }),
            )
          ],
        )
        ),
    );
  }

  void Searchbarlogic(value){
                  Dummylist.clear();
                        for(int i=0;i<display.length;i++){
                          if((display[i]["name"].toLowerCase()).contains(value.toLowerCase())){
                            Dummylist.add(display[i]);
                           setState(() {
                           });
                          }
                          else{
                          //  Dummylist.clear();
                          }
                        }


              }

  SnackBar SnackDisplay(String displayText) {
    return  SnackBar(
      content: Text(displayText,style: TextStyle(color:Colors.black54,fontWeight: FontWeight.w500),),
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: Duration(seconds: 5),
      dismissDirection: DismissDirection.startToEnd,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      action:
      SnackBarAction(textColor: Colors.redAccent.shade400,
        label: "Undo",onPressed: () {
          display.add(temp);
          Dummylist.clear();
          Dummylist.addAll(display);
            sets();
        },
      ),

    );
  }
}