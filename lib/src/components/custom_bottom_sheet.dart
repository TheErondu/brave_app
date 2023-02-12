import 'package:estasi/src/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBotttomSheet extends StatelessWidget {
  const CustomBotttomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
        enableDrag: false,
        onClosing: () {},
        builder: ((context) {
          return SizedBox(
            height: size(context, type: ScreenSize.height) * 0.4,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Make Payments",
                  style: Theme.of(context).textTheme.displayMedium,
                )
              ],
            ),
          );
        }));
  }
}
