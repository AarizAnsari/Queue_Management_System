import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:queue_management/Screens/shopping_screen.dart';
import 'package:queue_management/services/shopping_list.dart';

class ScanProduct extends StatefulWidget {
  const ScanProduct({Key? key}) : super(key: key);

  @override
  State<ScanProduct> createState() => _ScanProductState();
}

class _ScanProductState extends State<ScanProduct> {
  MobileScannerController cameraController = MobileScannerController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Scan Product"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              SizedBox(height: 20,),
              SizedBox(
                height: 200,width: 200,
                  child: MobileScanner(
                    allowDuplicates: false,
                      controller: cameraController,
                      onDetect: (barcode, args) async{
                        final String code = barcode.rawValue.toString();
                        await addCode(code);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Shopping()));
                      }
                  ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.torchState,
                      builder: (context, state, child) {
                        switch (state as TorchState) {
                          case TorchState.off:
                            return const Icon(Icons.flash_off, color: Colors.grey);
                          case TorchState.on:
                            return const Icon(Icons.flash_on, color: Colors.yellow);
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.toggleTorch(),
                  ),
                  IconButton(
                    color: Colors.grey,
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.cameraFacingState,
                      builder: (context, state, child) {
                        switch (state as CameraFacing) {
                          case CameraFacing.front:
                            return const Icon(Icons.flip_camera_ios);
                          case CameraFacing.back:
                            return const Icon(Icons.flip_camera_ios);
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.switchCamera(),
                  )
                ],
              ),
              Container(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/Qmanager_logo_white.png"),
                ),
              )
            ],
          )
        ),
      ),
    );
  }
  addCode(String code){
    if(code.length == 13){
      shoppingList.add(code);
    }
  }
}
