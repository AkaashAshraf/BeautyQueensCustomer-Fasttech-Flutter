import 'package:get/state_manager.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

class HelperController extends GetxController {
  openLocation({
    required dynamic latitude,
    required dynamic longitude,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
      coords: Coords(latitude, longitude),
      title: "",
      description: "",
    );
  }

  openUrl({required String url}) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
