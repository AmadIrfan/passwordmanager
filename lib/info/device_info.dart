import 'package:flutter/material.dart';
import "package:device_info_plus/device_info_plus.dart";
import 'package:battery_info/battery_info_plugin.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key});

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

DeviceInfoPlugin? deviceInfo = DeviceInfoPlugin();

class _DeviceInfoState extends State<DeviceInfo> {
  Future<AndroidDeviceInfo> data() async {
    AndroidDeviceInfo divAnd = await deviceInfo!.androidInfo;
    return divAnd;
  }

  Future<BatteryInfoPlugin> batInfo() async {
    return await BatteryInfoPlugin();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: data(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  rowCreator('Brand', snapshot.data!.brand),
                  rowCreator('Version', snapshot.data!.version.release),
                  rowCreator('Manufacturer', snapshot.data!.manufacturer),
                  rowCreator("Hardware", snapshot.data!.hardware),
                  rowCreator('Modal', snapshot.data!.model),
                  rowCreator("Version", snapshot.data!.version.incremental),
                  rowCreator("Security",
                      snapshot.data!.version.securityPatch.toString()),
                  rowCreator('Android Version', snapshot.data!.display),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }

  rowCreator(String title, String data) {
    return Card(
      margin: const EdgeInsets.all(1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(title),
            Text(data),
          ],
        ),
      ),
    );
  }
}
