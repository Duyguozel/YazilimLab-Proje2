import 'package:flutter/material.dart'; //Google'ın uygulama geliştiriciler için sunduğu hizmet arayüz için
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:async';

//Flutter kodlarını bir dart fonksiyonu içinde çalıştırmamız lazım. Flutter dart ile yazılmıştır. main() fonksiyonu

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MobilSorgularProjesi1());
}

class MobilSorgularProjesi1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "HOME",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                backgroundColor: Colors.blueGrey),
          ),
        ),
        body: AnaSayfa(),
      ),
    );
  }
}

class AnaSayfa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        //decoration: BoxDecoration,
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
                child:
                    Text("1. Özellik", style: TextStyle(color: Colors.brown)),
                hoverElevation: 50,
                textColor: Colors.brown[1000],
                color: Colors.deepOrange[200],
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sayfa1()))),
            RaisedButton(
                child: Text(
                  "2. Özellik",
                  style: TextStyle(color: Colors.amber[200]),
                ),
                hoverElevation: 50,
                textColor: Colors.brown[1000],
                color: Colors.teal,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sayfa2()))),
            RaisedButton(
                child: Text("3. Özellik"),
                hoverElevation: 50,
                textColor: Colors.brown[1000],
                color: Colors.pinkAccent,
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Sayfa3()))),
          ],
        ),
      ),
    );
  }
}

class Sayfa1 extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "HOME",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                backgroundColor: Colors.blueGrey),
          ),
        ),
        body: Center(
          child: Container(
            //decoration: BoxDecoration,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Center(
                RaisedButton(
                    child: Text("GETİR", style: TextStyle(color: Colors.brown)),
                    hoverElevation: 50,
                    textColor: Colors.brown[1000],
                    color: Colors.deepOrange[200],
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VeriAl()))),

                //)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VeriAl extends StatelessWidget {
  Stream collectionStream =
      FirebaseFirestore.instance.collection('verilerAgain').snapshots();
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('verilerAgain');

    Query query = FirebaseFirestore.instance.collection('verilerAgain');
    query = query.orderBy('passenger_count', descending: true).limit(5);
    print(query);

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 75),
              child: Center(
                child: Text(
                    "\n Yolcu Sayısı: " +
                        "${document.data()['passenger_count']}" +
                        "\n Başlangıç Tarihi: " +
                        "${document.data()['tpep_pickup_datetime']}" +
                        "\n Bitiş Tarihi:  " +
                        "${document.data()['tpep_dropoff_datetime']}",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.pink[300],
                        backgroundColor: Colors.teal[50])),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}

String valueChoose1;
String valueChoose2;

class Sayfa2 extends StatefulWidget {
  Sayfa2({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _Sayfa2State createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  List listItem = [
    "2020-12-01",
    "2020-12-02",
    "2020-12-03",
    "2020-12-04",
    "2020-12-05",
    "2020-12-06",
    "2020-12-07",
    "2020-12-08",
    "2020-12-09",
    "2020-12-10",
    "2020-12-11",
    "2020-12-12",
    "2020-12-13",
    "2020-12-14",
    "2020-12-15",
    "2020-12-16",
    "2020-12-17",
    "2020-12-18",
    "2020-12-19",
    "2020-12-20",
    "2020-12-21",
    "2020-12-22",
    "2020-12-23",
    "2020-12-24",
    "2020-12-25",
    "2020-12-26",
    "2020-12-27",
    "2020-12-28",
    "2020-12-29",
    "2020-12-30",
    "2020-12-31",
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            centerTitle: true,
            title: Text(
              "Sayfa 2",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  backgroundColor: Colors.blueGrey),
            ),
          ),
          body: Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 75),
              child: Column(children: <Widget>[
                DropdownButton(
                    hint: Text("Başlangıç Tarihini Seçiniz"),
                    value: valueChoose1,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose1 = newValue;
                        print(valueChoose1);
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList()),
                DropdownButton(
                    hint: Text("Bitiş Tarihini Seçiniz"),
                    value: valueChoose2,
                    icon: Icon(Icons.arrow_drop_down),
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose2 = newValue;
                        print(valueChoose2);
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList()),
                RaisedButton(
                    child: Text("GETİR", style: TextStyle(color: Colors.brown)),
                    hoverElevation: 50,
                    textColor: Colors.brown[1000],
                    color: Colors.deepOrange[200],
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VeriAl2()))),
              ]),
            ),
          )),
    );
  }
}

class VeriAl2 extends StatelessWidget {
  //Streambuilder ve snapshots anlık veri almamızı saglar. FutureBuilder ile anlık veri alamayız
  Stream collectionStream =
      FirebaseFirestore.instance.collection('verilerAgain').snapshots();
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('verilerAgain');

    Query query = FirebaseFirestore.instance.collection('verilerAgain');

    List<dynamic> mesafeler = [];
    List<dynamic> mesafelerY = [];
    List tarihler = [];
    List tarihlerY = [];

    query = query
        .where('tpep_pickup_datetime', isGreaterThan: valueChoose1)
        .where('tpep_pickup_datetime', isLessThan: valueChoose2);

