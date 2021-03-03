import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'The Beatles';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        backgroundColor: Colors.black,),
        body: SliderPage(),
   
      ),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0;
  bool _bloquearCheck = false;  
  final List<String> _beatles = ['Please, Please Me (1963)', 'A Hard Days Night (1964)', 'Help (1965)', 'Rubber Soul (1965)', 'Yesterday And Today (1966)', 'Revolver (1966)', 'Let It Be (1970)'];
  final List<String> _imagenes =[    
    'https://images-na.ssl-images-amazon.com/images/I/819oEzz9axL._AC_SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91VIeO-NmsL._AC_SX522_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/61zcnHLWx4L._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/91ym3sMcvRL._SL1500_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/71gTYmuhLTL._SY355_.jpg',
    'https://images-na.ssl-images-amazon.com/images/I/51XaomfhFKL.jpg',
    'https://upload.wikimedia.org/wikipedia/en/2/25/LetItBe.jpg',
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Albums por años'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            Expanded(
              child: _crearImagen()
            ),
            Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 5,
                ), 
                borderRadius: BorderRadius.circular(100)
              ),             
              child: Text(_beatles[_valorSlider.round()              
              ]
              )
              )
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.white,
      label: 'Albums por año',
      divisions: 6,
      value: _valorSlider,
      min: 0,
      max: 6,
      onChanged: ( _bloquearCheck ) ? null : ( valor ){
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Container(
        color: Colors.white,
        child: Text('Bloquear slider')),
      value: _bloquearCheck,
      onChanged: (valor){ 
        setState(() {
          _bloquearCheck = valor;
        });
      },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(_imagenes[_valorSlider.round()]),
      width: 250,
      fit: BoxFit.contain,
    );
  }
}
