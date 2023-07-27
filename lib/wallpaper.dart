import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http; //use this format to run http
import 'package:flutter/material.dart';
import 'package:wallpaper_app_2/fullscreen.dart';

class Wallpaper extends StatefulWidget {

  @override
  State<Wallpaper> createState() => _WallpaperState();
}

class _WallpaperState extends State<Wallpaper> {
  List images=[];
  int page=1;
    @override
  void initState(){
    super.initState();
    fetchapi();
  }
  fetchapi() async{
  await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),// from pixel documentation file
      headers:{'Authorization':'PSlu8hZwKVXKhsxtKLJClgnl05JZlNx7CRjPc16O6j6VflWuEkzYKZRI'}) // from my pixel profile
      .then((value){
    Map result=jsonDecode(value.body);
       setState(() {
         images= result['photos'];
       });
       print (images);
  });
}
loadmore()async{
    setState(() {
      page = page+1;
    });
 String url =
     "https://api.pexels.com/v1/curated?per_page=80&page" + page.toString(); // this brings the page number
    await http.get(Uri.parse("https://api.pexels.com/v1/curated?per_page=80"),// from pixel documentation file
        headers:{'Authorization':'PSlu8hZwKVXKhsxtKLJClgnl05JZlNx7CRjPc16O6j6VflWuEkzYKZRI'}) // from my pixel profile
        .then((value) {
      Map result = jsonDecode(value.body);
      setState(() {
        images.addAll(result['photos']);
      });
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container(
            child: GridView.builder(
                itemCount: images.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 2,//Spacing between two horizontal pictures.
                  crossAxisCount: 3, //Number of pictures in a row.
                  childAspectRatio: 2/3, // Height and width of picture.
                  mainAxisSpacing: 2, //Space between column.
                ),
                itemBuilder: (context, index){
                  return InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FullScreen(
                        imageurl : images[index]['src']['large2x'],
                      )));
                    },
                    child: Container(color: Colors.white,
                    child: Image.network(images[index]
                    ['src'] //src=source file.
                    ['tiny'], //tiny is form propreties of images in pixel.
                    fit: BoxFit.cover,
                    ),
                    ),
                  );
            }),
          )),
          InkWell(  //to load more images from pixel, only when taped o it.
            onTap: (){
              loadmore();
            },
            child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15.0),
                 color: Colors.black54,
               ),
               height: 45.0,
              width: double.infinity, // Used to acquire full screen space.
              child: Center(
                child: Text("Load More",
                style: TextStyle(fontSize: 20,
                  color: Colors.white,),),
              ),),
          )
        ],
      ),
    );
  }
}
