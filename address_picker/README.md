# address_picker
Flutter城市选择器, 省市区选择器

## Usage

```dart
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('show'),
          onPressed: () {
            showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheet(
                    onClosing: () {},
                    builder: (context) => Container(
                          height: 250.0,
                          child: AddressPicker(
                            style: TextStyle(color: Colors.black, fontSize: 17),
                            mode: AddressPickerMode.provinceCityAndDistrict,
                            onSelectedAddressChanged: (address) {
                              print('${address.currentProvince.province}');
                              print('${address.currentCity.city}');
                              print('${address.currentDistrict.area}');
                            },
                          ),
                        )));
          },
        ),
      ),
    );
  }
}
```

### Property

- **mode**:

```dart
/// 选择模式
/// province 一级: 省
/// provinceAndCity 二级: 省市 
/// provinceCityAndDistrict 三级: 省市区
final AddressPickerMode mode;
```

- **onSelectedAddressChanged**:

```dart
/// 选中的地址发生改变回调
final AddressCallback onSelectedAddressChanged;
```

- **style**:

```dart
/// 省市区文字显示样式
final TextStyle style;
```