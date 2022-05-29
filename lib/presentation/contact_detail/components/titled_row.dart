import 'package:flutter/material.dart';

class TitledRow extends StatelessWidget {
  final String title;
  final String value;
  final Function? callBack;

  const TitledRow(
      {Key? key, required this.title, required this.value, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Color(0xff999999),
                ),
          ),
          const SizedBox(height: 10),
          if(callBack == null)
            Text(value,
                maxLines: 2,
                softWrap: true,
                style: Theme.of(context).textTheme.titleMedium),
          if(callBack != null)
            InkWell(
              onTap: () {
                callBack?.call();
              },
              child: Text(value,
                  maxLines: 2,
                  softWrap: true,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ),
          Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
