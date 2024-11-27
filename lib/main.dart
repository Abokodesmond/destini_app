import 'package:destini/story_brain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => (runApp(Destini()));

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}
StoryBrain storyBrain =StoryBrain();

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'images/background.png',
              ),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 15.0,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        0.0,
                      ),
                    ),
                    backgroundColor: Colors.red
                  ),
                  onPressed: () {
                    setState(() {
                     storyBrain.nextStory(1); 
                    });
                  
                  },
                  child: Text(
                    storyBrain.getchoice1(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          0.0,
                        ),
                      ),
                      backgroundColor: Colors.blue
                    ),
                    onPressed: () {  setState(() {
                       storyBrain.nextStory(2); 
                      });},
                    child: Text(
                     storyBrain.getchoice2(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
