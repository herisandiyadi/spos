import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:squadra_pos/refactor/presentation/controllers/home/offline/request/c_create_customer.dart';
import 'package:squadra_pos/refactor/utils/constants.dart';

class PopupCreateCustomer extends StatelessWidget {
  PopupCreateCustomer({super.key, required this.id, required this.label, required this.type});

  final int id;
  final int type;
  final String label;

  final createCustomerController = Get.find<CreateCustomerController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.all(10),
      titlePadding: const EdgeInsets.all(16),
      contentPadding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Obx(() {
            return createCustomerController.isDineIn.value ? Text("Table $label",
              style: TextStyle(
                fontSize: 14.sp, 
                fontFamily: 'UbuntuBold',
              ),
            ) : createCustomerController.isTakeaway.value ? Text("Take Away",
              style: TextStyle(
                fontSize: 14.sp, 
                fontFamily: 'UbuntuBold',
              ),
            ) : createCustomerController.isDelivery.value ?  Text("Delivery",
              style: TextStyle(
                fontSize: 14.sp, 
                fontFamily: 'UbuntuBold',
              ),
            ) : const SizedBox.shrink();
          }),
          InkWell(
            onTap: () =>  Get.back(),
            child: const Icon(Icons.close, size: 25),
          ),
        ],
      ),
      content: SingleChildScrollView(
        child: SizedBox(
          width: 250.w,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildInputRow(createCustomerController),
              SizedBox(height: 25.h),
              _observerToggleButtons(createCustomerController), // ← Tambahkan ini
              SizedBox(height: 25.h),
              _buildGuestPad(createCustomerController),
              Obx(() {
                return !createCustomerController.isDineIn.value ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 25.h),
                    ElevatedButton(
                      onPressed: () {
                        createCustomerController.openBill(
                          tableId: 0,
                          transactionType: createCustomerController.isTakeaway.value ? "Take Away" : "Delivery",
                        );

                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(80, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text('Continue to order',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'UbuntuBold',
                        ),
                      ),
                    ),
                  ],
                ) : const SizedBox.shrink();
              }),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputRow(CreateCustomerController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 8,
          child: _buildTextField(createCustomerController.customerName, hint: 'Customer Name', readOnly: false),
        ),
       
        Obx(() {
          return Visibility(
            visible: createCustomerController.isDineIn.value,
            child: Expanded(
              flex: 4,
              child: Row(
                children: [
                  SizedBox(width: 8.w),
                  Expanded(
                    child: _buildTextField(createCustomerController.guestNumber, hint: 'Guest #', readOnly: true),
                  ),
                ],
              )
            ),
          );
        }),
      ],
    );
  }

  Widget _buildTextField(TextEditingController controller, {required String hint, bool readOnly = false}) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 12.5.sp,
        fontFamily: 'UbuntuBold',
        color: customBodyText,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: customLightGrey,
        contentPadding: EdgeInsets.fromLTRB(7.w, 5.h, 7.w, 5.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: customLightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: customLightGrey,
          ),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 12.sp,
          fontFamily: 'UbuntuBold',
          color: customRegularGrey,
        ),
      ),
    );
  }
  
  Widget _buildGuestPad(CreateCustomerController controller) {
    return Obx(() {
      return AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: -1.0,
                child: child,
              ),
            );
          },
          child: createCustomerController.isDineIn.value ? GridView.builder(
            key: const ValueKey("guestPadVisible"),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 12,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 12.w,
            ),
            itemBuilder: (context, index) {
              if (index == 9) {
                return _iconButton(
                  icon: Icons.backspace_outlined,
                  onTap: controller.deleteGuestNumber,
                );
              } else if (index == 11) {
                return _iconButton(
                  icon: Icons.check,
                  onTap: () => controller.openBill(
                    tableId: id,
                    transactionType: "Dine In",
                  ),
                  color: primaryColor,
                  iconColor: Colors.white,
                );
              } else {
                final number = index == 10 ? '0' : '${index + 1}';
                
                return GestureDetector(
                  onTap: () => controller.addGuestNumber(number),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Text(number,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }
            },
          ) : const SizedBox(key: ValueKey("guestPadHidden")),
        ),
      );
    });
  }

  Widget _iconButton({required IconData icon, required VoidCallback onTap, Color color = Colors.white, Color iconColor = Colors.black}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(color: color),
        ),
        child: Icon(icon, color: iconColor, size: 14.sp),
      ),
    );
  }

  Widget _observerToggleButtons(CreateCustomerController controller) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: type != tad ? ToggleButtons(
          isSelected: [
            createCustomerController.isDineIn.value,
            createCustomerController.isTakeaway.value,
            createCustomerController.isDelivery.value,
          ],
          onPressed: (index) => createCustomerController.selectTransactionType(index, type),
          borderRadius: BorderRadius.circular(50),
          selectedColor: Colors.white,
          fillColor: primaryColor,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Dine In", 
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Take Away", 
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Delivery", 
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
          ],
        ) : ToggleButtons(
          isSelected: [
            createCustomerController.isTakeaway.value,
            createCustomerController.isDelivery.value,
          ],
          onPressed: (index) => createCustomerController.selectTransactionType(index, type),
          borderRadius: BorderRadius.circular(50),
          selectedColor: Colors.white,
          fillColor: primaryColor,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Take Away", 
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Text("Delivery", 
                style: TextStyle(
                  fontSize: 10.sp, 
                  fontFamily: "UbuntuBold",
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
