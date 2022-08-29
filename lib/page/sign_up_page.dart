import 'package:flutter/material.dart';
import 'package:flutter_tugas_akhir/page/home/main_page.dart';
import 'package:flutter_tugas_akhir/provider/auth_provider.dart';
import 'package:flutter_tugas_akhir/provider/page_provider.dart';
import 'package:flutter_tugas_akhir/theme.dart';
import 'package:flutter_tugas_akhir/widget/button_loading.dart';
import 'package:flutter_tugas_akhir/widget/custom_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController nameCont = TextEditingController(text: '');
  TextEditingController usernameCont = TextEditingController(text: '');
  TextEditingController emailCont = TextEditingController(text: '');
  TextEditingController passwordCont = TextEditingController(text: '');

  @override
  void dispose() {
    nameCont.clear();
    usernameCont.clear();
    emailCont.clear();
    passwordCont.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    PageProvider pageProvider = Provider.of<PageProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });
      if (_formKey.currentState!.validate()) {
        if (await authProvider.register(
            name: nameCont.text,
            username: usernameCont.text,
            email: emailCont.text,
            password: passwordCont.text)) {
          Navigator.push(
              context,
              PageTransition(
                  child: const MainPage(),
                  type: PageTransitionType.rightToLeft,
                  curve: Curves.easeIn,
                  settings:
                      RouteSettings(arguments: pageProvider.currentIndex = 0)));
          // Get.offAllNamed('/main-page',
          //     arguments: pageProvider.currentIndex = 0);
        } else {
          Get.snackbar('Gagal Register', "Silahkan isi kembali",
              colorText: Colors.white,
              backgroundColor: Colors.red[900]!.withOpacity(0.8),
              icon: const Icon(
                Icons.error,
                size: 25,
                color: Colors.white,
              ));
        }
      }
      setState(() {
        isLoading = false;
      });
    }

    Widget header() {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Text(
          'MARKETTANI',
          style: whiteTextStyle.copyWith(
              fontSize: 36, letterSpacing: 7.2, fontWeight: bold),
        ),
      );
    }

    Widget inputName() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 10),
        child: TextFormField(
          controller: nameCont,
          style: whiteTextStyle.copyWith(fontSize: 14),
          showCursor: true,
          validator: (value) => value!.isEmpty ? 'Isikan Nama' : null,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 4),
                borderRadius: BorderRadius.circular(14)),
            errorStyle: whiteTextStyle.copyWith(
                fontWeight: bold, fontSize: 14, color: Colors.red),
            labelText: 'Nama',
            hintText: "Masukan Nama",
            prefixIcon: const Icon(
              Icons.account_box_outlined,
              color: Colors.white,
            ),
            hintStyle: whiteTextStyle,
            labelStyle:
                whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(14)),
            floatingLabelStyle:
                whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    }

    Widget inputUsername() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 10),
        child: TextFormField(
          controller: usernameCont,
          style: whiteTextStyle.copyWith(fontSize: 14),
          showCursor: true,
          validator: (value) => value!.isEmpty ? 'Isikan Username' : null,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 4),
                borderRadius: BorderRadius.circular(14)),
            errorStyle: whiteTextStyle.copyWith(
                fontWeight: bold, fontSize: 14, color: Colors.red),
            labelText: 'Username',
            hintText: "Masukan Username",
            hintStyle: whiteTextStyle,
            prefixIcon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            labelStyle:
                whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(14)),
            floatingLabelStyle:
                whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    }

    Widget inputEmail() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 10),
        child: TextFormField(
          controller: emailCont,
          style: whiteTextStyle.copyWith(fontSize: 14),
          showCursor: true,
          validator: (value) => value!.isEmpty ? 'Isikan Email' : null,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 4),
                borderRadius: BorderRadius.circular(14)),
            errorStyle: whiteTextStyle.copyWith(
                fontWeight: bold, fontSize: 14, color: Colors.red),
            labelText: 'Email',
            hintText: "Masukan Email",
            hintStyle: whiteTextStyle,
            prefixIcon: const Icon(
              Icons.email,
              color: Colors.white,
            ),
            labelStyle:
                whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(14)),
            floatingLabelStyle:
                whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    }

    Widget inputPassword() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 20),
        child: TextFormField(
          controller: passwordCont,
          style: whiteTextStyle.copyWith(fontSize: 14),
          showCursor: true,
          obscureText: true,
          validator: (value) => value!.isEmpty ? 'Isikan Password' : null,
          keyboardType: TextInputType.emailAddress,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.red, width: 4),
              borderRadius: BorderRadius.circular(15),
            ),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 4),
                borderRadius: BorderRadius.circular(14)),
            errorStyle: whiteTextStyle.copyWith(
                fontWeight: bold, fontSize: 14, color: Colors.red),
            labelText: 'Password',
            hintText: "Masukan Password",
            hintStyle: whiteTextStyle,
            prefixIcon: const Icon(
              Icons.key,
              color: Colors.white,
            ),
            labelStyle:
                whiteTextStyle.copyWith(fontSize: 16, fontWeight: medium),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(14)),
            floatingLabelStyle:
                whiteTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: whiteColor, width: 2),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      );
    }

    Widget submitButton() {
      return CustomButton(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        title: 'Buat Akun',
        onPressed: handleSignUp,
      );
    }

    Widget footer() {
      return Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun?',
              style: whiteTextStyle,
            ),
            GestureDetector(
              onTap: () {
                Get.toNamed('/sign-in');
              },
              child: Text(
                ' Masuk',
                style: whiteTextStyle.copyWith(
                    color: lightColor, fontWeight: bold),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            header(),
            inputName(),
            inputUsername(),
            inputEmail(),
            inputPassword(),
            isLoading == true ? const ButtonLoading() : submitButton(),
            const Spacer(),
            footer(),
            const SizedBox(
              height: 13,
            ),
          ],
        ),
      ),
    );
  }
}
