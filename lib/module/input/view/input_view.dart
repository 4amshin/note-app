import 'package:flutter/material.dart';
import 'package:note_app/core.dart';
import '../controller/input_controller.dart';

class InputView extends StatefulWidget {
  const InputView({Key? key}) : super(key: key);

  Widget build(context, InputController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        child: ListView(
          children: [
            const Text(
              "Write\nYour Note",
              style: TextStyle(
                height: 1,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            HmTextField(
              height: 50,
              label: 'Label',
              controller: controller.labelController,
            ),
            const SizedBox(height: 15),
            HmTextField(
              height: 70,
              label: 'Description',
              controller: controller.descriptionController,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (final color in [nBlue, nOrange, nCyan, nPink, nPink2])
                  GestureDetector(
                    onTap: () => controller.getColor(color),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color,
                      ),
                      child: controller.selectedColor == color
                          ? const Icon(
                              Icons.check,
                              size: 20,
                              color: Colors.white,
                            )
                          : null,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 30.0),
            HmSaveButton(
              onPressed: () => controller.doSaveData(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<InputView> createState() => InputController();
}
