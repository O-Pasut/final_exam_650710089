import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();

  double _distance = 0.0;

  String? _location;
  final _itemList = <String>["ในเมือง", "ต่างจังหวัด", "ต่างประเทศ"];
  final _priceList = <int>[10, 15, 50];

  bool _isCheckedPacking = false;
  bool _isCheckedEnsure = false;
  String _transport = '';
  double _price = 0.0;

  double calculatePrice() {
    // Base price
    double price = _distance * _priceList[_itemList.indexOf(_location!)];

    // Addition
    price += (_isCheckedPacking ? 20 : 0) + (_isCheckedEnsure ? 50 : 0);

    // Transport
    if (_transport == 'ปกติ') {
      price += 0;
    } else if (_transport == 'ด่วน') {
      price += 30;
    } else {
      price += 50;
    }

    return price;
  }

  Widget getRadioTile(String text, String value) {
    return RadioListTile(
      title: Text(text),
      value: value,
      groupValue: _transport,
      onChanged: (value) {
        setState(() {
          _transport = value.toString();
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("คำนวณค่าจัดส่ง")),
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text("น้ำหนักสินค้า (กก.):"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUnfocus,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    _distance = double.parse(value);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "โปรกกรอกข้อมูล";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  label: Text("เลือกระยะทาง:"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                value: _location,
                items:
                    _itemList
                        .map(
                          (item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged: (value) {
                  setState(() {
                    _location = value;
                  });
                },
                validator:
                    (value) => value == null ? 'Please select an optiom' : null,
              ),
              SizedBox(height: 20),
              const Text("บริการเสริม:"),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('แพ้คกิ้งพิเศษ (+20 บาท)'),
                      value: _isCheckedPacking,
                      onChanged: (value) {
                        setState(() {
                          _isCheckedPacking = value!;
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('ประกันพัสดุ (+50 บาท)'),
                      value: _isCheckedEnsure,
                      onChanged: (value) {
                        setState(() {
                          _isCheckedEnsure = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              const Text("เลือกความเร่งด่วน:"),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    getRadioTile('ปกติ', 'ปกติ'),
                    getRadioTile('ด่วน', 'ด่วน'),
                    getRadioTile('ด่วนพิเศษ', 'ด่วนพิเศษ'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _price = calculatePrice();
                        });
                      }
                    },
                    child: const Text("คำนวณราคา"),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    width: 300,
                    height: 60,
                    color: Colors.lightBlue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "คำนวณค่าจัดส่งทั้งหมด: ฿$_price",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
