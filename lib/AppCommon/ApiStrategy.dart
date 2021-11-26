import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:testapp/Models/LoginScreenModel/LoginModel.dart';

import 'AppConstants.dart';
import 'CommonFunctions.dart';
import 'SharedPreferences.dart';

class ApiStrategy {
  static ApiStrategy _instance = ApiStrategy._internal();

  static const int connectTimeOut = 100 * 1000;
  static const int receiveTimeOut = 150 * 1000;

  Dio? _client;

  static ApiStrategy getInstance() {
    return _instance;
  }

  ApiStrategy._internal() {

    if (_client == null) {
      BaseOptions options = new BaseOptions();
      options.connectTimeout = connectTimeOut;
      options.receiveTimeout = receiveTimeOut;
      options.baseUrl = BASEURL;
      _client = new Dio(options);
      _client!.interceptors.add(LogInterceptor(
        responseBody: true,
        requestHeader: false,
        responseHeader: false,
        request: false,
      ));

    }
  }

  Dio get client => _client!;
  static const String GET = "get";
  static const String POST = "post";

  static String getBaseUrl() {
    return BASEURL;
  }

  //Get Method Call
  void get(
    String url,
    Function callBack, {
    Map<String, dynamic>? params,
    Function? errorCallBack,
    CancelToken? token,
  }) async {
    _request(
      url,
      callBack,
      method: GET,
      params: params,
      errorCallBack: errorCallBack,
      token: token,
    );
  }

  //Post Method Call
  void post(
    String url,
    Function callBack,
    ProgressCallback progressCallBack, {
    FormData? formData,
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    Function? errorCallBack,
    CancelToken? token,
        bool addHeader = false,
  }) async {
    _request(
      url,
      callBack,
      method: POST,
      params: params,
      formData: formData,
      queryParams: queryParams,
      errorCallBack: errorCallBack,
      progressCallBack: progressCallBack,
      token: token,
      addHeader: addHeader,
    );
  }


  void _request(
    String url,
    Function callBack, {
    String? method,
    Map<String, dynamic>? params,
    Map<String, dynamic>? queryParams,
    FormData? formData,
    Function? errorCallBack,
    ProgressCallback? progressCallBack,
    CancelToken? token,
        bool addHeader = false,
  }) async {

    try {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _handError(errorCallBack, NOINTERNETCONNECTION);
        showGetxBar(APP_NAME, NOINTERNETCONNECTION);
        return;
      }

      if (SharedPrefs.isContains(LOGINDATA)) {
        LoginModel loginModel = LoginModel.fromJson(
            SharedPrefs.getCustomObject(LOGINDATA));
        _client!.options.headers = {
          "Authorization": "Bearer ${loginModel.accessToken}",
          "Content-Type": "application/json",
          "Accept": "application/json"
        };
      }
      else {
        _client!.options.headers =
        {"Content-Type": "application/json", "Accept": "application/json"};
      }

      Response? response;
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await _client!.get(
            getBaseUrl() + url,
            queryParameters: params,
            cancelToken: token,
          );
        } else {
          response = await _client!.get(
            getBaseUrl() + url,
            cancelToken: token,
          );
        }
      } else if (method == POST) {
        if ((params != null && params.isNotEmpty) ||
            (queryParams != null && queryParams.isNotEmpty) ||
            formData != null) {
          response = await _client!.post(
            getBaseUrl() + url,
            data: formData == null ? params : formData,
            queryParameters: queryParams,
            options: Options(
                followRedirects: false,
                validateStatus: (status) {
                  return status! < 500;
                }
            ),
            onSendProgress: progressCallBack,
            cancelToken: token,
          );
        } else {
          response = await _client!.post(
            getBaseUrl() + url,
            cancelToken: token,
          );
        }
      } else {
        if (params != null && params.isNotEmpty) {
          response = await _client!.get(
            getBaseUrl() + url,
            queryParameters: params,
            cancelToken: token,
          );
        } else {
          response = await _client!.get(
            getBaseUrl() + url,
            cancelToken: token,
          );
        }
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          callBack(response.data);
          break;
        case 400:
          _handError(errorCallBack, INVALIDREQUEST);
          break;
        case 401:
          SharedPrefs.clearAllData();
          _handError(errorCallBack, UNAUTHORIZEDACCESS);
          break;
        case 403:
          _handError(errorCallBack, FORBIDDENREQUEST);
          break;
        case 404:
          _handError(errorCallBack, PAGENOTFOUND);
          break;
        case 500:
        case 503:
          _handError(errorCallBack, INTERNALSERVER);
          break;
        default:
          _handError(
              errorCallBack, OTHERISSUE + response.statusCode.toString());
          break;
      }
    }
    catch (e) {
      if (e is DioError) {
        DioError error = e;
        switch (error.response!.statusCode) {
          case 400:
            _handError(errorCallBack, INVALIDREQUEST);
            break;
          case 401:
            SharedPrefs.clearAllData();
            _handError(errorCallBack, UNAUTHORIZEDACCESS);
            break;
          case 403:
            _handError(errorCallBack, FORBIDDENREQUEST);
            break;
          case 404:
            _handError(errorCallBack, PAGENOTFOUND);
            break;
          case 500:
          case 503:
            _handError(errorCallBack, INTERNALSERVER);
            break;
          default:
            _handError(
                errorCallBack, OTHERISSUE + error.response!.statusCode.toString());
            break;
        }
      }
    }
  }

  static void _handError(Function? errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
  }
}
