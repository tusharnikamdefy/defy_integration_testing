import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  const MoodScreen({Key? key}) : super(key: key);

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  List<CheckboxState> checkboxState = [
    CheckboxState("Amazing", false),
    CheckboxState("A code line a day, keeps the doctor away", false),
    CheckboxState("Flutter makes the day great", false),
    CheckboxState("Happiness", false),
    CheckboxState("Maybe tomorrow is a better day", false)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://images.unsplash.com/photo-1590698933947-a202b069a861?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("How is your mood"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Color(0xDDFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: ListView.builder(
              itemCount: checkboxState.length,
              itemBuilder: (context, index) => CheckboxListTile(
                value: checkboxState[index].value,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      checkboxState[index] = CheckboxState(
                        checkboxState[index].title,
                        value,
                      );
                    });
                  }
                },
                title: Text(
                  checkboxState[index].title,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CheckboxState {
  final String title;
  final bool value;

  CheckboxState(this.title, this.value);
}
