import 'package:dio/dio.dart';

import '../constant.dart';
import 'http_exception.dart';

// 自定义拦截器
class HttpInterceptor extends Interceptor {
  // 请求拦截
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.headers["cookie"] = """MUSIC_R_T=1496668030142; MUSIC_A_T=1496668005157; _ntes_nuid=e5cec79fb546d71c3a6606fb97b9e491; _ntes_nnid=e5cec79fb546d71c3a6606fb97b9e491,1668417688223; NMTID=00OYOFGt5O84CTL5k5avu4l6tB2t9AAAAGEdXGVNg; WNMCID=kmmadv.1668417689484.01.0; WEVNSM=1.0.0; WM_TID=QBPEvrOlaFBAVEQVEVKUIC9ze0eG5iYF; unisdk_udid=08614ebe40c59772c5d6ade3e6e515e4; __snaker__id=dsbGJBkhOnCnDabC; YD00000558929251%3AWM_TID=bvdnajR85O9AVAUQRFPQcLSO0qtBG1xC; ntes_kaola_ad=1; NTES_P_UTID=AL1n64NnCjPtEK985hQWNeDNwrhtwO8a|1676337113; nts_mail_user=jujing44073036@163.com:-1:1; __bid_n=186827814fd65176ea4207; FPTOKEN=LOMJqUGtlMzYxHA0mTbjygk1TDeBR9r91ioIypvcwKLuZtbyMl/EDLNVo5bM98yB0OYrzvUhihc9YSQE0u+r/YtIEiqolpZY6gfyli67vNhUME4xHLy8yyOIR6dkEb+vNyHldnvlvmgLFJ8rIV99s/OAHB9S+MWDuXtsOAKhmptEr1U/wgcvJl/7/ie3I61Fxo6x6Y8p24czxkMv5QsgPd4JzlUGhpAMBPILxAp3ZKGpPnTi3ftr/eeOPMa75ZvXoKoTyUXgxwdZCqBK+PD+NUc7yJfPQ5wnBapUCbrTYMIhNbdKIfJUETlueY7GV2HqrnmcXmo3aAXh3SoFYLyIkfZTf54xRD2nBkWF0Ikz2sW8wLqe9dBVNRrz6M9KSyjTj7yadnjU6pp4dug/mX41nw==|22fb4umabrrmn6DSeAI35+g3GSZoYAQ8jLc01xmNrII=|10|8404b9b020298139b5cad07d441a4597; __root_domain_v=.163.com; _qddaz=QD.622778695705947; wyy_uid=66b4e63c-9bba-41b6-b491-740ed49eae96; hb_MA-91DF-2127272A00D5_source=dun.163.com; locale=zh_CN; _gcl_au=1.1.203613562.1678700902; channel="h=yd&t=yd&i18nEnable=true&locale=zh_CN&referrer=https%3A%2F%2Fdun.163.com%2Fdashboard%23%2Fm%2Forder%2Fcaptcha%2F%3FversionType%3D11&fromyd=baiduP2_YZM_CP6742"; hb_MA-93D5-9AD06EA4329A_source=id.grow.163.com; WM_NIKE=9ca17ae2e6ffcda170e2e6ee82c17fb29ead88f046f7b08aa2c84e878f9f83d16facb8f7d0b55b989a8194b22af0fea7c3b92af2ef9ea5ef3fa8aefbd1f542b2eea3b1eb7fa3e9a495b84181f1b9abf452a19faea7c652a7bea78acd5da2b6afd4ce728faca090c747e98ee1b0ef62acb58eb7f453ad94a385c54ebc999bdab57b909fa7dace4a9bf19cd4cd8086bebf96b660b1ba9d8bd46995bfa786d839f3bcc0b9ae43b590c096d36af4b1a194f7509ced96d4d837e2a3; WM_NI=21RDl5dr50vJr2mPhua7lt5KC%2FwJqZcAbFGZebiiNWbja3OzMtPoDM%2BR%2FOljhkBVqYoLmdFFxGU96qLAi9OBY%2FT3NtFbqu7TsfSjQcWaieU31dpX%2FIwPpuPb0oostDX3Z3U%3D; YD00000558929251%3AWM_NIKE=9ca17ae2e6ffcda170e2e6eed8c46092bef8b9d64aa7a88bb7d44a829f9e87c45cf4b9bc96b55ea88e97d6b32af0fea7c3b92a8bb3b9d5eb3c9ce70085e768bbb187afd073ad91e5bac470b78aa6aef369a7b29eb6c26292ecfdccc653b2af888ac961e9adad89e93cacf1a1a8cc40829bbc8fee3bb8a9feb3b239969c8dd3d84f9b939f99cf628df1a5a2b3648dedbdb4c6638ab1f9d5d95ea6aa8992e9418188ac87f150878a00a7bc679cba9f97f36683ac828dee37e2a3; YD00000558929251%3AWM_NI=Imw4h0X90ddlyoINMyoO%2BYAduVjMpcenRUCjR43%2BGYrqHiJk%2Bschj0h%2FoGI4BEtno1tw2R33VDC2UEYMQxLjO%2FkA0hO3sSGiJo74ZVfvGqjKCXdfrDEV0F9mXfQvpnAtNlo%3D; JSESSIONID-WYYY=UT1REU%2FO3rucq1pKiPd5IH%5CUdWI%5C1OqEKNfiOvsGa%2FCC7meVpGZ0wHZj7tvrhx%5CnmnVbcOWxYlIUJ6pxxd0dH4ybdKTE7fIpQ%5C16NYIY4Q1lZ3B3ZM4UXVe7PcqcCarwTmgpYkQ7l%2FlCg7zrJt94q0RB%2FpJbHiZaMN9unJmhGlYWZCNB%3A1680056703001; _iuqxldmzr_=33; gdxidpyhxdE=rfaY2oq4I3%2BjOcVOCvto2vgab3ulQQSb4LOUNxNhZLxQxIuaXpmvXn2xypORqesIAsCg23zh34A7QE86KHbJAAlhiriuEf%2BoLeIiPvgyfjw60ypHe35mL2cN%5Ch5ZSRrQ7no7DVf4KwD%2FsxIDRademB0ESIBovbpv%2FaSMymnMVOirx7%5CO%3A1680055894675; NTES_YD_SESS=gn_XsDal1zDv5De6D5Vhtf.z0BO7b4hrMwEnIaY0yEa7j0mKjiCG5_uIvKCwXTyUcjcgJtU4oyttUj5DcvNQs3DD.S.rR7bs_uhroCJbwcqCqojFvJCMIjG2uUGsIsM_78cwk9oj4bFfSw0HPHOVAOamu7V84kw2.Ru_grGud_efM4X5V2Qqkj8aLOc46xA1ly9MUfKNTw.ykvE8oAS9zT44wnGvZSNYcsPZp9Lco7dW8; S_INFO=1680055010|0|0&60##|13551369608; P_INFO=13551369608|1680055010|1|music|00&99|null&null&null#sic&510100#10#0|&0|null|13551369608; MUSIC_U=00DC1FD5E06178AE9666701F50FE0C18F083096358C4E774B6C0B607C29DC21D98E546D47D5A8DF345C0D64CF59C9786D738292C741101C288B8C115BABC3E126157145BAE4A254502E07B9DF5F8ADAFCEC7D3850CA2D6FB18DE495C60DD4740807AB75890AC875E8014437E440BF9F1C6B164AC7C4157BF21DB5FA4A3CF7040719DDFFE616CE17553778540598B44ACB84ABAFF6246EBED687DA92F173003B35FC601C8476A7D5C4272C34C3B4215EE92DE7876FAE187D4A2B02F4EB4F76AA58EECBE23F843C2AA39342C8A5ADD7BAF26589F23A23F6ECD526B9DBF3A217F07341C911706EA5BAEF935355DB9ACED8FBFE3B10B92DA39AF7EBB37C335FDA40BFDA0A9DA98B6B647811B0517B151184B1903266C08174C9DFE2977B559CFCAAD84CF5205C94D2A281271476C16D7B39270CAFB9F9A643EC1BA6FF89E49F89F6671A05C1295D80656DF4864E1CAE4B3041C; __csrf=4fd31ccab3e91fb85ea8e033a4bdeae7; __remember_me=true""";
    // options.headers["Authorization"] = "Bearer " + (Constant.accessToken ?? "");
    // options.headers["cid"] = Constant.userInfo.oid ?? "";
    // options.headers["province-code"] = "510000";
    super.onRequest(options, handler);
  }

  // 响应拦截
  @override
  Future onResponse(
      Response response,
      ResponseInterceptorHandler handler,
      ) async {
    // do something...
    super.onResponse(response, handler);
  }

  // 异常拦截
  @override
  Future onError(
      DioError err,
      ErrorInterceptorHandler handler,
      ) async {
    // 覆盖异常为自定义的异常类
    HttpException httpException = HttpException.create(err);
    err.error = httpException;
    super.onError(err, handler);
  }
}