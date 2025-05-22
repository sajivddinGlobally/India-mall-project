import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio createDio() {
  final dio = Dio();
  // dio.interceptors.add(
  //   InterceptorsWrapper(
  //     onRequest: (options, handler) {
  //       options.headers['Bearer Token'] =
  //           'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luZGlhbWFsbC5saXZlIiwiaWF0IjoxNzQ3MTMyNTY3LCJuYmYiOjE3NDcxMzI1NjcsImV4cCI6MTc0NzczNzM2NywiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMjMxIn19fQ.GIWEJM-YDgQvNc_mE2rpqq4pSuK7LFlir76y7XfA-IQ';
  //       return handler.next(options);
  //     },
  //   ),
  // );
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          'Authorization':
              'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2luZGlhbWFsbC5saXZlIiwiaWF0IjoxNzQ3OTExNzcyLCJuYmYiOjE3NDc5MTE3NzIsImV4cCI6MTc0ODUxNjU3MiwiZGF0YSI6eyJ1c2VyIjp7ImlkIjoiMjMxIn19fQ.iU0sLUEuO46nsNlGUhVqsMoiEIff4wjkidYzB7rkOi0',
          'Content-Type': 'application/json',
        });
        handler.next(options);
      },

      onResponse: (response, handler) {
        handler.next(response);
      },
      onError: (error, handler) {
        handler.next(error);
      },
    ),
  );
  return dio;
}
