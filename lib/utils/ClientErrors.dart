import 'ResultResponse.dart';

class BadRequest<T> implements ResultResponse<T> {
  final int statusCode = 400;
  String message = "Bad Request";
}

class Unauthorized<T> implements ResultResponse<T> {
  final int statusCode = 401;
  String message = "Unauthorized";
}

class PaymentRequired<T> implements ResultResponse<T> {
  final int statusCode = 402;
  String message = "Payment Required";
}

class Forbidden<T> implements ResultResponse<T> {
  final int statusCode = 403;
  String message = "Forbidden";
}

class NotFound<T> implements ResultResponse<T> {
  final int statusCode = 404;
  String message = "Not Found";
}

class MethodNotAllowed<T> implements ResultResponse<T> {
  final int statusCode = 405;
  String message = "Method Not Allowed";
}

class NotAcceptable<T> implements ResultResponse<T> {
  final int statusCode = 406;
  String message = "Not Acceptable";
}

class ProxyAuthenticationRequired<T> implements ResultResponse<T> {
  final int statusCode = 407;
  String message = "Proxy Authentication Required";
}

class RequestTimeout<T> implements ResultResponse<T> {
  final int statusCode = 408;
  String message = "Proxy Authentication Required";
}

class Conflict<T> implements ResultResponse<T> {
  final int statusCode = 409;
  String message = "Conflict";
}

class Gone<T> implements ResultResponse<T> {
  final int statusCode = 410;
  String message = "Gone";
}

class LengthRequired<T> implements ResultResponse<T> {
  final int statusCode = 411;
  String message = "Length Required";
}

class PreconditionFailed<T> implements ResultResponse<T> {
  final int statusCode = 412;
  String message = "Precondition Failed";
}

class PayloadTooLarge<T> implements ResultResponse<T> {
  final int statusCode = 413;
  String message = "Payload Too Large";
}

class URITooLong<T> implements ResultResponse<T> {
  final int statusCode = 414;
  String message = "URI Too Long";
}

class UnsupportedMediaType<T> implements ResultResponse<T> {
  final int statusCode = 415;
  String message = "Unsupported Media Type";
}

class RequestedRangeNotSatisfiable<T> implements ResultResponse<T> {
  final int statusCode = 416;
  String message = "Requested Range Not Satisfiable";
}

class ExpectationFailed<T> implements ResultResponse<T> {
  final int statusCode = 417;
  String message = "Expectation Failed";
}

class ImATeapot<T> implements ResultResponse<T> {
  final int statusCode = 418;
  String message = "I'm a teapot";
}

class IncorrectPassword<T> implements ResultResponse<T> {
  final int statusCode = 420;
  String message = "Incorrect password";
}

class MisdirectedRequest<T> implements ResultResponse<T> {
  final int statusCode = 421;
  String message = "Misdirected Request";
}

class UnprocessableEntity<T> implements ResultResponse<T> {
  final int statusCode = 422;
  String message = "Unprocessable Entity";
}

class Locked<T> implements ResultResponse<T> {
  final int statusCode = 423;
  String message = "Locked";
}

class FailedDependency<T> implements ResultResponse<T> {
  final int statusCode = 424;
  String message = "Failed Dependency";
}

class UpgradeRequired<T> implements ResultResponse<T> {
  final int statusCode = 426;
  String message = "Upgrade Required";
}

class PreconditionRequired<T> implements ResultResponse<T> {
  final int statusCode = 428;
  String message = "Precondition Required";
}

class TooManyRequests<T> implements ResultResponse<T> {
  final int statusCode = 428;
  String message = "Too Many Requests";
}

class RequestHeaderFieldsTooLarge<T> implements ResultResponse<T> {
  final int statusCode = 431;
  String message = "Request Header Fields Too Large";
}

class UnavailableForLegalReasons<T> implements ResultResponse<T> {
  final int statusCode = 451;
  String message = "Unavailable For Legal Reasons";
}

class InternetNotAvailable<T> implements ResultResponse<T> {
  final int statusCode = 9999;
  String message = "Internet not available";
}
