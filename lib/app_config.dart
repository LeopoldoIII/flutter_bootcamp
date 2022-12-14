import 'screens/screens.dart';

class AppConfig {
  static String initialRoute = 'login';

  static routes() {
    return {
      'login': ((context) => const LoginScreen()),
      'register': ((context) => const RegisterScreen()),
      'home': ((context) => const HomeScreen()),
      'map': ((context) => const MapScreen()),
      'profile': ((context) => const ProfileScreen()),
      'about': ((context) => const AboutScreen()),
    };
  }
}
