import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String)? onChanged;

  const SearchBarWidget({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              cursorColor: Colors.black,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
              decoration: InputDecoration(
                hintText: 'What do you want to read today?',
                hintStyle: TextStyle(
                  color: Colors.black.withValues(alpha: 0.7),
                  fontStyle: FontStyle.italic,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                contentPadding: EdgeInsets.only(bottom: 4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
