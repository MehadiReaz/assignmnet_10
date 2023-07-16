import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  String image =
      'https://expertvagabond.com/wp-content/uploads/best-travel-camera-guide-1.jpg';

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? buildPortraitLayout()
              : buildLandscapeLayout();
        },
      ),
    );
  }

  Widget buildPortraitLayout() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 330,
            height: 330,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            ),
          ),
        ),
        const Text(
          'Jhon Doe',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const Text(
          'Though we should not ignore what other people say,the decision is ultimately ours to mske.When you make a decision, listen to your heart more than the opinions of others. A decision made because of the opinions of others is one we often come to regret.',
          textAlign: TextAlign.justify,
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(child: buildGridView()),
      ],
    );
  }

  Widget buildLandscapeLayout() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.fill),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            children: [
              const Text(
                'Jhon Doe',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Though we should not ignore what other people say,the decision is ultimately ours to mske.When you make a decision, listen to your heart more than the opinions of others. A decision made because of the opinions of others is one we often come to regret.',
                  textAlign: TextAlign.justify,
                ),
              ),
              Expanded(child: buildGridView()),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: 27,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
