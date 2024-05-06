import 'package:bKash_flutter/views/home/home_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: const TextSpan(
                            text: 'Mobile Recharge ',
                            style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                            children: [
                          TextSpan(
                              text: 'Success',
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 18,
                              ))
                        ])),
                    Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/147/147144.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'NNV Coders',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text('***********',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black.withOpacity(0.5)))
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.black.withOpacity(0.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('\$500.00'),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          '\$500.00 + \$00.00',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Balance',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('\$1758.00'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(0.2),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Time',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('01:16pm'),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'TRX ID',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.7)),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: const [
                            Text('9DF587FGD1D'),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.copy, size: 15,)
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(0.1),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Icon(
                  Icons.stars_sharp,
                  color: Colors.pink,
                  size: 40,

                ),
                const Text('You won', style: TextStyle(
                    fontSize: 18
                ),),
                const SizedBox(
                  height: 5,
                ),
                const Text('Reward Point', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('For use point check your reward balance.')
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: TextButton(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: const RoundedRectangleBorder(),
            backgroundColor: Colors.pink,

          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [

                Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
                Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                )
              ],
            ),
          )),
    );
  }
}
