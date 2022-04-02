import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../color.dart';
import '../../inputText/input_text.dart';
import '../ui_helper.dart';
import 'bottom_viewModel.dart';

class BottomSheetView extends StatelessWidget {
  final SheetRequest<dynamic>?
      request; // ReQUEST data type is customer and transaction
  final Function(SheetResponse)? completer;
  const BottomSheetView({
    Key? key,
    this.request,
    this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomSheetViewModel>.reactive(
      builder: (context, model, child) => Container(
        height: screenHeight(context) / 2,
        width: screenWidth(context),
        decoration: BoxDecoration(
          color: kcSecondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.close,
                    color: kcDanger,
                  ),
                )
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FittedBox(
                        child: Text(
                          request!.title!,
                          style: const TextStyle(color: kcWhite, fontSize: 20),
                        ),
                      ),
                      verticalSpaceRegular,
                      formNormalText(
                          controller: model.firstName,
                          hintext: "Full Name",
                          icon: const Icon(Icons.person)),
                      formNormalText(
                          controller: model.firstName,
                          hintext: "Complete Address",
                          icon: const Icon(Icons.person)),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: formNormalText(
                                controller: model.firstName,
                                hintext: "Phone number",
                                icon: const Icon(Icons.person)),
                          ),
                          Expanded(
                            child: formNormalText(
                                controller: model.firstName,
                                hintext: "Age",
                                icon: const Icon(Icons.person)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 50,
                                color: kcWhite,
                                onPressed: () {},
                                child: const Text("Confirm"),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => BottomSheetViewModel(),
    );
  }
}
