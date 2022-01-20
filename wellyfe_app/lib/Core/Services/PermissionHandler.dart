import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
    static Future<bool> requestPermission() async {
      var result;
      var status = await Permission.activityRecognition.status;
      print("Status " + status.isDenied.toString());
      if (status.isDenied){
        result = await Permission.activityRecognition.request().isGranted;
        print("Result " + result.toString());
        return result;
      }
      else if (status.isGranted) return true;
      return false;
  }
}