import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mute_motion/core/utils/constant.dart';
import 'package:mute_motion/feature/searsh/lastestsearchwidget.dart';



class SearchScreen extends StatefulWidget{
  SearchScreen({ Key?key}):super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{

  IconData icon=FontAwesomeIcons.locationArrow;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color(0xff003248),
        appBar: AppBar(
          title: Text('Search ', style: TextStyle(
              fontSize: 25, fontFamily: 'Lato', color: Colors.white),),
          //leading: Icon(Icons.arrow_back_ios_new, color: Colors.white,),
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        body: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: double.infinity,
            padding: const EdgeInsets.only(
              top: 30,
              left: 15,
            ),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )
            ),


            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text('Current Location', style: TextStyle(
                        fontSize: 18, fontFamily: 'Lato', color: borderColor),),
                    SizedBox(height: 6,),
                    TextFormField(

                      decoration: InputDecoration(
                        prefixIcon:Icon(
                          FontAwesomeIcons.locationDot,
                          size: 22,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),

                        // focusedBorder: buildOutlineInputBorder(),

                        hintText:'From',

                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Your destination', style: TextStyle(
                        fontSize: 18, fontFamily: 'Lato', color: borderColor),),
                    SizedBox(height: 6,),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon:Icon(
                          FontAwesomeIcons.locationArrow,
                          size: 22,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: borderColor,
                          ),
                        ),

                        // focusedBorder: buildOutlineInputBorder(),

                        hintText:'To' ,

                      ),
                    ),
                    SizedBox(height: 18,),
                    Row(
                      children: [

                        Icon(
                          FontAwesomeIcons.mapLocationDot,
                          color: borderColor,
                          size: 22,
                        ),
                        SizedBox(width: 15,),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Text(
                            'Choose on Map',
                            style: TextStyle(
                              color: Color(0xFF003248),
                              fontSize: 18,
                              fontFamily: 'Lato',
                              fontWeight: FontWeight.w800,
                              height: 0.06,
                              letterSpacing: 0.36,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(
                      thickness: 2,
                      indent: 20,
                      endIndent: 20,
                      color: borderColor,
                    ),
                    SizedBox(height: 20,),
                    Text(
                      'Latest Searches',
                      style: TextStyle(
                        color: Color(0xFF003248),
                        fontSize: 18,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w700,
                        height: 0.06,
                        letterSpacing: 0.36,
                      ),
                    ),
                    SizedBox(height: 12,),
                    LastestSearch(cityname: 'Nasr City - Egypt',
                      distance: '25km',),
                    SizedBox(height: 10,),
                    LastestSearch(cityname: '6october - Zamalek',
                      distance: '50k',),
                    SizedBox(height: 10,),
                    LastestSearch(cityname: 'Mansura - Zagazig',
                      distance: '30km',),

                  ],
                ),
              ),
            )
        )
    );

  }}
