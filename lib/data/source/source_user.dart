import 'package:d_info/d_info.dart';
import 'package:money/config/api.dart';
import 'package:money/config/app_request.dart';
import 'package:money/config/session.dart';
import 'package:money/data/model/user.dart';

class SourceUser{
  static Future<bool> login (String email,String password) async {
    String url = Api.user+'/login.php';
    Map? responseBody = await AppReq.post(url,{
      "email":email,
      "password":password,
    });
    if (responseBody==null) {
      return false;
    }
    if (responseBody['success']) {
      var mapUser = responseBody['data'];
      Session.saveUser(User.fromJson(mapUser));
    }
    return responseBody['success'];
  }
   static Future<bool> register (String name,String email,String password) async {
    String url = Api.user+'/register.php';
    Map? responseBody = await AppReq.post(url,{
      "name":name,
      "email":email,
      "password":password,
      'created_at':DateTime.now().toIso8601String(),
      'update_at':DateTime.now().toIso8601String()
    });
    if (responseBody==null) 
      return false;
    
    if (responseBody['success']) {
      DInfo.dialogSuccess("Register Success !");
      DInfo.closeDialog();
    }else{
      if (responseBody['message']=='email') {
        DInfo.dialogError("Email Has Already");
        
      }else{
        DInfo.dialogError("Register Failed !");
      }
      DInfo.closeDialog();
    }
    return responseBody['success'];
  }
}