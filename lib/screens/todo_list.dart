import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  bool _checkbox = false;
  List<String> _todoItems = [];


  void _addTodoItem(String task) {
    setState(() => _todoItems.add(task));
  }

  void _removeTodoItem(int index) {
    setState(() => _todoItems.removeAt(index));
  }

  Widget _buildTodoList() {
    return ListView.builder(
      // ignore: missing_return
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return _buildTodoItem(_todoItems[index], index);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List'),
        backgroundColor: Colors.deepOrange,
      ),
      body: _buildTodoList(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
          onPressed: _AddTodo,
          tooltip: 'Add task',
          child: Icon(Icons.add)),
    );
  }

  void _AddTodo() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
          appBar: AppBar(title: Text('ToDo List'),
            backgroundColor: Colors.deepOrange,),
          body: TextField(
            autofocus: true,
            onSubmitted: (val) {
              _addTodoItem(val);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                hintText: 'Enter tasks for ToDo',
                contentPadding: const EdgeInsets.all(16.0)),
          ));
    }));
  }

  Widget _buildTodoItem(String todoText, int index) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -20),
              blurRadius: 10,
              color: Color(0xFFDADADA).withOpacity(0.50),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: ListTile(
            leading: Checkbox(
              value: _checkbox,
              onChanged: (value) {
                setState(() {
                  _checkbox = !_checkbox;
                });
              },
            ),
            title: Text(todoText),
            trailing: IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                _alertDialog(index);
              },
            ),
            //onTap: () => _promptRemoveTodoItem(index)
          ),
        ),
      ),
    );
  }

  void _alertDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text('Remove "${_todoItems[index]}" from ToDo List?'),
              actions: <Widget>[
                ElevatedButton(
                    child: Text('CANCEL'),
                    onPressed: () => Navigator.of(context).pop()),
                ElevatedButton(
                    child: Text('REMOVE'),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    })
              ]);
        });
  }
}
