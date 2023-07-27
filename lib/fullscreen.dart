import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:wallpaper_app_2/wallpaper.dart';
//import 'package:wallpaper_manager/wallpaper_manager.dart';

class FullScreen extends StatefulWidget {
  final String imageurl;

  const FullScreen({key,   required this.imageurl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
 //  Future<void>setwallpaper() async{
 // var WallpaperManager;
 // int location = WallpaperManager.HOME_SCREEN;
 // var file = await DefaultCacheManager().getSingleFile(widget.imageurl);
 // final String result = await WallpaperManager.setWallpaperFromFile(file.path ,location);
 //}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(child: Container(
             child: Image.network(widget.imageurl),
            ),
            ),
            InkWell(  //to load more images from pixel, only when taped o it.
              onTap: (){
                //setwallpaper();
              },
              child: Container(
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.circular(15.0),
                //   color: Colors.black54,

                height: 45.0,
                width: double.infinity, // Used to acquire full screen space.
                child: Center(
                  child: Text("Set Wallpaper",
                    style: TextStyle(fontSize: 20,
                      color: Colors.white,),),
                ),),
            ),
          ]
        ),
      ),
    );
  }
}
