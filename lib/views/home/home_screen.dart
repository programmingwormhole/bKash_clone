import 'package:bKash_flutter/controllers/home_controller.dart';
import 'package:bKash_flutter/views/sendMoney/SendMoneyScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../global_widgets/carousel_slider_items.dart';
import '../../global_widgets/custom_bottom_bar.dart';
import '../../global_widgets/custom_home_app_bar.dart';
import '../../global_widgets/custom_menu_item.dart';
import '../../global_widgets/custom_my_bkash_item.dart';
import '../../global_widgets/custom_offer_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: CustomAppBar(),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // HomePage Button Section
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuItem(
                    'assets/images/icons/sendMoney.png',
                    'Send Money',
                    () {
                      Get.to(
                        () => SendMoneyScreen(),
                      );
                    },
                  ),
                  menuItem('assets/images/icons/mobileRecharge.png', 'Recharge',
                      () {}),
                  menuItem(
                      'assets/images/icons/cashOut.png', 'Cash Out', () {}),
                  menuItem('assets/images/icons/payment.png', 'Payments', () {})
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuItem(
                      'assets/images/icons/addMoney.png', 'Add Money', () {}),
                  menuItem(
                      'assets/images/icons/payBill.png', 'Pay Bill', () {}),
                  menuItem('assets/images/icons/remittance.png', 'Remittance',
                      () {}),
                  menuItem('assets/images/icons/education.png', 'Edu.', () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Recent Activity Section
            Container(
              height: 10,
              width: mediaSize.width,
              color: Colors.grey.withOpacity(0.1),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: mediaSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('My bKash'),
                          Text(
                            'See All',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            mybKashItem('assets/HomePage/make_payment.jpg',
                                'NNV Coders'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem('assets/HomePage/mobile_recharge.jpg',
                                'Shirin Yasmin'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/pay_bill.jpg', 'Saved Bills'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem('assets/HomePage/tickets.jpg',
                                'TikaToly Cinema'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem('assets/HomePage/mobile_recharge.jpg',
                                'Shirin Yasmin'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/pay_bill.jpg', 'Saved Bills'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // HomePage Slider Section
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: CarouselSlider(
                  items: carouselItems,
                  options: CarouselOptions(
                    height: 100,
                    autoPlay: true,
                    viewportFraction: 1,
                  )),
            ),
            // Sponsor Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: mediaSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Sponsored Company'),
                          Text(
                            'See All',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            mybKashItem('assets/HomePage/daraz.jpg', 'Daraz'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem('assets/HomePage/shadhin_music.jpg',
                                'Shadhin Music'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/bdnews24.jpg', 'BD News 24'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/akash.jpg', 'Akash DTH'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/stiline.jpg', 'Stiline'),
                            const SizedBox(
                              width: 20,
                            ),
                            mybKashItem(
                                'assets/HomePage/coronabd.jpg', 'Corona BD'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Offer Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: mediaSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Offers'),
                          Text(
                            'See All',
                            style: TextStyle(color: Colors.pink),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            offerItems(mediaSize),
                            const SizedBox(
                              width: 20,
                            ),
                            offerItems(mediaSize),
                            const SizedBox(
                              width: 20,
                            ),
                            offerItems(mediaSize),
                            const SizedBox(
                              width: 20,
                            ),
                            offerItems(mediaSize),
                            const SizedBox(
                              width: 20,
                            ),
                            offerItems(mediaSize),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Others Service
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: mediaSize.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Others Services'),
                      Divider(
                        thickness: 0.5,
                        color: Colors.black.withOpacity(0.2),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mybKashItem('assets/HomePage/flyover_toll.jpg',
                              'Flyover Toll'),
                          mybKashItem('assets/HomePage/btcl.jpg', 'BTCL'),
                          mybKashItem('assets/HomePage/metlife.jpg', 'Metlife'),
                          mybKashItem(
                              'assets/HomePage/donation.jpg', 'Donation'),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          mybKashItem(
                              'assets/HomePage/pay_bill.jpg', 'Pay Bill'),
                          mybKashItem(
                              'assets/HomePage/add_money.jpg', 'Add Money'),
                          mybKashItem(
                              'assets/HomePage/make_payment.jpg', 'Payment'),
                          mybKashItem(
                              'assets/HomePage/card_bill.jpg', 'Card Bill'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Single Image Section
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: 85,
                width: mediaSize.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/sliderImage1.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // Single Offer Section
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 300,
                width: mediaSize.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/offer.gif',
                        height: 100,
                        width: 100,
                      ),
                      const Text(
                        'Recharge ৳100 Get 180 Minutes',
                        style: TextStyle(fontSize: 18),
                      ),
                      const Text('With ৳5 Cashback, Validity 7 days'),
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              side: const BorderSide(
                                color: Colors.pink,
                              )),
                          child: const Text(
                            'Recharge Now',
                            style: TextStyle(color: Colors.pink),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.qr_code_scanner_outlined,
          color: Colors.pink,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
