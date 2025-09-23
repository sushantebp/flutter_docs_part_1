import 'package:learn_app/models/album.dart';

extension AlbumExtension on Album {
  Album toAlbumDomain() => Album(userId: userId, id: id, title: title);
}
