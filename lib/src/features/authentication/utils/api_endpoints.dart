class ApiEndPoints{
  static const String baseUrl ='https://graduation-project-fdvx.onrender.com/user/';
  static _AuthEndPoints authEndPoints =_AuthEndPoints();
}
//http://192.168.1.19:3000/user/
class _AuthEndPoints {
  final String register='register';
  final String login = 'login';
  final String forget = 'forgot';
  final String verifyCode= 'verify-code';
  final String resetPass='reset-Pass';

}