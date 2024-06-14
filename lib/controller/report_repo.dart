import 'dart:convert';

import 'package:report_app/model/report_model/report_model.dart';
import 'package:http/http.dart' as http;

class ReportRepo {
 
  Future<List<ReportModel>> fetchReports() async {
    try {
      final response =
          await http.get(Uri.parse('http://10.0.2.2:3000/api/reports'));

      if (response.statusCode == 200) {
        print('Response OK');
        List<dynamic> jsonData = json.decode(response.body);
        List<ReportModel> reports =
            jsonData.map((json) => ReportModel.fromJson(json)).toList();
        return reports;
      } else {
        throw Exception("Failed to fetch reports");
      }
    } catch (error) {
      throw Exception("Error: --> $error");
    }
  }

}
