

import 'package:comicbook/models/comic_model.dart';
import 'package:comicbook/services/comic_service.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePageController extends GetxController{

  List<Comic> _comics = List();
  bool _loadingComics = false;
  bool _loadingMore = false;
  int _limit = 10;
  int _offset = 0;

  List<Comic> get comics => this._comics;
  bool get isLoadingComics => this._loadingComics;

  @override
  void onReady() {
    super.onReady();
    getComics();
  }

  getComics() async{
    if(_offset == 0){
      this._loadingComics = true;
      update(['ComicBox']);
    }
    if(!this._loadingMore){
      this._loadingMore = true;
      var response = await ComicService.instance.getLastComics(this._limit, this._offset);
      this._loadingMore = false;
      this._limit += 10;
      this._offset += 10;
      if(response != null){
        this._comics.addAll(response);
      }else{
        Get.snackbar('Ups!', 'Ha ocurrido un error inesperado');
      }
      this._loadingComics = false;
      update(['ComicBox']);
    }
  }
}