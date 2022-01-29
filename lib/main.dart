import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(80.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(
                            Icons.lock,         // รูปไอคอน
                            size: 80.0,           // ขนาดไอคอน
                            color: Colors.blueGrey,   // สีไอคอน
                          ),
                          Text('กรุณาใส่รหัสผ่าน', style:
                            TextStyle(
                                fontSize: 26.0,
                                color: Colors.blueGrey,
                                fontWeight: FontWeight.w800)
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      //color: Colors.white70,

                      child: Column(

                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               _buildCircle(1),
                               _buildCircle(2),
                               _buildCircle(3),
                             ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircle(4),
                              _buildCircle(5),
                              _buildCircle(6),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildCircle(7),
                              _buildCircle(8),
                              _buildCircle(9),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 85),
                                child: _buildCircle(0),
                              ),
                              _buildBackSpace(),


                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [




                            ],
                          ),
                          Expanded(
                            child: TextButton(onPressed: (){
                              print('pressed forget password');
                            },
                              child:Text('ลืมรหัสผ่าน', style:
                              TextStyle(
                                fontSize: 16.0,
                                color: Colors.blue,
                                fontWeight: FontWeight.w800,)
                              ),),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
        ));
  }

  // วงกลม มี border มีเงา
  Widget _buildCircle(int num) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Text('$num', style:
        TextStyle(
            fontSize: 26.0,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w800)
        ),
        width: 75.0,
        height: 75.0,
        alignment: Alignment.center,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueGrey, width: 4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // สีเงา
                offset: Offset(2, 4), // ทิศทางของเงาในแนวนอนและแนวตั้ง ตามลำดับ
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]
        ),
      ),
    );
  }

  Widget _buildBackSpace() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Icon(
          Icons.backspace,         // รูปไอคอน
          size: 35.0,           // ขนาดไอคอน
          color: Colors.blueGrey,   // สีไอคอน
        ),
        width: 75.0,
        height: 75.0,
        alignment: Alignment.center,
        //color: Colors.white, // ห้ามกำหนด color ตรงนี้ ถ้าหากกำหนดใน BoxDecoration แล้ว

      ),
    );
  }
}