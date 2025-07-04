import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_for_all/widget/costom/costom_review_card.dart';
import 'package:provider/provider.dart';

import '../../../../../../controller/firebase/provider/firebaes_review_provider.dart';
import '../../../../../../controller/firebase/provider/firebase_request_provider.dart';
import '../../../../../../controller/firebase/provider/firebase_user_provider.dart';
import '../../../../../../widget/costom/costom_worker_profile_card.dart';
import 'worker_profile_widgets/about_me_section.dart';
import 'worker_profile_widgets/peice_section.dart';
import 'worker_profile_widgets/photos_and_videos_section.dart';
import 'worker_profile_widgets/work_type_and_location_section.dart';
import 'worker_profile_widgets/worker_profile_floating_bottons.dart';

class WorkerProfileScreen extends StatefulWidget {
  const WorkerProfileScreen({super.key});

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {

  @override
    void initState() {
      super.initState();

      final userProvider =
          Provider.of<FirebaseUserProvider>(context, listen: false);
      

      userProvider.getUsersStreamById(userProvider.workerId);
      
      
    }
  @override
  Widget build(BuildContext context) {
    

    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          WorkerProfileFloatingBottons(screenSize: screenSize),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.only(bottom: screenSize.height * 0.1),
            decoration: BoxDecoration(color: Colors.white),
            child: Consumer2<FirebaseUserProvider,FirebaseRequestProvider>(
              builder: (context, provider,request, _) {
                
                return Column(
                  children: [
                    Container(
                      color: Colors.grey.shade300,
                      child: WorkerProfileCard(
                          name: provider.users[0].username ?? "unknown",
                          numberOfOrders: "10",
                          image: provider.users[0].profilePic ?? "unknown",
                          rank: "5.0",
                          icon: Icons.book_rounded),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: screenSize.width * 0.05,
                          vertical: screenSize.height * 0.02),
                      child: Column(
                        children: [
                          WorkTypeAndLocationSection(
                            screenSize: screenSize,
                            workerType:
                                provider.users[0].serviceName ?? "Unknown",
                          ),
                          PriceSection(screenSize: screenSize),
                          Divider(
                            color: Colors.grey,
                            height: screenSize.height * 0.04,
                            thickness: screenSize.width * 0.0015,
                            indent: screenSize.width * 0.05,
                            endIndent: screenSize.width * 0.05,
                          ),
                          AboutMeSection(screenSize: screenSize),
                          PhotosAndVideosSection(screenSize: screenSize),
                          Divider(
                            color: Colors.grey,
                            height: screenSize.height * 0.04,
                            thickness: screenSize.width * 0.0015,
                            indent: screenSize.width * 0.05,
                            endIndent: screenSize.width * 0.05,
                          ),
                          ReviewCard(
                            
                            screenSize: screenSize,
                           
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
