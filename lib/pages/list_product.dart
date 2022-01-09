import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_do_dung_noi_that/models/sanpham_model.dart';
import 'package:quan_ly_do_dung_noi_that/models/theloai_model.dart';

class ListProduct extends StatefulWidget {
  const ListProduct({Key? key}) : super(key: key);

  @override
  _ListProductState createState() => _ListProductState();
}

class _ListProductState extends State<ListProduct> {
  late Color clprimary, cldark, clbg;
  late List<TheLoai> lTheLoai;
  late List<SanPham> lSanPham;

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
    lSanPham = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                height: 60,
                color: Colors.white,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          primary: Colors.white,
                          shadowColor: cldark.withOpacity(0.3),
                        ),
                        child: Icon(Icons.arrow_back, color: cldark),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Expanded(
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
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
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
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(bottom: 10),
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "ĐÈN",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.all(10),
                            children: lSanPham.map(
                              (sanpham) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: cldark.withOpacity(0.1),
                                        spreadRadius: .1,
                                        blurRadius: 3,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.network(
                                          sanpham.hinhAnh ?? "",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.all(10),
                                          height: 100,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Flexible(
                                                  child: Text(
                                                    sanpham.tenSP ?? "",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  sanpham.gia ?? "",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
