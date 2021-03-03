import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false);
  }
}

class HomePage extends StatelessWidget {
  final _foto1 =
      'https://i.pinimg.com/originals/04/16/ff/0416ffbd3251f6c74085ecda80d590ca.jpg';
  final _foto2 =
      'https://i.pinimg.com/736x/58/96/3c/58963c73bd94f6bede5b5d5a19ce9972.jpg';
  final _foto3 =
      'https://fsb.zobj.net/crop.php?r=W12s__nrrKq2o8Vz_84Dvoev1npEYXneYfEMdeQeVYR4nT8U8Pji5M9pf9IlzJwDyCiKNGRw_gpQpifkcr3_7BQ1TgVXcOkHGO3iuRkb2xoGAQQZevbJML9hPVytl2HoYePH5Vkb228nbCEp01hvFCNSn9JcZ78vQuIf8Ubzs3HQ5I8QDyqJSeAG6BCFUUPBPcNreEcmYUDP4Fgr';
  final txtStyle1 = TextStyle(color: Colors.white, fontSize: 45.0);
  final txtStyle2 = TextStyle(color: Colors.white, fontSize: 25.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(scrollDirection: Axis.vertical, children: <Widget>[
      _pagina(
          url: _foto1,
          t1: 'Spider-Man',
          t2: 'Creado en 1962, se convirtió en el personaje más importante de la "Casa de las Ideas".\nPeter Parker es un chico de Queens que fue mordido por una araña radioactiva que le otorgó las habilidades de una araña',          
          icon: Icons.keyboard_arrow_down),
      _pagina(
          url: _foto2,
          t1: 'Spider-Verse',
          t2: 'A lo largo de los años, el personaje ha tenido varias adaptaciones al cine y la televisión.\nHoy en día, "Spider-man: Into The Spider-Verse" es considerada la mejor película del personaje.',
          icon: Icons.keyboard_arrow_down),
      _pagina(
          url: _foto3,
          t1: 'No Way Home',
          t2: 'En cuanto a live action, la última iteración de Spidey es interpretada por Tom Holland.\nSe espera que en la 3ra parte de su trilogía regresen sus antecesores(Tobey Maguire y Andrew Garfield) como parte del multiverso',
          icon: Icons.keyboard_arrow_up),    
    ]
    )
    );
  }

  Widget _pagina({String url, String t1, String t2, IconData icon}) {
    return Stack(children: <Widget>[
      _fondo(imagen: url),
      _contenido(t1: t1, t2: t2, icon: icon)
    ]);
  }

  Widget _fondo({String imagen}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(image: NetworkImage(imagen), fit: BoxFit.cover),
    );
  }

  Widget _contenido({String t1, String t2, IconData icon}) {
    return SafeArea(
        child: Column(children: <Widget>[
      SizedBox(height: 50.0),
      Text(t1, style: txtStyle1),
      Text(t2, style: txtStyle2),      
      Expanded(child: Container()),
      Icon(icon, size: 80.0, color: Colors.pink)
    ]
    )
    );
  }
}
