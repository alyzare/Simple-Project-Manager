import 'package:dio/dio.dart';
import 'package:my_todo/models/Project.dart';
import 'package:my_todo/models/Profile.dart';

class Service {
  static String _url = 'http://xeohad.ir/ali';
  static Dio _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio();
    }
    return _dio;
  }

  static Future<List> getProjects() async {
    try {
      Response response = await getDio().get('$_url/Projects.json');
      List<Project> list = [];
      if (response.statusCode == 200)
        for (var map in response.data) list.add(Project.fromJson(map));
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<List> getProfiles() async {
    try {
      Response response = await getDio().get('$_url/Profiles.json');
      List<Profile> list = [];
      if (response.statusCode == 200)
        for (var map in response.data) list.add(Profile.fromJson(map));
      return list;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
