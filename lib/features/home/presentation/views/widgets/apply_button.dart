import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../constant.dart';
import '../../../../../core/utils/text_styles.dart';

class ApplyWidget extends StatefulWidget {
  final int count;
  final int index;

  const ApplyWidget({
    super.key,
    required this.count,
    required this.index,
  });

  @override
  State<ApplyWidget> createState() => _ApplyWidgetState();
}

class _ApplyWidgetState extends State<ApplyWidget> {
  late List<Color> colors;
  Color textColor = Constant.primaryColor;
  String text = 'Apply';

  @override
  void initState() {
    super.initState();

    colors = List.generate(widget.count, (index) {
      return Constant.circleAvatar;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(105, 20),
        backgroundColor: colors[widget.index],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: () async {
        if (text == 'apply') {
          final player = AudioPlayer();
          player.setAsset('assets/audio/apply.mp3');
          await player.play();
          setState(() {
            colors[widget.index] = Constant.primaryColor;
            textColor = Constant.scaffoldColor;
            text = 'Applied';
          });
        } else {
          final player = AudioPlayer();
          player.setAsset('assets/audio/apply.mp3');
          await player.play();
          setState(() {
            colors[widget.index] = Constant.circleAvatar;
            textColor = Constant.primaryColor;
            text = 'Apply';
          });
        }
      },
      child: Center(
        child: Text(
          text,
          style: CustomTextStyles.style14Light.copyWith(
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
