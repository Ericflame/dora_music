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
    options.headers["cookie"] = """_ntes_nnid=e5cec79fb546d71c3a6606fb97b9e491,1668417688223; _ntes_nuid=e5cec79fb546d71c3a6606fb97b9e491; NMTID=00OYOFGt5O84CTL5k5avu4l6tB2t9AAAAGEdXGVNg; WNMCID=kmmadv.1668417689484.01.0; WEVNSM=1.0.0; WM_TID=QBPEvrOlaFBAVEQVEVKUIC9ze0eG5iYF; unisdk_udid=08614ebe40c59772c5d6ade3e6e515e4; __snaker__id=dsbGJBkhOnCnDabC; YD00000558929251%3AWM_TID=bvdnajR85O9AVAUQRFPQcLSO0qtBG1xC; ntes_kaola_ad=1; NTES_P_UTID=AL1n64NnCjPtEK985hQWNeDNwrhtwO8a|1676337113; nts_mail_user=jujing44073036@163.com:-1:1; __bid_n=186827814fd65176ea4207; FPTOKEN=LOMJqUGtlMzYxHA0mTbjygk1TDeBR9r91ioIypvcwKLuZtbyMl/EDLNVo5bM98yB0OYrzvUhihc9YSQE0u+r/YtIEiqolpZY6gfyli67vNhUME4xHLy8yyOIR6dkEb+vNyHldnvlvmgLFJ8rIV99s/OAHB9S+MWDuXtsOAKhmptEr1U/wgcvJl/7/ie3I61Fxo6x6Y8p24czxkMv5QsgPd4JzlUGhpAMBPILxAp3ZKGpPnTi3ftr/eeOPMa75ZvXoKoTyUXgxwdZCqBK+PD+NUc7yJfPQ5wnBapUCbrTYMIhNbdKIfJUETlueY7GV2HqrnmcXmo3aAXh3SoFYLyIkfZTf54xRD2nBkWF0Ikz2sW8wLqe9dBVNRrz6M9KSyjTj7yadnjU6pp4dug/mX41nw==|22fb4umabrrmn6DSeAI35+g3GSZoYAQ8jLc01xmNrII=|10|8404b9b020298139b5cad07d441a4597; __root_domain_v=.163.com; _qddaz=QD.622778695705947; wyy_uid=66b4e63c-9bba-41b6-b491-740ed49eae96; hb_MA-91DF-2127272A00D5_source=dun.163.com; locale=zh_CN; _gcl_au=1.1.203613562.1678700902; channel="h=yd&t=yd&i18nEnable=true&locale=zh_CN&referrer=https%3A%2F%2Fdun.163.com%2Fdashboard%23%2Fm%2Forder%2Fcaptcha%2F%3FversionType%3D11&fromyd=baiduP2_YZM_CP6742"; hb_MA-93D5-9AD06EA4329A_source=id.grow.163.com; JSESSIONID-WYYY=NbRG4VvdOOvQT%2BIojxR%2FFvmrV%2BASC88o6nbhRjbeAqM%2B%2FekSjsT%5CImK%2F1RtpO9zgOYigNGx3IECoQyyJ0H1uiSDPA8M%2FgFbY9QU2Ps362Jyl39%2F%5CYvOwz4M85Or4sm%2F2aQ9b1woRU%2Bip9x7S3g%5CoB8lQN7Y1g0Oquh%2FrOuvj8b1p6Ms4%3A1680775550469; _iuqxldmzr_=33; WM_NI=j%2FmqA3ePTnF2Il0Asp261DWPDwVOpUA2VY245YHb9EGDgPieONP5ldYeKb0N2WZxLl%2BSPrn%2B4Ko%2BpUIMMr5Cvc6Fij2VkhP5rQzOlUuPIJfAvsAk7zyO9Szei6%2B78tTSOEI%3D; WM_NIKE=9ca17ae2e6ffcda170e2e6eeb4c17cb7bc9a83d253b0b08aa2c54e829e9e82d441aa87b7d7d35ea89f9d95e22af0fea7c3b92aaaf1a392c439a7909c8fc53a8bb400a2f27cf2eaffa5d65c88a99ab0f35f83ee9abab140f7878883bc4f859ca9b1ec6f8d92a0d6ef709bbb8583b346f2899699cf68e98da093ed21f895a1ccf35f8b938393b849b6bdfaa7ec62f28aa589d33fb28fb6b0ef5fb79087abe54bb6ad8f8cb672bb91f7b4f96fabeae5d8bb80988d81a6cc37e2a3; gdxidpyhxdE=lZqltZk6VTEMjkNSD6VuUgyhBR2thUwBGe7gbpylcsgZlyvkZVbSziD2gKJm%5CGl4DKXQBCTQQRWTSIArQVTRBke2NqMEZ4JfWY38XeUZMTz%5CaHxmqAZo5MYXlixSka6Rg44Ewmx3chfR4MriuKKI4xuaK7l%5CoeyC36J0VDxUiisatgTu%3A1680774710395; YD00000558929251%3AWM_NIKE=9ca17ae2e6ffcda170e2e6ee92db4498abbb9bc549f3e78ba6c55b978a9b87d845ae97a397cf4797b40097f92af0fea7c3b92af2bdfda9e661a1eabbb1ef40a896a78ec574b09981ace6608a9aae89db349ab5bab6d053b49ea2afd67d9cefa58bb2348f96baa9c64fa6eb889ab64a88889b8ebb6682aa988cea3988e9a386c2808ab3a192e86aaae8a1b5b5638ba98ca5d83d96eabdd4e740bc9398a7bc409a8aacd0ed689295fb8bbb4babf09ba2d6478fb0afd3dc37e2a3; YD00000558929251%3AWM_NI=2c3Hgkc6uPl4dJimFxlGOKgTJFbhX8ZkvUMYpBnNWwX1kj38MJvHGEf5Hy7BDXUm8nBvXkk3D7meCtJmoqebj8oT6iIwDDU7V6s3d4xMXF94ZVd%2FnlRK5j8Ai0UAWMMpa2Y%3D; NTES_YD_SESS=Wo2hph6wLJ.A5jb9NJA1nl0E2bn_u7cV1R9LTqXcTdUk2wCz2RvHFKf4nzvbog5sO2OWT_sx05__s2FGOnhBXLGG3t3.rQEXKfJ.0vTEbOpULLFF0lV6w0wt4m341DhR8uYIpUIwBrx9bIrB_U4HBmOejNQJ0kf39y1zsu1vDT_Mrh9A4y.TJjKcANHD7EjudWQ6klEWpELlbCj3qwBVyV9tJoyCzemSR2WVlkmAkYHOA; S_INFO=1680773848|0|0&60##|13551369608; P_INFO=13551369608|1680773848|1|music|00&99|null&null&null#CN&null#10#0|&0||13551369608; __remember_me=true; __csrf=0229a2d5c2b85af94f620a798e3691c0; MUSIC_U=33a99a491c6bc89c692686b8cac2add22fb0cea76c043c0b0696c7241ca67e5e993166e004087dd329c41ed5d4ddc22e62760bf0d1b34c45e576514e280126be025a161dc3e5cd0aa0d2166338885bd7""";
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