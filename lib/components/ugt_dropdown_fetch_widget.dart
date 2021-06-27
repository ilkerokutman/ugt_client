import 'package:flutter/material.dart';
import 'package:ugt_client/helpers/utils.dart';
import 'package:ugt_client/models/db_entity.dart';

class UgtDropdownFetchWidget extends StatefulWidget {
  String title;
  String? selectedText;
  String? selectedId;
  String sourceUrl;
  Map<String, dynamic>? sourceData;
  Function handleClick;
  UgtDropdownFetchWidget({
    Key? key,
    required this.title,
    this.selectedId,
    this.selectedText,
    required this.sourceUrl,
    this.sourceData,
    required this.handleClick,
  }) : super(key: key);

  @override
  _UgtDropdownFetchWidgetState createState() => _UgtDropdownFetchWidgetState();
}

class _UgtDropdownFetchWidgetState extends State<UgtDropdownFetchWidget> {

  final GlobalKey<PopupMenuButtonState<int>> _key = GlobalKey();
  List<PopupMenuEntry<DbEntity>>? _itemBuilder;
  bool _isLoading = false;
  String? _selectedTitle;

  @override
  void initState() {
    super.initState();
    _selectedTitle = widget.selectedText ?? "Seçilmedi";
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ListTile(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: Colors.grey.withOpacity(0.1),
          onTap: (){
            print("tapping");
            //_key.currentState!.showButtonMenu();
          },
          title: Text(
            widget.title,
            style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14, fontWeight: FontWeight.w300),
          ),
          subtitle: Text(
            "$_selectedTitle",
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.black.withOpacity(0.95),
              fontSize: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          trailing: _isLoading
              ? CircularProgressIndicator()
              : PopupMenuButton(
                key: _key,
                  icon: Icon(Icons.arrow_drop_down),
                  onSelected: (DbEntity item) {
                    if (!mounted) return;
                    setState(() {
                      _selectedTitle = item.name;
                    });
                    widget.handleClick(item);
                  },
                  itemBuilder: (context) => _itemBuilder!,
                ),
        ),
      ),
    );
  }

  Future<void> _loadData() async {
    if (!mounted) return;
    setState(() {
      _isLoading = true;
    });
    var data = await WUtils.loadDropdownItems(url: widget.sourceUrl, data: widget.sourceData);
    if (!mounted) return;
    setState(() {
      _itemBuilder = data;
      _isLoading = false;
    });
  }
}
