import 'package:flutter/material.dart';
import 'package:my_todo/models/Profile.dart';
import 'package:my_todo/models/Project.dart';
import 'package:my_todo/api/Service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _showDetails = false;
  List<Project> _projects = [];
  List<Profile> _profiles = [];
  Profile _currentProfile;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    Service service = Service();
    _projects = await service.getProjects();
    _profiles = await service.getProfiles();
    _currentProfile = _profiles.isNotEmpty ? _profiles[0] : null;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      endDrawer: _buildNotificationDrawer(),
      floatingActionButton: Builder(
        builder: (context) => _buildAddProjectFAB(context),
      ),
      drawer: _buildMenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(5),
        child: _buildProjectsListView(),
      ),
    );
  }

  RefreshIndicator _buildProjectsListView() {
    return RefreshIndicator(
      onRefresh: fetchData,
      child: ListView(
        children: List.generate(
          _projects.length,
          (index) => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            margin: EdgeInsets.all(5),
            elevation: 2,
            color: Colors.green[50],
            child: Column(
              children: [
                Text(
                  _projects[index].title,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900),
                ),
                Divider(
                  color: Colors.grey[400],
                ),
                Text(
                  _projects[index].details,
                  style: TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 2),
                InkWell(
                  child: Text(
                    "More deatails",
                    style: TextStyle(
                      color: Colors.green[900],
                    ),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/project',arguments: _projects[index]);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Drawer _buildMenuDrawer() {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            onDetailsPressed: () {
              setState(() {
                _showDetails = !_showDetails;
              });
            },
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                (_currentProfile != null)
                    ? _currentProfile.name.substring(0, 1)
                    : 'A',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green[700],
                ),
              ),
            ),
            accountName:
                Text((_currentProfile != null) ? _currentProfile.name : 'ALY'),
            accountEmail: Text((_currentProfile != null)
                ? _currentProfile.email
                : 'alyzarezadeh@gmail.com'),
          ),
          Column(
            children: _showDetails
                ? List.generate(
                    _profiles.length,
                    (index) => ListTile(
                      title: Text('${_profiles[index].name}'),
                      onTap: (){
                        setState(() {
                          _currentProfile = _profiles[index];
                        });
                      },
                    ),
                  )
                : [
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text("Projects"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text("Profile"),
                      onTap: () {
                        Navigator.pushNamed(context, '/profile',arguments: _currentProfile);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.archive),
                      title: Text("Closed Projects"),
                      onTap: () {},
                    ),
                  ],
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildAddProjectFAB(BuildContext context) {
    return FloatingActionButton(
      elevation: 2,
      child: Icon(Icons.add),
      backgroundColor: Colors.green,
      onPressed: () => showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text("New Project")],
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 2.5,
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    icon: Icon(Icons.title),
                    labelText: "Project Title",
                  ),
                ),
              ),
              Material(
                elevation: 2.5,
                child: TextField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    icon: Icon(Icons.title),
                    labelText: "Project Details",
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                elevation: 2.5,
                color: Colors.green[700],
                child: Text(
                  "Add Project",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          height: 300,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green[700],
              width: 3,
            ),
          ),
        ),
      ),
    );
  }

  Drawer _buildNotificationDrawer() {
    return Drawer(
      elevation: 10,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(),
                    flex: 1,
                  ),
                  Expanded(
                    child: Center(child: Text("Notifications")),
                    flex: 5,
                  ),
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.clear_all),
                      onPressed: () {},
                    ),
                    flex: 1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Projects'),
      elevation: 2,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
      ],
    );
  }
}
