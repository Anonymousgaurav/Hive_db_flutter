import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hive_flutter_database/enums.dart';
import 'package:hive_flutter_database/model/get_album_model.dart';
import 'package:hive_flutter_database/network/http_handler.dart';
import 'package:hive_flutter_database/provider/get_album_provider.dart';


class AlbumNetwork {
  Future<bool> getAlbum(BuildContext context) async {
    log("Requesting Album List...");
    String msgListUrl = "https://jsonplaceholder.typicode.com/albums";
    var albumListResponse = await HTTPHandler()
        .httpRequest(url: msgListUrl, method: RequestType.GET);
    if (albumListResponse == false) {
      return false;
    } else {
      log("ALBUM LIST API RESPONSE SUCCESSFUL");
      var data = albumListResponse;
      List<Album> albumList = List<Album>.from(
          data.map((model) => Album.fromJson(model)));
      await GetAlbumProvider().updateAlbumData(albumList);
      await GetAlbumProvider().saveOfflineData(albumList);

      return true;
    }
  }
}