    return StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          children:
          snapshot.data.docs.map((DocumentSnapshot document) {
            mesafeler.add("${document.data()['trip_distance']}");
            tarihler.add("${document.data()['tpep_pickup_datetime']}");
          }).toList();
          for (var i = 0; i < mesafeler.length; i++) {
            for (var j = 0; j < mesafeler.length - 1; j++) {
              if (double.parse(mesafeler[j]) > double.parse(mesafeler[j + 1])) {
                var temp = mesafeler[j];
                var temp2 = tarihler[j];
                mesafeler[j] = mesafeler[j + 1];
                tarihler[j] = tarihler[j + 1];
                mesafeler[j + 1] = temp;
                tarihler[j + 1] = temp2;
              }
            }
          }
          print(mesafeler);
          for (var k = 0; k < 5; k++) {
            mesafelerY.add(mesafeler[k]);
            tarihlerY.add(tarihler[k]);
          }

          print(mesafelerY);
          print(tarihlerY);

          return new ListView.builder(
              padding: const EdgeInsets.all(30),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.orangeAccent[600],
                  child: Center(
                      child: Text(
                    "\nEn kısa mesafe: " +
                        "${mesafelerY[index]}" +
                        "\nTarihi: " +
                        "${tarihlerY[index]}" +
                        "\n",
                    style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        backgroundColor: Colors.blueGrey[600]),
                  )),
                );
              });
        });
  }
}

class Sayfa3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: Text(
            "HOME",
            style: TextStyle(
                fontSize: 25.0,
                color: Colors.white,
                backgroundColor: Colors.blueGrey),
          ),
        ),
        body: Center(
          child: Container(
            //decoration: BoxDecoration,
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                //Center(
                RaisedButton(
                    child: Text("GETİR", style: TextStyle(color: Colors.brown)),
                    hoverElevation: 50,
                    textColor: Colors.brown[1000],
                    color: Colors.deepOrange[200],
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VeriAl3()))),

                //)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

double _originLatitude;
double _originLongitude;
double _destLatitude;
double _destLongitude;

double _originLatitude1;
double _originLongitude1;
double _destLatitude1;
double _destLongitude1;

class Harita extends StatefulWidget {
  @override
  _HaritaState createState() => _HaritaState();
}

// Starting point latitude
/*double _originLatitude = 6.5212402;
// Starting point longitude
double _originLongitude = 3.3679965;
// Destination latitude
double _destLatitude = 6.849660;
// Destination Longitude
double _destLongitude = 3.648190;*/
// Markers to show points on the map
//
Map<MarkerId, Marker> markers = {};

PolylinePoints polylinePoints = PolylinePoints();
Map<PolylineId, Polyline> polylines = {};

//https://dev.to/olayemii/adding-route-paths-polylines-between-two-points-to-google-maps-in-flutter-23o2 bu sayfadan uyarlanmıstır
class _HaritaState extends State<Harita> {
  // Google Maps controller
  Completer<GoogleMapController> _controller = Completer();
  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(_originLatitude, _originLongitude),
    zoom: 9.4746,
  );

  @override
  void initState() {
    print(yol.toString());
    var uzak1;
    var uzak2;
    var uzak3;
    var uzak4;
    String yol4 = yol[0].toString();
    yol4 = yol4.substring(1, yol[0].length - 1);
    print(yol4);

    uzak1 = yol4.split(',');
    _originLatitude = double.parse(uzak1[0]);
    _originLongitude = double.parse(uzak1[1]);

    String yol1 = yol[1].toString();
    yol1 = yol1.substring(1, yol[1].length - 1);
    print(yol1);

    uzak2 = yol1.split(',');
    _destLatitude = double.parse(uzak2[0]);
    _destLongitude = double.parse(uzak2[1]);

    String yol2 = yol[2].toString();
    yol2 = yol2.substring(1, yol[2].length - 1);
    print(yol2);

    uzak3 = yol2.split(',');
    _originLatitude1 = double.parse(uzak3[0]);
    _originLongitude1 = double.parse(uzak3[1]);

    /*String yol3 = yol[3].toString();
    yol3 = yol3.substring(1, yol[3].length - 1);
    print(yol3);

    uzak4 = yol3.split(',');
    _destLatitude1 = double.parse(uzak4[0]);
    _destLongitude1 = double.parse(uzak4[1]);*/

    /// add origin marker origin marker
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );

    _addMarker(
      LatLng(_originLatitude1, _originLongitude1),
      "destination2",
      BitmapDescriptor.defaultMarkerWithHue(60),
    );

    _getPolyline();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Harita İşlemleri',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Harita İşlemleri'),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          myLocationEnabled: true,
          tiltGesturesEnabled: true,
          compassEnabled: true,
          scrollGesturesEnabled: true,
          zoomGesturesEnabled: true,
          polylines: Set<Polyline>.of(polylines.values),
          markers: Set<Marker>.of(markers.values),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }

  // This method will add markers to the map based on the LatLng position
  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "API KEY",
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }
}

