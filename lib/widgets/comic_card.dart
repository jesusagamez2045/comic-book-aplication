import 'package:comicbook/utils/responsive.dart';
import 'package:flutter/material.dart';


class ComicCard extends StatelessWidget {

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
                image: NetworkImage('https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                fit: BoxFit.cover,
                width: double.infinity,
              )
            ),
          ),
          SizedBox(
            height: responsive.hp(2),
          ),
          Text(
            'el titulo',
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