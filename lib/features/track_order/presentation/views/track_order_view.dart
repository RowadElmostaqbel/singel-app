import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:single_resturant_app/core/utils/extensions.dart';
import 'package:single_resturant_app/core/widgets/custom_app_bar.dart';
import 'package:single_resturant_app/features/track_order/presentation/widgets/order_progress_bottom_sheet.dart';

import '../widgets/driver_details_bottom_sheet.dart';

class TrackOrderView extends StatelessWidget {
  const TrackOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Stack(
          children: [
            SizedBox(
              width: context.width,
              height: context.height * .55,
              child: const GoogleMap(
                padding: EdgeInsets.only(bottom: 50),
                myLocationButtonEnabled: false,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    0,
                    0,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: const CustomAppBar(
                  title: 'Order #1234',
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: DriverDetailsBottomSheet(),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: OrderProgressBottomSheet(),
            ),
          ],
        ),
      ),
    );
  }
}
