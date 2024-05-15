import 'package:flutter/material.dart';
import 'package:travel_place/animation.dart';
import 'package:travel_place/data.dart';

class DetailScreen extends StatelessWidget {
  final TravelPlace data;
  const DetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.name,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Hero(
                    tag: data.imageUrl,
                    child: CircleAvatar(
                      radius: 150,
                      backgroundImage: AssetImage(data.imageUrl),
                    ),
                  ),
                  Positioned(
                      child: ShowUpAnimation(
                        delay: 300,
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(data.imageUrl),
                      ),
                    ),
                  )),
                  Positioned(
                      right: 0,
                      bottom: 10,
                      child: ShowUpAnimation(
                        delay: 300,
                        child: Container(
                          padding: const EdgeInsets.all(7),
                          height: 80,
                          width: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(data.imageUrl),
                          ),
                        ),
                      )),
                  Positioned(
                      right: 70,
                      bottom: 0,
                      child: ShowUpAnimation(
                        delay:300,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(data.imageUrl),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              data.name,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.grey),
            ),
            Text(
              data.place,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Grab your gear, lace up your boots,and set out on a journey to conquer the heights and discover wonders of the world's",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
