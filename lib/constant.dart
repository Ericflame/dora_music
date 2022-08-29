class Constant {
  // static String baseUrl = "https://netease-cloud-music-api-crete722p-hannah-bingo.vercel.app";
  // static String baseUrl = "http://localhost:3000/";
  static String baseUrl = "https://musicapi.adicw.cn/";
}

class API{
  static String getMvTop = Constant.baseUrl + "/top/mv";//Mv排行
  static String getPlayList = Constant.baseUrl + "/top/playlist/highquality";//获取精品歌单
  static String getRadioList = Constant.baseUrl + "/personalized/djprogram";//获取电台列表
  static String getSingersList = Constant.baseUrl + "/artist/list";//获取歌手列表
  static String getSingersDetails = Constant.baseUrl + "/artists";//获取歌手列表
  static String getSingerDetails = Constant.baseUrl + "/artist/desc";//获取歌手详细信息
  static String getSingerAlbum = Constant.baseUrl + "/artist/album";//获取歌手专辑信息
  static String getSingerMv = Constant.baseUrl + "/artist/mv";//获取歌手Mv信息


}