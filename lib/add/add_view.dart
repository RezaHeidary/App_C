import 'package:appd/add/add_widget.dart';
import 'package:flutter/widgets.dart';

class AddView extends StatelessWidget {
  const AddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 100,
        ),
        AddWidget.widgetRowForTitle(),
        const SizedBox(
          height: 80,
        ),
        AddWidget.widgetColumnForAddBody(),
      ],
    );
  }
}
