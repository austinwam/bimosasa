// import 'dart:async';
// import 'dart:io';
// import 'package:aws3_bucket/aws3_bucket.dart';
// import 'package:aws3_bucket/aws_region.dart';
// import 'package:aws3_bucket/iam_crediental.dart';
// import 'package:aws3_bucket/image_data.dart';

// class Upload {
//   Future<String?> upload(File? selectedFile) async {
//     String? result;
//     IAMCrediental iamCrediental = IAMCrediental();
//     iamCrediental.secretKey = Constant.awsSecertKey;
//     iamCrediental.secretId = Constant.awsSecretId;
//     ImageData imageData = ImageData(
//         DateTime.now().millisecondsSinceEpoch.toString(), selectedFile!.path,
//         imageUploadFolder: "testing");
//     result = await Aws3Bucket.upload(Constant.bucket, AwsRegion.AP_NORTHEAST_1,
//         AwsRegion.AP_NORTHEAST_1, imageData, iamCrediental);

//     return result;
//   }

   
// }
