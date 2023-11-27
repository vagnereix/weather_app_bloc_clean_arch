import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            textAlign: TextAlign.center,
            'Weather App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          Image.asset(
            'assets/9.png',
            scale: 2.5,
          ),
          const CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1,
          ),
        ],
      ),
    );
  }
}
