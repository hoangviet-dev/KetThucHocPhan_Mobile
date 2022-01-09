import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_do_dung_noi_that/models/sanpham_model.dart';
import 'dart:math' as math;

import 'package:quan_ly_do_dung_noi_that/models/theloai_model.dart';
import 'package:quan_ly_do_dung_noi_that/pages/detail.dart';
import 'package:quan_ly_do_dung_noi_that/pages/list_product.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: statefullHome(),
    );
  }
}

// ignore: camel_case_types
class statefullHome extends StatefulWidget {
  const statefullHome({Key? key}) : super(key: key);

  @override
  _statefullHomeState createState() => _statefullHomeState();
}

// ignore: camel_case_types
class _statefullHomeState extends State<statefullHome> {
  late Color clprimary, cldark, clbg;
  late List<TheLoai> lTheLoai;
  late List<String> lPosters;
  late List<SanPham> lSanPham, lSanPhamMoi, lThinhHanh;

  var txtSearch = TextEditingController();

  @override
  // ignore: must_call_super
  void initState() {
    clprimary = Color(0xFFf39c12);
    cldark = Color(0xFF2d3436);
    clbg = Color(0xFFf5f5f5);
    lTheLoai = [
      new TheLoai(
          id: "1",
          moTa: "Bàn",
          ten: "Bàn",
          hinh:
              "https://i.pinimg.com/564x/f4/bc/00/f4bc007eff00ec63e0d25e83403b6a96.jpg"),
      new TheLoai(
          id: "2",
          moTa: "Ghế",
          ten: "Ghế",
          hinh:
              "https://images.pexels.com/photos/8167312/pexels-photo-8167312.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
      new TheLoai(
          id: "3",
          moTa: "Tủ",
          ten: "Tủ",
          hinh:
              "https://images.pexels.com/photos/1699655/pexels-photo-1699655.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
      new TheLoai(
          id: "4",
          moTa: "Đèn",
          ten: "Đèn",
          hinh:
              "https://images.pexels.com/photos/132340/pexels-photo-132340.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"),
      new TheLoai(
          id: "5",
          moTa: "Thảm",
          ten: "Thảm",
          hinh:
              "https://images.pexels.com/photos/131634/pexels-photo-131634.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
    ];
    lPosters = [
      "https://i.pinimg.com/564x/ab/df/a1/abdfa174d2a498aad7d585440f458959.jpg",
      "https://i.pinimg.com/736x/a5/ca/f1/a5caf1241e985c07b99cc9117dbd0f9c.jpg",
      "https://wedo.vn/wp-content/uploads/2020/10/noi-that-2-600x400.jpg",
      "https://wedo.vn/wp-content/uploads/2020/10/noi-that-phong-bep-2-600x568.jpg",
      "https://wedo.vn/wp-content/uploads/2020/10/noi-that-tab-dau-giuong-600x600.jpg",
      "https://i.pinimg.com/564x/ff/b7/5e/ffb75ef20421b815fad52890f1059d65.jpg",
    ];
    lSanPham = [];
    lThinhHanh = [
      new SanPham(
          gia: "Liên hệ",
          tenSP: "Đèn ốp trần thông minh LED Yeelight gen 2",
          hinhAnh:
              "https://chiemtaimobile.vn/images/thumbnails/600/600/detailed/4/den-tran-yeelight-gen-2.jpg"),
      new SanPham(
          gia: "Liên hệ",
          tenSP: "Bàn làm việc Artisan cao cấp",
          hinhAnh:
              "https://i.pinimg.com/564x/87/30/7a/87307af5be8aee8218bcf9c04855f910.jpg"),
      new SanPham(
          gia: "Liên hệ",
          tenSP: "Thảm Assouan Rug",
          hinhAnh:
              "https://i.pinimg.com/564x/fa/6f/20/fa6f20095abfc6030397d3c6cebc5602.jpg"),
      new SanPham(
          gia: "Liên hệ",
          tenSP: "Đồng hồ treo tường cao cấp",
          hinhAnh:
              "https://cdn.shopify.com/s/files/1/0410/5863/1835/products/2_72880698-94a7-4180-aa42-9c49978d5732_1800x1800.jpg?v=1626058637"),
    ];
  }

  Widget myButton({Widget? child, Function()? onClick}) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color.fromRGBO(236, 240, 241, 1.0),
            boxShadow: [
              BoxShadow(
                color: cldark.withOpacity(0.3),
                spreadRadius: .4,
                blurRadius: 2,
              ),
            ],
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: child,
      ),
      onTap: onClick,
    );
  }

