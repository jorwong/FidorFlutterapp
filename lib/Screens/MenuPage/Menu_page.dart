import 'package:flutter/material.dart';
import 'package:fidortry/Screens/Homepage/Home_page_Remodel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Menu extends StatefulWidget {
  static String tag = 'Menupage';
  Menu({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MenuState createState() => _MenuState();
}

Future navigateToSubPage(context) async {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => HomePageScreen()));
}

class _MenuState extends State<Menu> {
  var categories = [
    {
      'title': 'Insurance',
      'img': 'lib/asset/Insurance.jpg',
    },
    {
      'title': 'Loan',
      'img': 'lib/asset/loan.png',
    },
    {
      'title': 'Savings',
      'img': 'lib/asset/savings.png',
    },
    {
      'title': 'Bills',
      'img': 'lib/asset/bill.png',
    },
    {
      'title': 'Credit Card',
      'img': 'lib/asset/CreditCard.png',
    },
    {
      'title': 'Overseas Transfer',
      'img': 'lib/asset/Overseas.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Categories",
          style: TextStyle(fontFamily: "WorkSansBold"),
        ),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.8),
        itemCount: 6,
        itemBuilder: (context, i) {
          return InkWell(
            child: Container(
              margin: EdgeInsets.all(5),
              child: Card(
                elevation: 2,
                child: Container(
                  child: Container(
                    color: Color.fromRGBO(0, 0, 0, 0.4),
                    child: buildTitle(categories[i]['title']),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(categories[i]['img']),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            onTap: () => {navigateToSubPage(context)},
          );
        });
  }

  Widget buildTitle(String title) {
    return Center(
      child: Container(
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Colors.white, style: BorderStyle.solid)),
      ),
    );
  }

  Widget buildSeparators(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(left: 10)),
        Text(
          name,
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
      ],
    );
  }

  Widget buildTile(String name, String path, String imgPath) {
    return ListTile(
      leading: Image.asset(
        imgPath,
        scale: 1.2,
      ),
      title: Text(name),
      onTap: () {
        if (path != '/login' && path != '/signUp')
          Navigator.pop(context);
        else
          Navigator.pushNamed(context, path);
      },
    );
  }
}
