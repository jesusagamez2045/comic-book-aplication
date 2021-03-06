import 'package:comicbook/controllers/home_page_controller.dart';
import 'package:comicbook/models/comic_model.dart';
import 'package:comicbook/search/search_delegate.dart';
import 'package:comicbook/utils/responsive.dart';
import 'package:comicbook/widgets/comic_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';


class HomePage extends StatelessWidget {

  final HomePageController _homePageController = HomePageController();

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return GetBuilder<HomePageController>(
      init: _homePageController,
      builder: (_) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Last Comics',
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.search
              ), 
              onPressed: (){
                showSearch(context: context, delegate: DataSearch());
              }
            )
          ],
          backgroundColor: Colors.indigo,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: responsive.hp(3),
                ),
                SizedBox(
                  height: responsive.hp(9),
                ),
                ComicBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ComicBox extends StatefulWidget {
  @override
  _ComicBoxState createState() => _ComicBoxState();
}

class _ComicBoxState extends State<ComicBox> {

  PageController _pageController;

  @override
  void initState() {
    this._pageController = new PageController(
      initialPage: 0,
      viewportFraction: 0.75
    );
    this._pageController.addListener(() {
      if(this._pageController.position.pixels >= _pageController.position.maxScrollExtent - 10){
        Get.find<HomePageController>().getComics();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    this._pageController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return Container(
      height: responsive.hp(60),
      child: GetBuilder<HomePageController>(
        id: 'ComicBox',
        builder: (_) {
          if(_.isLoadingComics){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return PageView.builder(
              controller: this._pageController,
              pageSnapping: false,
              itemCount: _.comics.length,
              itemBuilder: (BuildContext context, int index){
                final Comic comic = _.comics[index];
                return ComicCard(comic: comic,);
              },
            );
          }
        }
      ),
    );
  }
}