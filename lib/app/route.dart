import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:suyo/models/category_model.dart';
import 'package:suyo/models/user_model.dart';
import 'package:suyo/ui/views/authenticate/sign_in_view.dart';
import 'package:suyo/ui/views/home/home_help_view.dart';
import 'package:suyo/ui/views/home/home_index_view.dart';
import 'package:suyo/ui/views/home/home_stores_view.dart';
import 'package:suyo/ui/views/seller/setup/seller_setup_select_category_view.dart';
import 'package:suyo/ui/views/wrapper.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/wrapper':
        return MaterialPageRoute(builder: (_) => Wrapper());
      case '/login':
        return PageTransition(child: SignInView(), type: PageTransitionType.rightToLeft);
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeIndexView());
      case '/stores':
        final CategoryModel category = settings.arguments;
        return PageTransition(child: HomeStoresView(category: category), type: PageTransitionType.downToUp);

      case '/sellerSetup':
        final UserModel user = settings.arguments;
        return PageTransition(child: SellerSetupSelectCategoryView(user: user,), type: PageTransitionType.fade);
        //return MaterialPageRoute(builder: (_) => SellerSetup(user: user,));

      case '/help':
        return MaterialPageRoute(builder: (_) => HomeHelpView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title:Text('Access Denied')),
        body: Center(
          child: Text('Something went wrong.'),
        )
      );
    });
  }
}