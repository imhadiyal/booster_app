import 'package:flutter/material.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Page'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.library_add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 319,
                width: 304,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(36),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                'data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Slider(
                thumbColor: const Color.fromRGBO(97, 87, 226, 1),
                activeColor: const Color.fromRGBO(97, 87, 226, 1),
                inactiveColor: const Color.fromRGBO(242, 242, 242, 1),
                min: 0,
                max: 100,
                value: 50,
                onChanged: (val) {},
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '00:22',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(242, 242, 242, 1)),
                  ),
                  Text(
                    '20:22',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(242, 242, 242, 1)),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 74,
                    width: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color.fromRGBO(97, 87, 226, 1),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.pause_sharp),
                    ),
                  ),
                  Container(
                    height: 24,
                    width: 24,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.forward),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
