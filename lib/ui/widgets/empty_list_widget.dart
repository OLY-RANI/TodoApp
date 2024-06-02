import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lotties/empty_list.json',
            width: 200, height: 200, fit: BoxFit.scaleDown),
        const SizedBox(height: 8,),
        const Text('Empty List!',style: TextStyle(
          fontSize: 14,
          color: Colors.grey
        ),)
      ],
    );
  }
}
