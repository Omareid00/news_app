import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'local_data_source.dart';

class LocalDataImp implements LocalDataSource{
   Future<BoxCollection> getCollection() async {
     Directory dir= await getApplicationCacheDirectory();
    final collection = await BoxCollection.open(
      'news', // Name of your database
      {'sources'}, // Names of your boxes
      path: dir.path, // Path where to store your boxes (Only used in Flutter / Dart IO)
    );
    return collection;
  }
  @override
  Future<void> saveSources(Map sources) async {
     var collection=await getCollection();
     var box=await collection.openBox<Map>("sources");
     await box.put("source", sources);
     collection.close();

  }

  @override
  Future<Map> getSources() async {
    var collection=await getCollection();
    var box=await collection.openBox<Map>("sources");
    var data=  await box.get("source")??{};
    collection.close();
    return data;


  }
 
  }
  
