import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'host')
  static String host = _Env.host;
  @EnviedField(varName: 'port')
  static int port = _Env.port;
  @EnviedField(varName: 'database')
  static String database = _Env.database;
  @EnviedField(varName: 'username')
  static String username = _Env.username;
  @EnviedField(varName: 'password')
  static String password = _Env.password;


  @EnviedField(varName: 'imgurClientId')
  static String imgurClientId = _Env.imgurClientId;
  @EnviedField(varName: 'imgurClientSecret')
  static String imgurClientSecret = _Env.imgurClientSecret;
  @EnviedField(varName: 'imgurAccessToken')
  static String imgurAccessToken = _Env.imgurAccessToken;
  @EnviedField(varName: 'imgurRefreshToken')
  static String imgurRefreshToken = _Env.imgurRefreshToken;
  @EnviedField(varName: 'sakamichiAlbumHash')
  static String sakamichiAlbumHash = _Env.sakamichiAlbumHash;
}