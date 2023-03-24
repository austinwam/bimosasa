import 'package:bimosasa/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widget/image.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("homepage")), body: const Userlist());
  }
}

class Userlist extends StatelessWidget {
  const Userlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Userprovider>(builder: (context, userdata, _) {
      return Scaffold(
        body: SizedBox(
          height: 98.h,
          width: 99.w,
          child: userdata.isloading == true
              ? const CircularProgressIndicator()
              : ListView.builder(
                  itemCount: userdata.usermodel.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<Userprovider>(context, listen: false)
                            .setuset(userdata.usermodel[index]);
                        context
                            .go("/user/${userdata.usermodel[index].username}");
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Imageplace(
                              height: 25.h,
                              width: 30.w,
                              imageurl: "https://picsum.photos/id/237/200/300"),
                          title: Text(userdata.usermodel[index].username!),
                          trailing: Text(userdata.usermodel[index].phone!),
                        ),
                      ),
                    );
                  },
                ),
        ),
      );
    });
  }
}

class Userdetail extends StatelessWidget {
  const Userdetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Userprovider>(builder: (context, userdata, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("userdata.selectuser?.username"),
        ),
        body: Column(children: [
          // Imageplace(
          //     height: 30.h,
          //     width: 99.h,
          //     imageurl: userdata.selectuser!.userpic!),
          Row(
            children: const [Text("send"), Text("data")],
          ),
          const Text("transaction")
        ]),
      );
    });
  }
}
