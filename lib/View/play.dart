import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../const/onBordingdata.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: onBoardingList.length,
          itemBuilder: (context, i) => Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text(
                onBoardingList[i].title!,
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 80,
              ),
              Image.asset(onBoardingList[i].image!),
              const SizedBox(
                height: 80,
              ),
              Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(onBoardingList[i].body!))
            ],
          ),
        ),
      ),
    );
  }
}
