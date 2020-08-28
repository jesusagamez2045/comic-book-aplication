import 'package:comicbook/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:comicbook/models/comic_model.dart' as model;
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';


class DetailComicPage extends StatelessWidget {

  final model.Comic comic;

  const DetailComicPage({@required this.comic});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _appBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: responsive.hp(2),
                ),
                _comicTitle(context),
                _description(context),
              ]
            ),
          ),
        ],
      ),
    );
  }

  Widget _appBar(BuildContext context){
    final Responsive responsive = new Responsive.of(context);
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.indigo,
      expandedHeight: responsive.hp(25),
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          '${this.comic.name?? ''}',
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.hp(2.5)
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/images/loading.gif'), 
          image: NetworkImage(this.comic.image.screenUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _comicTitle(BuildContext context){
    final String publishdate = DateFormat("dd/MM/yyyy H:mm").format(this.comic.dateAdded);
    final Responsive responsive = new Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.hp(2)),
      child: Row(
        children: <Widget>[
          Hero(
            tag: '${this.comic.id}',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(this.comic.image.mediumUrl),
                height: responsive.hp(20),
              ),
            ),
          ),
          SizedBox(
            width: responsive.hp(3),
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${this.comic.name}',
                  style: TextStyle(
                    fontSize: responsive.hp(4)
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  'Publicado el: $publishdate',
                  style: TextStyle(
                    fontSize: responsive.hp(2)
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _description(BuildContext context){
    final Responsive responsive = new Responsive.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: responsive.hp(2), vertical: responsive.hp(3)),
      child: Html(
        data: this.comic.description?? '',
      ),
    );
  }

}