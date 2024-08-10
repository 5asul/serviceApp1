import 'package:http/http.dart' as http;
import 'dart:convert';
mixin Crud {
  getRequest(String url) async {
    try{

      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200){
        var responbody = jsonDecode(response.body);
        return responbody;

      }else {
        print('error${response.statusCode}');
      }

    }catch(e){
      print("Error$e");
    }
  }
  postRequest(String url, Map data) async {
    await Future.delayed(Duration(seconds: 3));
    try{

      var response = await http.post(Uri.parse(url), body:data);
      if (response.statusCode == 200){
        var responbody = jsonDecode(response.body);
        return responbody;

      }else {
        print('error${response.statusCode}');
      }

    }catch(e){
      print("Error Catch$e");
    }
  }
}
