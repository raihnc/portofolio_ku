part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const PROJECT_DETAIL = _Paths.PROJECT_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const PROJECT_DETAIL = '/project-detail';
}
