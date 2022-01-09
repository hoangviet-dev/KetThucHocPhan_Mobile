import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quan_ly_do_dung_noi_that/models/sanpham_model.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Color clprimary, cldark, clbg;
  late List<String> lPoster;
  late List<SanPham> lSanPhamTT;

  @override
  // ignore: must_call_super
  void initState() {
    clprimary = Color(0xFFf39c12);
    cldark = Color(0xFF2d3436);
    clbg = Color(0xFFf5f5f5);
    lPoster = [
      "https://chiemtaimobile.vn/images/thumbnails/600/600/detailed/4/den-tran-yeelight-gen-2.jpg",
      "http://www.chiemtaimobile.vn/images/Xiaomi/thi%E1%BA%BFt%20b%E1%BB%8B%20gia%20%C4%91%C3%ACnh/%C4%91%C3%A8n%20tr%E1%BA%A7n%20Yeelight%202/den-tran-yeelight-gen-2%20(5).jpg?1509253935617",
      "http://www.chiemtaimobile.vn/images/Xiaomi/thi%E1%BA%BFt%20b%E1%BB%8B%20gia%20%C4%91%C3%ACnh/%C4%91%C3%A8n%20tr%E1%BA%A7n%20Yeelight%202/den-tran-yeelight-gen-2%20(2).jpg?1509254166797",
    ];
    lSanPhamTT = [
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
      backgroundColor: clbg,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: clbg,
              child: ListView(
                shrinkWrap: true,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.height / 2.5,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: lPoster.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.network(
                              i,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: clprimary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Đèn",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Text(
                              "Yeelight Gen 2",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: cldark),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Giá: liên hệ",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: clprimary),
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
                                  "Sản phẩm tương tự",
                                  style: TextStyle(
                                    fontSize: 15,
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
                        Container(
                          height: 250,
                          child: ListView.builder(
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: lSanPhamTT.length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 150,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
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
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        lSanPhamTT[index].hinhAnh ?? "",
                                        fit: BoxFit.cover,
                                        width: 200,
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
                                            margin: EdgeInsets.only(bottom: 5),
                                            child: Text(
                                              lSanPhamTT[index].tenSP ?? "",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 13,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Giá: " +
                                                (lSanPhamTT[index].gia ?? ""),
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
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chi tiết sản phẩm:",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: cldark,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Một ngôi nhà có không gian đẹp không chỉ bởi vì những vật dụng cao cấp mà nó được trang bị, cũng không phải hoàn toàn bởi vì lối thiết kế phong cách của nhà thiết kế. Mà một phần quan trong ít ai để ý đến, nhưng lại có ảnh hưởng rất lớn, chính là nguồn ánh sáng. Nếu như bạn vẫn còn đang phân vân trong việc lựa chọn nguồn sáng cho ngôi nhà mới của mình, thì đèn LED ốp trần Yeelight gen 2 mà chúng tối sắp giới thiệu dưới đây, sẽ là lựa chọn tốt mà bạn nên quan tâm.",
                        ),
                        Image.network(
                            "http://www.chiemtaimobile.vn/images/Xiaomi/thi%E1%BA%BFt%20b%E1%BB%8B%20gia%20%C4%91%C3%ACnh/%C4%91%C3%A8n%20tr%E1%BA%A7n%20Yeelight%202/den-tran-yeelight-gen-2%20(5).jpg?1509253935617"),
                        Text(
                            "Không như phiên bản đèn ốp trần LED Yeelight thế hệ đầu. Sản phẩm mới giờ đây đã có thiết kế tinh tế, sang trọng hơn. Một điểm dễ dàng nhận ra đó là thay kích thước nhỏ nhắn trước đây, thì đèn ốp trần LED Yeelight gen 2 lại có tỉ lệ các cạnh lớn hơn rất nhiều. Cụ thể sản phẩm mới sẽ có 2 phiên bản với 2 kích thước khác nhau, là (Ø 480 × 80mm) cho phiên bản tiêu chuẩn và (Ø 650 × 147mm) cho phiên bản có đèn viền hắt sáng xung quanh."),
                        Image.network(
                            "http://www.chiemtaimobile.vn/images/Xiaomi/thi%E1%BA%BFt%20b%E1%BB%8B%20gia%20%C4%91%C3%ACnh/%C4%91%C3%A8n%20tr%E1%BA%A7n%20Yeelight%202/den-tran-yeelight-gen-2%20(2).jpg?1509254166797"),
                        Text(
                          "Các phần góc cạnh trên đèn, nay cũng đã được lượt bỏ đi và thay cho những đường nét bo cong mềm mại. Nó khiến cho sản phẩm thêm phần sang trọng, tinh tế hơn. Góp phần rất lơn, làm tôn lên vẻ đẹp cho không gian ngôi nhà của bạn.",
                        ),
                        Image.network(
                            "http://www.chiemtaimobile.vn/images/Xiaomi/thi%E1%BA%BFt%20b%E1%BB%8B%20gia%20%C4%91%C3%ACnh/%C4%91%C3%A8n%20tr%E1%BA%A7n%20Yeelight%202/den-tran-yeelight-gen-2%20(10).jpg?1509254267409"),
                        Text(
                          "Đèn được trang hệ thống các bóng LED, bố trí một cách thông minh bên trong. Giúp cho hiệu quả ánh sáng tốt hơn, chiếu sáng mạnh mẽ, đồng nhất tại mọi khu vực trong căn phòng. Kết hợp với tấm nền bằng nhựa acrylic trong suốt, sẽ giúp cho ánh sáng dễ chịu, hạn chế đến mức thấp nhất cảm giác chói cho mắt người dùng.",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(10),
                    primary: Colors.black38,
                    shadowColor: Colors.transparent,
                  ),
                  child: Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
