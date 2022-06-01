import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir/page/all_product_page.dart';
import 'package:flutter_tugas_akhir/page/edit_profil_page.dart';
import 'package:flutter_tugas_akhir/page/edit_store_page.dart';
import 'package:flutter_tugas_akhir/page/home/cart_page.dart';
import 'package:flutter_tugas_akhir/page/home/main_page.dart';
import 'package:flutter_tugas_akhir/page/registration_store_page.dart';
import 'package:flutter_tugas_akhir/page/sign_in_page.dart';
import 'package:flutter_tugas_akhir/page/sign_up_page.dart';
import 'package:flutter_tugas_akhir/page/splash_page.dart';
import 'package:flutter_tugas_akhir/page/store_information_page.dart';
import 'package:flutter_tugas_akhir/page/store_page.dart';
import 'package:flutter_tugas_akhir/page/wishlist_page.dart';
import 'package:flutter_tugas_akhir/provider/auth_provider.dart';
import 'package:flutter_tugas_akhir/provider/category_provider.dart';
import 'package:flutter_tugas_akhir/provider/district_provider.dart';
import 'package:flutter_tugas_akhir/provider/page_provider.dart';
import 'package:flutter_tugas_akhir/provider/product_provider.dart';
import 'package:flutter_tugas_akhir/provider/toko_provider.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TokoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DistrictProvider(),
        )
      ],
      child: GetMaterialApp(
        home: const SplashPage(),
        debugShowCheckedModeBanner: false,
        getPages: [
          GetPage(name: '/', page: () => const SplashPage()),
          GetPage(name: '/sign-in', page: () => const SignInPage()),
          GetPage(name: '/sign-up', page: () => const SignUpPage()),
          GetPage(name: '/main-page', page: () => const MainPage()),
          GetPage(name: '/edit-profile', page: () => const EditProfilPage()),
          GetPage(
              name: '/registration-store',
              page: () => const RegistrationStorePage()),
          GetPage(name: '/store-page', page: () => const StorePage()),
          GetPage(name: '/edit-store', page: () => const EditStorePage()),
          GetPage(
              name: '/information-store',
              page: () => const StoreInformationPage()),
          GetPage(name: '/wishlist-page', page: () => const WishlistPage()),
          GetPage(name: '/cart-page', page: () => const CartPage()),
          // '/sign-in': (context) => const SignInPage(),
          // '/sign-up': (context) => const SignUpPage(),
          // '/main-page': (context) => const MainPage(),
          // '/edit-profile': (context) => const EditProfilPage(),
          // '/registration-store': (context) => const RegistrationStorePage(),
          // '/store-page': (context) => const StorePage(),
          // '/edit-store': (context) => const EditStorePage(),
          // '/information-store': (context) => const StoreInformationPage(),
          // '/my-product': (context) => const MyProductPage(),
          // '/wishlist-page': (context) => const WishlistPage(),
          // '/cart-page': (context) => const CartPage(),
          // '/all-product': (context) => const AllProductPage(),
          // '/detail-store-page': (context) => const DetailStorePage(),
        ],
      ),
    );
  }
}
