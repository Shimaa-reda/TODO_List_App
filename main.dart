import 'package:flutter/material.dart';

class task {
  final String TaskName;
  // final bool isdone;
  // const task(this.TaskName, this.isdone);
  const task(this.TaskName);
}

List<task> task_name = [
  task("task1"),
  task("task2"),
];

List<task> complete_task = [
  task("task3"),
  task("task4"),
];
List<Map<String, dynamic>> task_content = [
  {"title": "add step", "icon": Icons.add},
  {"title": "Add to My Day", "icon": Icons.brightness_5_rounded},
  {"title": "Remind me", "icon": Icons.add_alert_outlined},
  {"title": "Add due date", "icon": Icons.calendar_today_rounded},
  {"title": "Repeat", "icon": Icons.repeat},
  {"title": "Add File", "icon": Icons.attachment},
];
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TODO_Task',
      home: TodosScreen(),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 17, 70, 99),
        leading: Icon(Icons.arrow_back),
        title: Text("List Name"),
        actions: [
          const Icon(Icons.person_add),
          const Icon(Icons.more_vert),
        ],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
              child: ListView.separated(
                itemCount: task_name.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      leading: const Icon(
                        Icons.circle_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        task_name[index].TaskName,
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: const Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.sticky_note_2,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      tileColor: Color.fromARGB(255, 32, 32, 32),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UncompletedTasks(
                              Task: task_name[index],
                            ),
                            settings: RouteSettings(
                              arguments: task_name[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 17, 70, 99),
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 30,
                width: 110,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 10,
                        color: Colors.white,
                      ),
                      Text(
                        ' Completed  ${complete_task.length}',
                        style: TextStyle(color: Colors.white),
                      )
                    ])),
            SizedBox(
              height: 160,
              child: ListView.separated(
                itemCount: task_name.length,
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.white,
                      ),
                      title: Text(
                        complete_task[index].TaskName,
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.lineThrough),
                      ),
                      trailing: const Icon(
                        Icons.star_border,
                        color: Colors.white,
                      ),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.sticky_note_2,
                            size: 15,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      tileColor: Color.fromARGB(255, 32, 32, 32),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompletedTasks(
                              Task: complete_task[index],
                            ),
                            settings: RouteSettings(
                              arguments: task_name[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        backgroundColor: Color.fromARGB(255, 17, 70, 99),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class UncompletedTasks extends StatelessWidget {
  const UncompletedTasks({Key? key, required this.Task}) : super(key: key);

  final task Task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 17, 70, 99),
        title: Text("List Name"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              tileColor: Color.fromARGB(255, 32, 32, 32),
              title: Text(Task.TaskName,
                  style: TextStyle(
                    color: Colors.white,
                  )),
              leading: Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 20,
              ),
              trailing: Icon(
                Icons.star_border,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 410,
              child: ListView.separated(
                  itemCount: task_content.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 32, 32, 32),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        title: Text(
                          task_content[index]["title"],
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          task_content[index]["icon"],
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
            ),
            Card(
              child: ListTile(
                tileColor: Color.fromARGB(255, 32, 32, 32),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(4.0),
                ),
                subtitle: Text("Added a few moment ago",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
            Card(
              child: ListTile(
                tileColor: Color.fromARGB(255, 32, 32, 32),
                subtitle: Text("created 2 minuts ago",
                    style: TextStyle(color: Colors.white)),
                trailing: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({Key? key, required this.Task}) : super(key: key);

  final task Task;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 17, 70, 99),
        title: Text("List Name"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ListTile(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              tileColor: Color.fromARGB(255, 32, 32, 32),
              title: Text(Task.TaskName,
                  style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.lineThrough)),
              leading: Icon(
                Icons.check_circle,
                size: 20,
                color: Colors.white,
              ),
              trailing: Icon(
                Icons.star_border,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 410,
              child: ListView.separated(
                  itemCount: task_content.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        tileColor: Color.fromARGB(255, 32, 32, 32),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        title: Text(
                          task_content[index]["title"],
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(
                          task_content[index]["icon"],
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
            ),
            Card(
                child: ListTile(
              tileColor: Color.fromARGB(255, 32, 32, 32),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              subtitle: Text("Add note", style: TextStyle(color: Colors.white)),
            )),
            Card(
                child: ListTile(
              tileColor: Color.fromARGB(255, 32, 32, 32),
              subtitle: Text("Completely today",
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(
                Icons.delete,
                size: 20,
                color: Colors.white,
              ),
            )),
          ],
        ),
      ),
    );
  }
}
