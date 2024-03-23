import 'package:chef_buddy/constants/colors.dart';
import 'package:flutter/material.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSend, onClickCamera;

  const ChatInputBox({
    super.key,
    this.controller,
    this.onSend,
    this.onClickCamera,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextField(
        controller: controller,
        maxLines: null,
        cursorColor: kPrimaryColor,
        onTapOutside: (focusNode) {
          FocusScope.of(context).unfocus();
        },
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
          filled: true,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            borderSide: BorderSide(
              color: kPrimaryColor,
              width: 2,
            ),
          ),
          fillColor: Colors.white,
          hintText: "Type your message...",
          hintStyle: const TextStyle(
            color: Color(0xFF8A8A8C),
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              onClickCamera == null
                  ? const SizedBox(
                      width: 26,
                    )
                  : IconButton(
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: kPrimaryColor,
                        size: 26,
                      ),
                      onPressed: onClickCamera,
                    ),
              IconButton(
                icon: const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.near_me_rounded,
                    color: kPrimaryColor,
                    size: 26,
                  ),
                ),
                onPressed: onSend,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
