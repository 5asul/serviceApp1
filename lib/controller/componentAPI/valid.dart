import 'package:project_for_all/features/screens/auth_screens/constent/message.dart';

validInput(String val, int min, int max) {
  if (val.isEmpty) {
    return "${MessageAuth.messageInputEmpty}";
  } else if (val.length > max) {
    return "${MessageAuth.messageInputMax}  $max";
  } else if (val.length < min) {
    return "${MessageAuth.messageInputMin}  $min";
  }
}
