import 'package:comicbook/models/comic_model.dart';
import 'package:comicbook/pages/detail_comic_page.dart';
import 'package:comicbook/services/comic_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class DataSearch extends SearchDelegate{
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear
        ), 
        onPressed: (){
          query = '';
        }
      )
    ];
  }
  
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation
      ), 
      onPressed: (){
        close(context, null);
      }
    );
  }
  
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {

    if(query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: ComicService.instance.getFilterComics(query),
      builder: (BuildContext context, AsyncSnapshot<List<Comic>> snapshot){
        if(snapshot.hasData){
          final comics = snapshot.data;
          return ListView.builder(
            itemCount: comics.length,
            itemBuilder: (BuildContext context, int index) {
              final comic = comics[index];
              final String publishdate = DateFormat("dd/MM/yyyy H:mm").format(comic.dateAdded);
              return ListTile(
                leading: FadeInImage(
                  placeholder: AssetImage('assets/images/no-image.jpg'), 
                  image: NetworkImage(comic.image.iconUrl),
                  fit: BoxFit.contain,
                  width: 50,
                ),
                title: Text('${comic.name}'),
                subtitle: Text('Publicado el: $publishdate'),
                onTap: (){
                  close(context, null);
                  Get.to(DetailComicPage(comic: comic));
                },
              );
            },
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );      
        }
      }
    );
  }

}