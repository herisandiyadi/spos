import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class LoadTransactionReport extends StatelessWidget {
  const LoadTransactionReport({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                buildCard(context),
                SizedBox(width: 15.w),
                buildCard(context),
                SizedBox(width: 15.w),
                buildCard(context),
                SizedBox(width: 15.w),
                buildCard(context),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildCardBody(context),
                SizedBox(width: 15.w),
                buildCardBody(context),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(30.r),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 0.0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const SizedBox(
                    height: 14.0,
                    width: 170.0,
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 0.0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const SizedBox(
                    height: 20.0,
                    width: 120.0,
                  ),
                ),
                const SizedBox(height: 15),
                Card(
                  elevation: 0.0,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const SizedBox(
                    height: 25.0,
                    width: 70.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCardBody(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(30.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            _buildHeader(context),
            SizedBox(height: 20.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Card(
                elevation: 0.0,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const SizedBox(
                  height: 14.0,
                  width: 200.0,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            _buildPaymentList(context),
            SizedBox(height: 20.h),
            _buildGrandTotalRow(context),
            SizedBox(height: 20.h),
            _buildGrandTotalRow(context),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(
              height: 22.0,
              width: 120.0,
            ),
          ),
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(
              height: 25.0,
              width: 150.0,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentList(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 250.r,
      child: ListView.builder(
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        elevation: 0.0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const SizedBox(
                          height: 16.0,
                          width: 70.0,
                        ),
                      ),
                      Card(
                        elevation: 0.0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const SizedBox(
                          height: 16.0,
                          width: 100.0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Card(
                    elevation: 0.0,
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SizedBox(
                      height: 14.0,
                      width: size.width,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildGrandTotalRow(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(
              height: 18.0,
              width: 100.0,
            ),
          ),
          Card(
            elevation: 0.0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const SizedBox(
              height: 18.0,
              width: 120.0,
            ),
          ),
        ],
      ),
    );
  }
}