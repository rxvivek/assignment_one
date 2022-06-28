import 'package:assignment_one/core/error/failures.dart';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case RemoteFailure:
      return "Remote Failure";
    default:
      return 'Unexpected Error';
  }
}