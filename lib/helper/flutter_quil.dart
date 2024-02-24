import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';


class MyRichTextField extends StatelessWidget {
  final double? height;
  const MyRichTextField({super.key, required this.controller,required this.height});
  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border:  Border.all(
          color: Color(0xFF545454),
          width: 2.0,
        ),
      ),
      child: Column(
        children: [
          QuillToolbar(
            child: Container(
              color: Colors.black87,

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // alignment: WrapAlignment.center,
                  children: [
                    QuillToolbarLinkStyleButton(controller: controller),
                    QuillToolbarToggleStyleButton(


                      options:  QuillToolbarToggleStyleButtonOptions(
                        // fillColor: Colors.red,
                        //
                        // iconTheme: QuillIconTheme(
                        //   iconButtonSelectedData: IconButtonData(color: Colors.white,focusColor: Colors.red,highlightColor: Colors.red),
                        //
                        //
                        //   iconButtonSelectedStyle: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white)),
                        //
                        //     iconButtonUnselectedStyle: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white))),
                      ),
                      controller: controller,
                      attribute: Attribute.bold,
                    ),
                    QuillToolbarToggleStyleButton(

                      options: const QuillToolbarToggleStyleButtonOptions(),
                      controller: controller,
                      attribute: Attribute.italic,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.underline,
                    ),
                    QuillToolbarColorButton(
                      // options: QuillToolbarColorButtonOptions(
                      //   iconTheme: QuillIconTheme(
                      //       iconButtonSelectedStyle: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white)),
                      //
                      //       iconButtonUnselectedStyle: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white))),
                      // ),
                      controller: controller,
                      isBackground: false,
                    ),
                    QuillToolbarColorButton(
                      controller: controller,
                      isBackground: true,
                    ),
                    QuillToolbarToggleCheckListButton(
                      controller: controller,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.ol,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.ul,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.inlineCode,
                    ),
                    QuillToolbarToggleStyleButton(
                      controller: controller,
                      attribute: Attribute.blockQuote,
                    ),
                    QuillToolbarIndentButton(
                      controller: controller,
                      isIncrease: true,
                    ),
                    QuillToolbarIndentButton(
                      controller: controller,
                      isIncrease: false,
                    ),
                    const VerticalDivider(),
                  ],
                ),
              ),
            ),
          ),
          Divider(color:Colors.black.withOpacity(0.5)),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: QuillEditor.basic(
                configurations: QuillEditorConfigurations(
                  controller: controller,
                  readOnly: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('de'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}