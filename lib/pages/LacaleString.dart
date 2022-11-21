import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'choose': 'Choose',
          'language': 'your language',
          'title': 'Select your Krishi Language',
          'hello': 'Hello!',
          'changelang': 'Change Language'
        },
        'hi_IN': {
          'choose': 'चुनें',
          'language': 'आपकी भाषा',
          'title': 'अपनी कृषि भाषा चुनें',
          'hello': 'नमस्ते!',
          'changelang': 'भाषा बदलो'
        },
        'kn_IN': {
          'choose': 'ಆಯ್ಕೆ ಮಾಡಿ',
          'language': 'ನಿನ್ನ ಭಾಷೆ',
          'title': 'ನಿಮ್ಮ ಕೃಷಿ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ',
          'hello': 'ನಮಸ್ಕಾರ!',
          'changelang': 'ಭಾಷೆ ಬದಲಿಸಿ'
        }
      };
}
