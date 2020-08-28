import 'package:comicbook/models/comic_model.dart';
import 'package:comicbook/utils/responsive.dart';
import 'package:flutter/material.dart';


class ComicCard extends StatelessWidget {

  final Comic comic;

  const ComicCard({@required this.comic});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(left: responsive.hp(3)),
      height: double.infinity,
      child: Column(
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FadeInImage(
                placeholder: AssetImage('assets/images/no-image.jpg'), 
                image: NetworkImage(this.comic.image.mediumUrl),
                fit: BoxFit.cover,
                width: double.infinity,
              )
            ),
          ),
          SizedBox(
            height: responsive.hp(2),
          ),
          Text(
            '${this.comic.name}',
            style: TextStyle(
              fontSize: responsive.hp(3),
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}