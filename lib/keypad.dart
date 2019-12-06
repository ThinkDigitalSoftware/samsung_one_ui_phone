import 'package:flutter/material.dart';

class Keypad extends StatefulWidget {
  Keypad({Key key, this.showBottomNavigationBar}) : super(key: key);
  final ValueChanged<bool> showBottomNavigationBar;
  @override
  _KeypadState createState() => _KeypadState();
}

class _KeypadState extends State<Keypad> {
  final _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AppBar(
          title: Text('Phone'),
          centerTitle: false,
          actions: <Widget>[
            Icon(Icons.search),
            Icon(Icons.more_vert),
            Padding(padding: EdgeInsets.only(left: 10))
          ],
        ),
        Container(
          height: 200,
          child: Stack(
            children: <Widget>[
              if (_textEditingController.text.isNotEmpty)
                InkWell(
                  borderRadius: BorderRadius.circular(200),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '+ Add to Contacts',
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  onTap: () {},
                ),
            ],
          ),
        ),
        Container(
          height: 20,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ConstrainedBox(
                constraints: BoxConstraints(
                    minWidth: 100, maxWidth: MediaQuery.of(context).size.width),
                child: TextField(
                  controller: _textEditingController,
                  decoration: InputDecoration(border: InputBorder.none),
                  autofocus: false,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 20),
        ),
        Expanded(
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            childAspectRatio: 2,
            children: <Widget>[
              for (final key in [1, 2, 3, 4, 5, 6, 7, 8, 9, '⁎', 0, '#'])
                InkWell(
                  onTap: () {
                    setState(() {
                      _textEditingController.text =
                          "${_textEditingController.text}$key";
                      widget.showBottomNavigationBar(false);
                    });
                  },
                  onLongPress: () {
                    if (key == 0) {
                      _textEditingController.text =
                          "${_textEditingController.text}+";
                    }
                  },
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "$key",
                            style: TextStyle(fontSize: key == '*' ? 40 : 40),
                          ),
                        ),
                        Transform.translate(
                          child: _getSubTitle(key),
                          offset: Offset(0, -10),
                        )
                      ],
                    ),
                  ),
                  customBorder: CircleBorder(),
                ),
              Visibility(
                visible: _textEditingController.text.isNotEmpty,
                child: InkWell(
                  onTap: () {},
                  child: Center(
                    child: Icon(
                      Icons.videocam,
                      size: 40,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  customBorder: CircleBorder(),
                ),
              ),
              MaterialButton(
                shape: CircleBorder(),
                child: Center(
                  child: Icon(
                    Icons.phone,
                    size: 40,
                  ),
                ),
                onPressed: () {},
                color: Colors.green,
              ),
              if (_textEditingController.text.isNotEmpty)
                InkWell(
                  onTap: () {
                    if (_textEditingController.text.isNotEmpty) {
                      _textEditingController.text = _textEditingController.text
                          .substring(0, _textEditingController.text.length - 1);
                    }
                    if (_textEditingController.text.isEmpty) {
                      widget.showBottomNavigationBar(true);
                    }
                  },
                  onLongPress: () {
                    _textEditingController.clear();
                    setState(() {});
                    widget.showBottomNavigationBar(true);
                  },
                  child: Center(
                    child: Icon(Icons.backspace),
                  ),
                  customBorder: CircleBorder(),
                )
            ],
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
        )
      ],
    );
  }

  Widget _getSubTitle(Object key) {
    String bottomText;
    switch (key) {
      case 1:
        return Icon(
          Icons.voicemail,
          size: 20,
          color: Colors.grey,
        );
      case 2:
        bottomText = 'ABC';
        break;
      case 3:
        bottomText = 'DEF';
        break;
      case 4:
        bottomText = 'GHI';
        break;
      case 5:
        bottomText = 'JKL';
        break;
      case 6:
        bottomText = 'MNO';
        break;
      case 7:
        bottomText = 'PQRS';
        break;
      case 8:
        bottomText = 'TUV';
        break;
      case 9:
        bottomText = 'WXYZ';
        break;
      case 0:
        bottomText = '+';
        break;
      default:
        return Container();
    }
    assert(bottomText != null);
    return Text(
      bottomText,
      style: TextStyle(color: Colors.grey),
    );
  }
}
