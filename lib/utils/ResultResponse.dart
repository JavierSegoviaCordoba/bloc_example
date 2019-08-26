import 'package:bloc_example/utils/ClientErrors.dart';
import 'package:bloc_example/utils/ServerErrors.dart';

abstract class ResultResponse<T> {
  factory ResultResponse.success(T value) = Success<T>;

  factory ResultResponse.error(int statusCode, String message) = Error<T>;


  //Client errors
  factory ResultResponse.badRequest() = BadRequest<T>;

  factory ResultResponse.unauthorized() = Unauthorized<T>;

  factory ResultResponse.paymentRequired() = PaymentRequired<T>;

  factory ResultResponse.forbidden() = Forbidden<T>;

  factory ResultResponse.notFound() = NotFound<T>;

  factory ResultResponse.methodNotAllowed() = MethodNotAllowed<T>;

  factory ResultResponse.notAcceptable() = NotAcceptable<T>;

  factory ResultResponse.proxyAuthenticationRequired() = ProxyAuthenticationRequired<T>;

  factory ResultResponse.requestTimeout() = RequestTimeout<T>;

  factory ResultResponse.conflict() = Conflict<T>;

  factory ResultResponse.gone() = Gone<T>;

  factory ResultResponse.lengthRequired() = LengthRequired<T>;

  factory ResultResponse.preconditionFailed() = PreconditionFailed<T>;

  factory ResultResponse.payloadTooLarge() = PayloadTooLarge<T>;

  factory ResultResponse.uriTooLong() = URITooLong<T>;

  factory ResultResponse.unsupportedMediaType() = UnsupportedMediaType<T>;

  factory ResultResponse.requestedRangeNotSatisfiable() = RequestedRangeNotSatisfiable<T>;

  factory ResultResponse.expectationFailed() = ExpectationFailed<T>;

  factory ResultResponse.imATeapot() = ImATeapot<T>;

  factory ResultResponse.incorrectPassword() = IncorrectPassword<T>;

  factory ResultResponse.misdirectedRequest() = MisdirectedRequest<T>;

  factory ResultResponse.unprocessableEntity() = UnprocessableEntity<T>;

  factory ResultResponse.locked() = Locked<T>;

  factory ResultResponse.failedDependency() = FailedDependency<T>;

  factory ResultResponse.upgradeRequired() = UpgradeRequired<T>;

  factory ResultResponse.preconditionRequired() = PreconditionRequired<T>;

  factory ResultResponse.tooManyRequests() = TooManyRequests<T>;

  factory ResultResponse.requestHeaderFieldsTooLarge() = RequestHeaderFieldsTooLarge<T>;

  factory ResultResponse.unavailableForLegalReasons() = UnavailableForLegalReasons<T>;

  //Server errors
  factory ResultResponse.internalServerError() = InternalServerError<T>;

  factory ResultResponse.notImplemented() = NotImplemented<T>;

  factory ResultResponse.badGateway() = BadGateway<T>;

  factory ResultResponse.serviceUnavailable() = ServiceUnavailable<T>;

  factory ResultResponse.gatewayTimeout() = GatewayTimeout<T>;

  factory ResultResponse.httpVersionNotSupported() = HTTPVersionNotSupported<T>;

  factory ResultResponse.variantAlsoNegotiates() = VariantAlsoNegotiates<T>;

  factory ResultResponse.insufficientStorage() = InsufficientStorage<T>;

  factory ResultResponse.loopDetected() = LoopDetected<T>;

  factory ResultResponse.notExtended() = NotExtended<T>;

  factory ResultResponse.networkAuthenticationRequired() = NetworkAuthenticationRequired<T>;

  factory ResultResponse.internetNotAvailable() = InternetNotAvailable<T>;
}

class Success<T> implements ResultResponse<T> {
  final T value;

  const Success(this.value);
}

class Error<T> implements ResultResponse<T> {
  final int statusCode;
  final String message;

  const Error(this.statusCode, this.message);
}