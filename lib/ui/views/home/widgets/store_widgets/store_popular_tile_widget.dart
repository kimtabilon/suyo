import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:suyo/models/store_model.dart';

class StorePopularTileWidget extends StatelessWidget {

  final StoreModel store;

  StorePopularTileWidget({this.store});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.zero,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 5,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Color(int.parse(store.theme)),
                        child: CachedNetworkImage(
                          imageUrl: store.logo,
                          placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CachedNetworkImage(
                        imageUrl: store.banner,
                        imageBuilder: (context, imageProvider) => Container(
                          height: double.infinity,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(store.name, style: TextStyle(fontSize: 16)),
                        Text(store.tag, style: TextStyle(fontSize: 12),),
                        SizedBox(height: 5.0,),
                        Row(
                          children: [
                            Text('4.3', style: TextStyle(fontSize: 12.0, color: Colors.yellow),),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star, color: Colors.yellow, size: 12.0,),
                            Icon(Icons.star_border, color: Colors.yellow, size: 12.0,),
                          ],
                        ),
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