  Widget categoryCard(
      {String title = "", String? urlimage, Function()? onClick}) {
    Color clRand =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(0.4);
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
                color: cldark.withOpacity(0.1),
                spreadRadius: .1,
                blurRadius: 3,
                offset: Offset(0, 2)),
          ],
        ),
        child: Row(
          children: [
            // Icon(
            //   iconData,
            //   color: clRand,
            //   size: 80,
            // ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Image.network(
                urlimage!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                title,
                style: TextStyle(color: cldark, fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "HViet Furniture",
          style: TextStyle(
              fontSize: 18, color: cldark, fontWeight: FontWeight.bold),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: clbg,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: cldark.withOpacity(0.1),
                      spreadRadius: .1,
                      blurRadius: 3,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: txtSearch,
                  decoration: InputDecoration(
                    hintText: "Tìm kiếm",
                    prefixIcon: Icon(Icons.search),
                    focusColor: clprimary,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  style: TextStyle(fontSize: 15),
                  cursorColor: clprimary,
                ),
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: CarouselSlider(
                      items: lPosters.map((posrer) {
                        return Builder(builder: (BuildContext context) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Colors.white),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  width: double.infinity,
                                  child: Image.network(
                                    posrer,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      }).toList(),
                      options: CarouselOptions(
                        height: 240,
                        viewportFraction: 0.9,
                        enableInfiniteScroll: true,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(bottom: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Thể loại",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Xem thêm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: cldark,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: cldark,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          items: lTheLoai.map((theloai) {
                            return Builder(builder: (BuildContext context) {
                              return Container(
                                width: double.infinity,
                                margin: EdgeInsets.all(5),
                                color: Colors.white,
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ListProduct(),
                                        ),
                                      );
                                    },
                                    child: Stack(
                                      children: [
                                        Center(
                                          child: Image.network(
                                            theloai.hinh ?? "",
                                            height: double.infinity,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Center(
                                          child: Text(theloai.ten ?? "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          }).toList(),
                          options: CarouselOptions(
                              height: 110,
                              aspectRatio: 2.0,
                              viewportFraction: 0.3),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Thịnh hành",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Xem thêm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: cldark,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: cldark,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: lThinhHanh.map((thinhanh) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: cldark.withOpacity(0.1),
                                      spreadRadius: .1,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        width: double.infinity,
                                        child: Image.network(
                                          thinhanh.hinhAnh ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              thinhanh.tenSP ?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Giá: " + (thinhanh.gia ?? ""),
                                            style: TextStyle(
                                              color: clprimary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  "Mới",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Text(
                                      "Xem thêm",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: cldark,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Icon(
                                      Icons.arrow_forward_ios,
                                      color: cldark,
                                      size: 15,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          children: lThinhHanh.map((thinhanh) {
                            return InkWell(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: cldark.withOpacity(0.1),
                                      spreadRadius: .1,
                                      blurRadius: 3,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Container(
                                        width: double.infinity,
                                        child: Image.network(
                                          thinhanh.hinhAnh ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      alignment: Alignment.bottomLeft,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            thinhanh.tenSP ?? "",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 13,
                                            ),
                                          ),
                                          Text(
                                            "Giá: " + (thinhanh.gia ?? ""),
                                            style: TextStyle(
                                              color: clprimary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      margin: EdgeInsets.all(5),
                                      child: Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Text(
                                          "Mới",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showModalBottomSheet(
      //         backgroundColor: Colors.transparent,
      //         context: context,
      //         isScrollControlled: true,
      //         isDismissible: false,
      //         builder: (context) => Container(
      //               height: MediaQuery.of(context).size.height * 70 / 100,
      //               child: BackdropFilter(
      //                 filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      //                 child: Container(
      //                   margin: EdgeInsets.all(20),
      //                   padding: EdgeInsets.only(
      //                       left: 20, right: 20, top: 10, bottom: 20),
      //                   decoration: BoxDecoration(
      //                       color: Colors.white.withOpacity(.8),
      //                       borderRadius:
      //                           BorderRadius.all(Radius.circular(30))),
      //                   child: Column(
      //                     children: [
      //                       Container(
      //                         margin: EdgeInsets.only(bottom: 10),
      //                         height: 5,
      //                         width:
      //                             MediaQuery.of(context).size.width * 30 / 100,
      //                         decoration: BoxDecoration(
      //                             borderRadius:
      //                                 BorderRadius.all(Radius.circular(5)),
      //                             color: cldark.withOpacity(.3)),
      //                       ),
      //                       Container(
      //                         margin: EdgeInsets.only(bottom: 10),
      //                         child: Text(
      //                           "THỂ LOẠI",
      //                           style: TextStyle(
      //                               color: cldark,
      //                               fontSize: 22,
      //                               fontWeight: FontWeight.bold),
      //                         ),
      //                       ),
      //                       Expanded(
      //                         child: ListView.builder(
      //                           itemCount: lTheLoai.length,
      //                           itemBuilder: (context, index) {
      //                             return categoryCard(
      //                                 title: lTheLoai[index].ten ?? "",
      //                                 urlimage: lTheLoai[index].hinh,
      //                                 onClick: () {
      //                                   Navigator.pop(context);
      //                                 });
      //                           },
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ));
      //   },
      //   backgroundColor: Colors.transparent,
      //   // shape: RoundedRectangleBorder(
      //   //     borderRadius: BorderRadius.all(Radius.circular(10))),
      //   // child: Icon(Icons.category),
      //   child: Container(
      //     padding: EdgeInsets.all(15),
      //     decoration: BoxDecoration(
      //         gradient: LinearGradient(colors: [
      //           Color(0xfffa709a),
      //           Color(0xFFfda085),
      //         ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      //         borderRadius: BorderRadius.all(Radius.circular(10)),
      //         boxShadow: [
      //           BoxShadow(
      //             color: cldark.withOpacity(0.1),
      //             spreadRadius: .1,
      //             blurRadius: 3,
      //             offset: Offset(0, 2),
      //           ),
      //         ]),
      //     child: Icon(
      //       Icons.category,
      //       color: Colors.white,
      //     ),
      //   ),
      //   // backgroundColor: clprimary,
      //   elevation: 0,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
