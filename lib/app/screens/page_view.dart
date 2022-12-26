import 'package:flutter/material.dart';

class PageViewData {
  String backgroundImage;
  Icon icon;
  String title;
  String description;
  PageViewData(
      {required this.backgroundImage,
      required this.icon,
      required this.title,
      required this.description});
}

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    List<PageViewData> data = [
      PageViewData(
          backgroundImage: "assets/images/q1.jpg",
          icon: const Icon(Icons.access_alarm),
          title: "Labore aut",
          description:
              "Labore aut voluptatem enim id quia. Cumque ad architecto pariatur magni. Consequatur ea doloribus."),
      PageViewData(
          backgroundImage: "assets/images/q2.jpg",
          icon: const Icon(Icons.tour_outlined),
          title: "Exercitationem tenetur",
          description:
              "Exercitationem tenetur dolor et eius natus. Nisi perspiciatis totam sit sit repudiandae ut consequatur. Ut ut tempore velit aspernatur consequuntur vero ut qui praesentium. Minima cupiditate voluptatem iure neque."),
      PageViewData(
          backgroundImage: "assets/images/q3.jpg",
          icon: const Icon(Icons.touch_app_sharp),
          title: "Et optio",
          description:
              "Et optio eum ut nam dolor quidem. Temporibus mollitia ab illum et quis blanditiis animi. Perferendis eum commodi consectetur nihil et eius nam. Velit iusto aut incidunt veniam. Praesentium laudantium veniam. Voluptatem qui ex inventore ut sit natus temporibus architecto non."),
      PageViewData(
          backgroundImage: "assets/images/q4.jpg",
          icon: const Icon(Icons.tornado_rounded),
          title: "Repellat cum",
          description:
              "Repellat cum dolorem dolor molestias. Praesentium reprehenderit aut sed odio quo voluptate et. Aspernatur laborum minus molestias dolorem velit animi odit. Recusandae vitae eos vel molestiae. Optio non ipsa cum. Sint voluptatum esse."),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: const IconThemeData(size: 100),
        textTheme: const TextTheme(
          headline3: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          headline6: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),
        ),
      ),
      home: Scaffold(
        //! the PageView Widget needs all the dimensions of the screen so it Scaffolded within MaterialApp Directly
        //! we want to add button but above all the PageView children at a time so we will use stack
        //* since the stack children share all the dimensions from the parent Widget
        //* since the Stack children list represent each child as  a layer from first to last equal to from bottom to top
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          PageView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: ExactAssetImage(data[index].backgroundImage),
                        fit: BoxFit.cover),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        data[index].icon,
                        const SizedBox(
                          height: 40,
                        ),
                        Text(data[index].title,
                            style: Theme.of(context).textTheme.headline3),
                        const SizedBox(
                          height: 80,
                        ),
                        Text(data[index].description,
                            style: Theme.of(context).textTheme.headline6),
                      ],
                    ),
                  ),
                );
              }),
          //! we used align here to align the child (elevated button to nearly to the bottom (1.0) relatively)
          //* we used the container to make margin and it's good practice for specific type of screens like edged and notched screens
          Align(
            alignment: const Alignment(0.9, 0.9),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 1.5),
                width: double.infinity,
                child: const ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                    onPressed: null,
                    child: Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
