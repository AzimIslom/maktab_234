import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/generate_model.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/format.dart';
import '../../../../utils/styles.dart';
import '../inner/add_teacher/add_teacher_vm.dart';

class TokenItem extends StatelessWidget {
  final GenerateModel token;

  const TokenItem({
    Key? key,
    required this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AddTeacherVM>(
      builder: (context, AddTeacherVM vm, _) {
        return Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 5,
            bottom: 15,
          ),
          decoration: BoxDecoration(
            color: c.c2,
            border: Border.all(
              color: c.c3,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SelectableText(
                        token.code,
                        style: s.t(
                          color: c.c3,
                          size: 16,
                          weight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          FlutterClipboard.copy(token.code);
                        },
                        icon: Icon(
                          Icons.copy,
                          color: c.c3,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        format.formatDate(token.time),
                        style: s.t(
                          color: c.c3,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        ' - ',
                        style: s.t(
                          color: c.c3,
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        format.formatTime(token.time),
                        style: s.t(
                          color: c.c3,
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  vm.deleteToken(token);
                },
                icon: Icon(
                  CupertinoIcons.delete,
                  color: c.c8,
                  size: 27,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
