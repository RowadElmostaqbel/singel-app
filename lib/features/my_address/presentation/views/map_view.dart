import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:single_resturant_app/core/utils/app_colors.dart';

import '../widgets/pick_location_btn.dart';

class MapView extends HookWidget {
  const MapView({super.key});

  Future<Position> getMyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GoogleMapController?> googleMapController = useState(null);
    ValueNotifier<LatLng?> myLocation = useState(
      null,
    );
    useEffect(() {
      getMyLocation().then((value) {
        myLocation.value = LatLng(value.latitude, value.longitude);
        googleMapController.value!.animateCamera(
          CameraUpdate.newLatLng(
            myLocation.value!,
          ),
        );
      });

      return null;
    }, []);

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: myLocation.value ??
                  const LatLng(37.7749, -122.4194), // San Francisco coordinates
              zoom: 12,
            ),
            onMapCreated: (controller) =>
                googleMapController.value = controller,
            onCameraMove: (position) => myLocation.value = position.target,
          ),
          if (myLocation.value != null) ...[
            const Icon(
              Icons.push_pin_sharp,
              size: 50,
              color: AppColors.primaryColor,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: PickLocationBtn(
                location: myLocation.value!,
              ),
            )
          ]
        ],
      ),
    );
  }
}
