import 'package:http/http.dart' as http;
import 'dart:convert';

class Info{
  getReq(String url)async{
   try{
     var resp= await http.get(Uri.parse(url));

     if(resp.statusCode ==200){

       var respbody= jsonDecode(resp.body);
       return respbody;
     }
     else{
       print("Error ${resp.statusCode}");
     }
   }
   catch(e){
     print("Error Catch$e");
   }
    }

    postReq(String url , Map data)async{
      try{
        var resp= await http.post(Uri.parse(url),body: data);

        if(resp.statusCode ==200){

          var respbody= jsonDecode(resp.body);
          return respbody;
        }
        else{
          print("Error ${resp.statusCode}");
        }
      }
      catch(e){
        print("Error Catch$e");
      }
    }
  }
