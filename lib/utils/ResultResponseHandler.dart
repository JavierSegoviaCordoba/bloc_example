import 'dart:async';
import "dart:convert";
import 'dart:core';
import 'dart:io';

import "package:http/http.dart";

import "ResultResponse.dart";

typedef S _ToDTO<S>(Map<String, dynamic> obj);

Future<ResultResponse<R>> resultResponse<R, S>(Future<Response> futureResponse, _ToDTO<S> toDTO) async {
  try {
    Response response = await futureResponse;
    if (response.statusCode == 200) {
      final jsonDecoded = jsonDecode(response.body);
      if (jsonDecoded is List) {
        final jsonDecoded = jsonDecode(response.body).cast<Map<String, dynamic>>();
        final list = jsonDecoded.map<S>((map) => toDTO(map)).toList();
        return ResultResponse<R>.success(list);
      } else {
        return ResultResponse<S>.success(toDTO(jsonDecoded)) as ResultResponse<R>;
      }
    } else
      return _errors<R>(response);
  } on TimeoutException {
    return ResultResponse<R>.requestTimeout();
  } on SocketException {
    return ResultResponse<R>.internetNotAvailable();
  }
}

ResultResponse<R> _errors<R>(Response response) {
  switch (response.statusCode) {
    //Client errors
    case 400:
      return ResultResponse<R>.badRequest();
    case 401:
      return ResultResponse<R>.unauthorized();
    case 402:
      return ResultResponse<R>.paymentRequired();
    case 403:
      return ResultResponse<R>.forbidden();
    case 404:
      return ResultResponse<R>.notFound();
    case 405:
      return ResultResponse<R>.methodNotAllowed();
    case 406:
      return ResultResponse<R>.notAcceptable();
    case 407:
      return ResultResponse<R>.proxyAuthenticationRequired();
    case 408:
      return ResultResponse<R>.requestTimeout();
    case 409:
      return ResultResponse<R>.conflict();
    case 410:
      return ResultResponse<R>.gone();
    case 411:
      return ResultResponse<R>.lengthRequired();
    case 412:
      return ResultResponse<R>.preconditionFailed();
    case 413:
      return ResultResponse<R>.payloadTooLarge();
    case 414:
      return ResultResponse<R>.uriTooLong();
    case 415:
      return ResultResponse<R>.unsupportedMediaType();
    case 416:
      return ResultResponse<R>.requestedRangeNotSatisfiable();
    case 417:
      return ResultResponse<R>.expectationFailed();
    case 418:
      return ResultResponse<R>.imATeapot();
    case 421:
      return ResultResponse<R>.misdirectedRequest();
    case 422:
      return ResultResponse<R>.unprocessableEntity();
    case 423:
      return ResultResponse<R>.locked();
    case 424:
      return ResultResponse<R>.failedDependency();
    case 426:
      return ResultResponse<R>.upgradeRequired();
    case 428:
      return ResultResponse<R>.preconditionRequired();
    case 429:
      return ResultResponse<R>.tooManyRequests();
    case 431:
      return ResultResponse<R>.requestHeaderFieldsTooLarge();
    case 451:
      return ResultResponse<R>.unavailableForLegalReasons();

    //Server errors
    case 500:
      return ResultResponse<R>.internalServerError();
    case 501:
      return ResultResponse<R>.notImplemented();
    case 502:
      return ResultResponse<R>.badGateway();
    case 503:
      return ResultResponse<R>.serviceUnavailable();
    case 504:
      return ResultResponse<R>.gatewayTimeout();
    case 505:
      return ResultResponse<R>.httpVersionNotSupported();
    case 506:
      return ResultResponse<R>.variantAlsoNegotiates();
    case 507:
      return ResultResponse<R>.insufficientStorage();
    case 508:
      return ResultResponse<R>.loopDetected();
    case 510:
      return ResultResponse<R>.notExtended();
    case 511:
      return ResultResponse<R>.networkAuthenticationRequired();

    default:
      throw Exception();
  }
}
