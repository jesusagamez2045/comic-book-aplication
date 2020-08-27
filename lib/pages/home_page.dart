import 'package:comicbook/utils/responsive.dart';
import 'package:comicbook/widgets/comic_card.dart';
import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return Scaffold(
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
              Padding(
                padding: EdgeInsets.only(left: responsive.hp(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Last Comics',
                      style: TextStyle(
                        fontSize: responsive.hp(5),
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: responsive.hp(5),
                      icon: Icon(
                        Icons.search
                      ), 
                      onPressed: (){}
                    )
                  ],
                ),
              ),
              SizedBox(
                height: responsive.hp(9),
              ),
              ComicBox(),
            ],
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
      initialPage: 1,
      viewportFraction: 0.75
    );
    this._pageController.addListener(() {
      
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final Responsive responsive = new Responsive.of(context);
    return Container(
      height: responsive.hp(60),
      child: PageView.builder(
        controller: this._pageController,
        physics: BouncingScrollPhysics(),
        pageSnapping: false,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index){
          return ComicCard();
        },
      ),
    );
  }
}