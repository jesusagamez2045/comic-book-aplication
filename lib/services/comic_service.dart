

import 'package:comicbook/models/comic_model.dart';
import 'package:dio/dio.dart';

class ComicService{

  ComicService._internal();
  
  static ComicService _instance = ComicService._internal();
  static ComicService get instance => _instance;
  
  final String _apiKey = "e952c7b1cceaaaf087a9710fadf913ca54e17877";
  final Dio _dio = new Dio(BaseOptions(baseUrl: 'https://comicvine.gamespot.com/api'));

  Future<List<ComicModel>> getLastComics() async{
    try {
      final response = await _dio.get('/volumes/?api_key=${this._apiKey}&limit=10&format=json');
      print(response.data);
      if(response.statusCode == 200){

        return [];
      }else{
        return null;
      }
    } catch (e) {
      return null;
    }
  }

}