class VeriAl3 extends StatefulWidget {
  @override
  _VeriAl3State createState() => _VeriAl3State();
}

List<dynamic> sehir = [];
List<dynamic> bolge = [];
List<String> yol = [];

class _VeriAl3State extends State<VeriAl3> {
  Stream collectionStream =
      FirebaseFirestore.instance.collection('verilerAgain').snapshots();
  Stream collectionStream2 = FirebaseFirestore.instance
      .collection('veriler')
      .snapshots(); //taksi verleri tutulur
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('verilerAgain');
    CollectionReference users2 =
        FirebaseFirestore.instance.collection('veriler');

    Query query = FirebaseFirestore.instance.collection('verilerAgain');
    query = query.where('passenger_count', isGreaterThan: '2');

    Query query2 = FirebaseFirestore.instance.collection('veriler');

    List<dynamic> yolcuSayilari = [];
    List<dynamic> mesafeler3 = [];
    List<dynamic> baslangicL = [];
    List<dynamic> bitisL = [];
    List<dynamic> gidilecekYerler = [];

    List<dynamic> taksiLocation = [];

    return StreamBuilder<QuerySnapshot>(
        stream: query.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }

          children:
          print("--------------------");
          snapshot.data.docs.map((DocumentSnapshot document) {
            yolcuSayilari.add("${document.data()['passenger_count']}");
            mesafeler3.add("${document.data()['trip_distance']}");
            baslangicL.add("${document.data()['DOLocationID']}");
            bitisL.add("${document.data()['PULocationID']}");

            print(yolcuSayilari);
          }).toList();
          for (var i = 0; i < mesafeler3.length; i++) {
            for (var j = 0; j < mesafeler3.length - 1; j++) {
              if (double.parse(mesafeler3[j]) >
                  double.parse(mesafeler3[j + 1])) {
                var temp = mesafeler3[j];
                var tempbas = baslangicL[j];
                var tempbit = bitisL[j];

                mesafeler3[j] = mesafeler3[j + 1];
                mesafeler3[j + 1] = temp;

                baslangicL[j] = baslangicL[j + 1];
                baslangicL[j + 1] = tempbas;

                bitisL[j] = bitisL[j + 1];
                bitisL[j + 1] = tempbit;
              }
            }
          }

          gidilecekYerler.add(baslangicL[0]);
          gidilecekYerler.add(bitisL[0]);
          gidilecekYerler.add(baslangicL[baslangicL.length - 1]);
          gidilecekYerler.add(bitisL[bitisL.length - 1]);

          print("En kisa yolculuk:" +
              mesafeler3[0] +
              " Baslangic Konumu" +
              baslangicL[0] +
              " Bitis Konumu" +
              bitisL[0]);
          print("En uzun yolculuk: " +
              mesafeler3[mesafeler3.length - 1] +
              " Baslangic Konumu: " +
              baslangicL[baslangicL.length - 1] +
              " Bitis Konumu: " +
              bitisL[bitisL.length - 1]);

          return StreamBuilder<QuerySnapshot>(
              stream: query2.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                children:
                snapshot.data.docs.map((DocumentSnapshot document) {
                  taksiLocation
                      .add("${document.data()['LocationID'].toString()}");
                  sehir.add("${document.data()['Zone'].toString()}");
                  bolge.add("${document.data()['Borough'].toString()}");
                  print(bolge);
                  //print("----------------------------");
                  //print(taksiLocation);
                }).toList();
                for (var j = 0; j < taksiLocation.length; j++) {
                  for (var k = 0; k < 4; k++) {
                    if (int.parse(gidilecekYerler[k]) ==
                        int.parse(taksiLocation[j])) {
                      print("-----------------------");
                      print(taksiLocation[j]);
                    }
                  }
                }
                //HaritaBilgisi();

                return new ListView.builder(
                    padding: const EdgeInsets.all(30),
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Container(
                          //decoration: BoxDecoration,
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              RaisedButton(
                                  child: Text("Haritada Çiz",
                                      style: TextStyle(color: Colors.brown)),
                                  hoverElevation: 50,
                                  textColor: Colors.brown[1000],
                                  color: Colors.deepOrange[200],
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Harita()))),
                              RaisedButton(
                                  child: Text(
                                    "Koordinat Getir",
                                    style: TextStyle(color: Colors.amber[200]),
                                  ),
                                  hoverElevation: 50,
                                  textColor: Colors.brown[1000],
                                  color: Colors.teal,
                                  onPressed: () => HaritaBilgisi()),
                            ],
                          ),
                        ),
                      );
                    });
              });
        });

    // return Container();
  }
}

void HaritaBilgisi() async {
  for (var i = 0; i < sehir.length; i++) {
    //print("SEHIIRRRLEEERRRR:" + sehir.toString());
    var addresses = await Geocoder.local.findAddressesFromQuery(sehir[i]);
    var first = addresses.first;
    print("${first.featureName} : ${first.coordinates}");
    yol.add((first.coordinates).toString());
    print(yol[i]);
  }
}
