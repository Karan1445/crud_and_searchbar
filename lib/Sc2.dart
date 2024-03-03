import 'package:flutter/material.dart';

class Sc2 extends StatelessWidget{
  Sc2(this.passData);
  String? onc_val;
  Map passData={};
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,title: Text("Hello "+passData["name"],style: TextStyle(color: Colors.white),),backgroundColor: Colors.purple,),
        body:Column(children: [
            Container(margin: EdgeInsets.only(left:20,right:20,top:10,bottom: 10),
              child: TextFormField(onChanged: (value) {
                onc_val = value;
                },
                  style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black45),
              decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)))),
            ),
          ElevatedButton(onPressed: (){
            if(passData["name"]!="") {
              if (onc_val == null) {
                onc_val = passData["name"];
                ScaffoldMessenger.of(context).showSnackBar(SnackDisplay(
                    "Empty Value Cannot be ${passData["name"] == ""
                        ? "Add"
                        : "Update"}"));
              }
              else {
                passData["name"] = onc_val;
                //print(passData["name"]);
                Navigator.pop(context, passData);
              }
            }else{
              if (onc_val == null) {
                ScaffoldMessenger.of(context).showSnackBar(SnackDisplay(
                    "Empty Value Cannot be ${passData["name"] == ""
                        ? "Add"
                        : "Update"}"));
              }
              else {
                passData["name"] = onc_val;
                //print(passData["name"]);
                Navigator.pop(context, passData);
              }
            }
          }, child: Text(passData["name"]==""?"Add":"Update"))
        ],),
    );
  }

  SnackBar SnackDisplay(String displayText) {
    return  SnackBar(
              content: Text(displayText,style: TextStyle(color:Colors.black54,fontWeight: FontWeight.w500),),
              backgroundColor: Colors.transparent,
              elevation: 0,
              duration: Duration(seconds: 5),
              dismissDirection: DismissDirection.startToEnd,
             clipBehavior: Clip.antiAliasWithSaveLayer,
            );
  }
}