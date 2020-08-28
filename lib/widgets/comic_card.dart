import 'package:comicbook/models/comic_model.dart';
import 'package:comicbook/pages/detail_comic_page.dart';
import 'package:comicbook/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ComicCard extends StatelessWidget {

  final Comic comic;

  const ComicCard({@required this.comic});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return GestureDetector(
      onTap: (){
        Get.to(DetailComicPage(comic: this.comic));
      },
      child: Container(
        margin: EdgeInsets.only(left: responsive.ip(2)),
        height: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: '${this.comic.id}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/images/no-image.jpg'), 
                    image: NetworkImage(this.comic.image.mediumUrl),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                ),
              ),
            ),
            SizedBox(
              height: responsive.ip(2),
            ),
            Text(
              '${this.comic.name?? ''}',
              style: TextStyle(
                fontSize: responsive.ip(2),
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}