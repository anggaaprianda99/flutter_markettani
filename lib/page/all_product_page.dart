import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tugas_akhir/models/product_model.dart';
import 'package:flutter_tugas_akhir/provider/product_provider.dart';
import 'package:flutter_tugas_akhir/theme.dart';
import 'package:flutter_tugas_akhir/widget/card_product_store.dart';
import 'package:provider/provider.dart';

class AllProductPage extends StatefulWidget {
  const AllProductPage({Key? key}) : super(key: key);

  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      getAllProduct();
    });
  }

  getAllProduct() async {
    ProductProvider productProvider = Provider.of(context, listen: false);
    await productProvider.getProducts();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);

    Widget header() {
      return Container(
        height: 70,
        color: whiteColor,
        padding:
            EdgeInsets.only(top: 8, bottom: 8, right: defaultMargin, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.chevron_left,
                size: 35,
                color: greyColor,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                decoration: BoxDecoration(
                    color: whiteColor,
                    border: Border.all(color: greyColor, width: 2),
                    borderRadius: BorderRadius.circular(defaultRadius)),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: greyColor,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 11),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Cari produk.....",
                            hintStyle: greyTextStyle.copyWith(
                                fontWeight: semiBold, fontSize: 14)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cart-page');
                },
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  size: 25,
                  color: Colors.grey,
                ))
          ],
        ),
      );
    }

    Widget getGridViewProduct() {
      if (productProvider.product.isEmpty) {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/no_box.svg',
                width:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Tidak ada produk',
                style:
                    greyTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              )
            ],
          ),
        );
      } else {
        return SizedBox(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:
                  MediaQuery.of(context).orientation == Orientation.landscape
                      ? 3
                      : 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 16,
              mainAxisExtent: 260, // here set custom Height You Want
            ),
            itemCount: productProvider.product.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return CardProductStore(
                  product: productProvider.product[index] as ProductModel);
            },
          ),
        );
      }
    }

    Widget content() {
      return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 30),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getGridViewProduct(),
            ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                strokeWidth: 10.0,
                color: Colors.green,
              ),
            )
          : ListView(
              children: [header(), content()],
            ),
    );
  }
}
