import 'package:foodspark/shared/ui/bottom/bottom_view.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import 'enum/bottom_sheet_num.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();
  final builders = {
    BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
        BottomSheetView(request: sheetRequest, completer: completer)
  };
////////////////
  bottomSheetService.setCustomSheetBuilders(builders);
}
