import 'package:apisql/Screens/corseDetailScreen.dart';
import 'package:apisql/Screens/job_detail_screen.dart';
import 'package:apisql/controller/corsecontroller.dart';
import 'package:apisql/controller/jobscontroller.dart';
import 'package:apisql/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    String corseImageUrl = corsesimagepath;
    final CorseController corseController = Get.put(CorseController());
    final JobsController jobscontroller = Get.put(JobsController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: const ClampingScrollPhysics(),

          child: Container(
            width: width,
            height: height,
            child: Column(
              children: [
                //Cources listview
                SizedBox(
                    height: 150,
                    child: GetBuilder<CorseController>(
                      builder: ((controller) {
                        if (controller.isLoading == true) {
                          print(corseController.CorseList.length.toString());
                          return ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: corseController.CorseList.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Card(
                                  color: Colors.transparent,
                                  elevation: 12,
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(CorseDetailScreen(
                                          course_id: corseController
                                              .CorseList[index].course_id,
                                          image: corseController
                                              .CorseList[index].image,
                                          tital: corseController
                                              .CorseList[index].tital,
                                          description: corseController
                                              .CorseList[index].description));
                                    },
                                    child: Container(
                                      width: 400,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${corsesimagepath}${corseController.CorseList[index].image}"),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Container(
                                        height: 60,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            const SizedBox(
                                              height: 80,
                                            ),
                                            Container(
                                              alignment: Alignment.center,
                                              //color: Colors.black.withAlpha(90),
                                              height: 40,
                                              width: 400,
                                              child: Text(
                                                corseController
                                                    .CorseList[index].tital,
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  backgroundColor:
                                                      Color.fromARGB(
                                                          104, 255, 255, 255),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return const CircularProgressIndicator();
                        }
                      }),
                    )),
                //tital only All Jobs
                Container(
                  padding: const EdgeInsets.only(top: 4, bottom: 4, left: 10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "All Jobs",
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //jobs listview
                GetBuilder<JobsController>(
                  builder: ((controller) {
                    if (jobscontroller.isLoading == true) {
                      return Expanded(
                        child: ListView.builder(
                          primary: false,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: jobscontroller.JobsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 1),
                              child: GestureDetector(
                                onTap: () {
                                  Get.to(() => JobDetailScreen(
                                      id: jobscontroller.JobsList[index].id,
                                      publisher_id: jobscontroller
                                          .JobsList[index].publisher_id,
                                      image:
                                          jobscontroller.JobsList[index].image,
                                      head_line: jobscontroller
                                          .JobsList[index].head_line,
                                      job_type: jobscontroller
                                          .JobsList[index].job_type,
                                      job_location: jobscontroller
                                          .JobsList[index].job_location,
                                      salary_offred: jobscontroller
                                          .JobsList[index].salary_offred,
                                      permanent: jobscontroller
                                          .JobsList[index].permanent,
                                      job_descreption: jobscontroller
                                          .JobsList[index].job_descreption,
                                      contact: jobscontroller
                                          .JobsList[index].contact,
                                      publisher_image: jobscontroller
                                          .JobsList[index].publisher_image,
                                      publisher_name: jobscontroller
                                          .JobsList[index].publisher_name));
                                },
                                child: Card(
                                  elevation: 12,
                                  child: Container(
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    width: 400,
                                    //JobsList
                                    child: Row(
                                      children: [
                                        //Statrting Image
                                        Container(
                                          width: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                //${jobimagepath}${jobscontroller.JobsList[index].image}
                                                image: NetworkImage(
                                                    "${jobimagepath}${jobscontroller.JobsList[index].image}"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            //job headline
                                            Text(
                                              jobscontroller
                                                  .JobsList[index].head_line,
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.school_outlined),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(jobscontroller
                                                    .JobsList[index].job_type),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Icon(
                                                    Icons.location_on_outlined),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(jobscontroller
                                                    .JobsList[index]
                                                    .job_location),
                                              ],
                                            ),

                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.payments_outlined),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Text(jobscontroller
                                                    .JobsList[index]
                                                    .salary_offred),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Chip(
                                                  backgroundColor:
                                                      const Color.fromARGB(
                                                          176, 76, 175, 79),
                                                  label: Text(jobscontroller
                                                      .JobsList[index]
                                                      .permanent),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
