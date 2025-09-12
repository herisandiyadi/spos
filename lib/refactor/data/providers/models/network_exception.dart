import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

part 'network_exception.freezed.dart';

@freezed
class NetworkException with _$NetworkException {
  const factory NetworkException.socketException() = _SocketException;
  const factory NetworkException.timeOutException() = _TimeOutException;
  const factory NetworkException.unknownException() = _UnknownException;
  const factory NetworkException.httpException() = _HttpException;
  const factory NetworkException.formatException() = _FormatException;
}

class NetworkExceptionMessages {
  static const String socketName = socketException;
  static const String socketImage = "assets/images/errors/socket-exception.png";
  static const String socketTitle = "Oops, weak signal detected";
  static const String socketMessage = "Please check your mobile signal or WiFi and try again later.";

  static const String timeOutName = timeOutException;
  static const String timeOutImage = "assets/images/errors/connection-time-out.png";
  static const String timeOutTitle = "Looks like it's loading slowly";
  static const String timeOutMessage = "The connection timed out, please try again shortly.";

  static const String unknownName = unknownException;
  static const String unknownImage = "assets/images/errors/unknown-exception.png";
  static const String unknownTitle = "Unknown Error";
  static const String unknownMessage = "Sorry, an unexpected error occurred.";

  static const String httpName = httpException;
  static const String httpImage = "assets/images/errors/http-exception.png";
  static const String httpTitle = "Connection Issue";
  static const String httpMessage = "Unable to connect to the server. Please try again later.";

  static const String formatName = formatException;
  static const String formatImage = "assets/images/errors/format-exception.png";
  static const String formatTitle = "Invalid Data Format";
  static const String formatMessage = "The input data format is incorrect. Please check and try again.";
}

Map<String, dynamic> getContentErrorHTTP(NetworkException exception) {
  return exception.when(
    socketException: () => {
      "error_type": NetworkExceptionMessages.socketName,
      "error_image": NetworkExceptionMessages.socketImage,
      "error_title": NetworkExceptionMessages.socketTitle,
      "error_message": NetworkExceptionMessages.socketMessage,
    },
    timeOutException: () => {
      "error_type": NetworkExceptionMessages.timeOutName,
      "error_image": NetworkExceptionMessages.timeOutImage,
      "error_title": NetworkExceptionMessages.timeOutTitle,
      "error_message": NetworkExceptionMessages.timeOutMessage,
    },
    unknownException: () => {
      "error_type": NetworkExceptionMessages.unknownName,
      "error_image": NetworkExceptionMessages.unknownImage,
      "error_title": NetworkExceptionMessages.unknownTitle,
      "error_message": NetworkExceptionMessages.unknownMessage,
    },
    httpException: () => {
      "error_type": NetworkExceptionMessages.httpName,
      "error_image": NetworkExceptionMessages.httpImage,
      "error_title": NetworkExceptionMessages.httpTitle,
      "error_message": NetworkExceptionMessages.httpMessage,
    },
    formatException: () => {
      "error_type": NetworkExceptionMessages.formatName,
      "error_image": NetworkExceptionMessages.formatImage,
      "error_title": NetworkExceptionMessages.formatTitle,
      "error_message": NetworkExceptionMessages.formatMessage,
    },
  );
}