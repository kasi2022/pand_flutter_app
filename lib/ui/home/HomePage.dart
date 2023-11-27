import 'package:flutter/material.dart';
import 'package:minicustomerapp/const/app_colors.dart';
import 'package:minicustomerapp/ui/signup/singup_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController bannerPageController;

  @override
  void initState() {
    // TODO: implement initState
    bannerPageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(


        drawer: customDrawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            customAppBar(),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 190,
                  child: PageView.builder(
                    controller: bannerPageController,
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return customHomeBanner();
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: SmoothPageIndicator(
                    controller: bannerPageController,
                    count: 3,
                    axisDirection: Axis.horizontal,
                    effect: const SlideEffect(
                        spacing: 8.0,
                        radius: 4.0,
                        dotWidth: 5.0,
                        dotHeight: 5.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.5,
                        dotColor: Colors.white,
                        activeDotColor: Colors.white),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return customCardView();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Loan Details",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(fontSize: 18),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return customCardView();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Explore Our Plans",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontSize: 18),
                            )),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Show All",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 14,
                                    color: AppColors.primary,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 180,
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return planCardView();
                        },
                        scrollDirection: Axis.horizontal),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/gpayicon.png",
                              height: 40, width: 40),
                          Text(
                            "Play with Gpay",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(color: Colors.white),
                          )
                        ]),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColors.primary),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget customDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            color: AppColors.primary,
            child: Padding(
              padding: const EdgeInsets.only(top: 17, bottom: 17),
              child: Column(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                      width: 100,
                      height: 100,
                      'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300',
                      errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      width: 100,
                      height: 100,
                      "assets/images/placeholder.png",
                      fit: BoxFit.cover,
                    );
                  }),
                ),
                Text(
                  "Suriya",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white),
                ),
                Text(
                  "suirya@gmail.com",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.white),
                )
              ]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          drawerItem("Home", "assets/icons/homeicon.png"),
          drawerItem("Profile", "assets/icons/homeicon.png"),
          drawerItem("About us", "assets/icons/homeicon.png"),
          drawerItem("Logout", "assets/icons/homeicon.png")
        ],
      ),
    );
  }

  Widget drawerItem(String title, String icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Container(
          color: AppColors.cardBackground,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 20,
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontWeight: FontWeight.normal),
              ),
              const Spacer(),
              Image.asset(
                "assets/icons/nexticon.png",
                width: 15,
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customAppBar() {
    return Material(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            border: Border.all(color: Colors.grey, width: 0)),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    size: 27,
                    Icons.menu_open_outlined,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  "Mini Customer App",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 37,
                    height: 37,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignupPage();
                          },
                        ));
                      },
                      child: Image.network("https://placebear.com/g/200/200",
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          "assets/images/placeholder.png",
                          fit: BoxFit.cover,
                        );
                      }),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget planCardView() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 11),
          child: Row(children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Image.network(
                        "https://placebear.com/g/200/200",
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.asset(
                              width: 70,
                              height: 70,
                              "assets/images/placeholder.png",
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Text(
                    "15 months chit",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "30 Members, 30 Installment",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget customHomeBanner() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/banner.jpg",
            width: double.infinity,
            fit: BoxFit.cover,
          )),
    );
  }

  Widget customCardView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: SizedBox(
                width: 70,
                height: 70,
                child: Image.network(
                  "https://placebear.com/g/200/200",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      width: 70,
                      height: 70,
                      "assets/images/placeholder.png",
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CID 2334",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "RS: 200000",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "Form 25/12/2022 To 26/12/2023",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 12, color: AppColors.textButtonColor),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
