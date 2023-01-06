import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final webClientId = dotenv.env['WEB_CLIENT_ID'];
}