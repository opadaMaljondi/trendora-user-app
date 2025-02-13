
import 'package:otpless_flutter/otpless_flutter.dart';

abstract class OtpLessService {
  Future<void> callOtpLess({
    required void Function(String? token,String? phoneNumber, String? errorMessage ,String ?contryCode) onReceiveResult,
  });
}

class OtpLessServiceImpl extends OtpLessService {
  static final _otpLessFlutterPlugin = Otpless();
  static const _appId = 'HI49UAFJ7YGJ36V7LXE0';

  @override
  Future<void> callOtpLess({
    required void Function(String? token, String? phoneNumber, String? errorMessage,String? contryCode) onReceiveResult,
  }) async {
    try {


      final arg = {'appId': _appId,};
      await _otpLessFlutterPlugin.openLoginPage(
            (result) {

          _onReceiveResult(result, onReceiveSuccessResult: onReceiveResult);
        },
        arg,
      );


    } catch (e) {
  print(e);
    }
  }

  Future<void> _onReceiveResult(
      result, {
        required void Function(String? token, String? phoneNumber, String? errorMessage,String ?contryCode) onReceiveSuccessResult,
      }) async {
    try {

      if (result['data'] != null) {
        onReceiveSuccessResult(
          result['data']['token'],
          result['data']['identities'][0]['identityValue'],
          null,
          result['data']['network']["ipLocation"]['country']["code"],
        );
      } else {
        onReceiveSuccessResult(null, null, result['errorMessage'],"");
      }

    } catch (e) {
  print(e);
    }
  }
  // Future<void> callOtpLess({
  //   required void Function(String? token, String? errorMessage) onReceiveResult,
  // }) async {
  //   try {
  //     InjectionContainer.getIt<Logger>()
  //         .i("Start `callOtpLess` in |OtpLessService|");
  //
  //     final arg = {'appId': _appId};
  //     await _otpLessFlutterPlugin.openLoginPage((result) {
  //       _onReceiveResult(result, onReceiveSuccessResult: onReceiveResult);
  //     }, arg);
  //
  //     InjectionContainer.getIt<Logger>()
  //         .w("End `callOtpLess` in |OtpLessService|");
  //   } catch (e) {
  //     InjectionContainer.getIt<Logger>().e(
  //       "End `callOtpLess` in |OtpLessService| Error:$e",
  //     );
  //   }
  // }
  //
  // Future<void> _onReceiveResult(
  //   result, {
  //   required void Function(String? token, String? errorMessage)
  //       onReceiveSuccessResult,
  // }) async {
  //   try {
  //     InjectionContainer.getIt<Logger>()
  //         .i("Start `_onReceiveResult` in |OtpLessService|");
  //     if (result['data'] != null) {
  //       onReceiveSuccessResult(result['data']['token'], null);
  //     } else {
  //       onReceiveSuccessResult(null, result['errorMessage']);
  //     }
  //     InjectionContainer.getIt<Logger>().w(
  //       "End `_onReceiveResult` in |OtpLessService| ",
  //     );
  //   } catch (e) {
  //     InjectionContainer.getIt<Logger>().e(
  //       "End `_onReceiveResult` in |OtpLessService| Error:$e",
  //     );
  //   }
  // }
}
