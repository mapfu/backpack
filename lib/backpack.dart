library backpack;

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'dart:io';

const white = Colors.white;
const wwhite = Colors.white;
const black = Colors.black;
const bblack = Colors.black;
const purple = Colors.purple;
const ppurple = Colors.purple;
const green = Colors.green;
const ggreen = Colors.green;
const red = Colors.red;
const rred = Colors.red;
const blue = Colors.blue;
const bblue = Colors.blue;
const yellow = Colors.yellow;
const yyellow = Colors.yellow;
const grey = Colors.grey;
const ggrey = Colors.grey;
const trans = Colors.transparent;
const ttrans = Colors.transparent;

const maaCenter = MainAxisAlignment.center;
const maaStart = MainAxisAlignment.start;
const maaEnd = MainAxisAlignment.end;
const maaSpaceAround = MainAxisAlignment.spaceAround;
const maaSpaceEvenly = MainAxisAlignment.spaceEvenly;
const maaSpaceBetween = MainAxisAlignment.spaceBetween;

void ll(dynamic what) {
  final logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(
      noBoxingByDefault: true,
      colors: true,
      methodCount: 0,
      printEmojis: false,
    ),
  );

  logger.d(what);
}

void ll1() {
  ll('1-----------------------');
}

void ll2() {
  ll('2-----------------------');
}

// timer
Timer timerNow(
  Duration duration,
  void Function(Timer timer) callback, {
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }
  return timer;
}

Future wait(Duration dur) async {
  await Future.delayed(dur);
}

extension FileStuff on File {
  String name() {
    return path.split("/").last;
  }
}

extension IterableSC<T> on Iterable<T> {
  T pickOne([Random? random]) {
    var list = toList();
    list.shuffle(random);
    return list.first;
  }

  T testx() {
    var list = toList();
    return list.first;
  }
}

extension StringStuff on String {
  toColor() {
    var hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
  }
}

extension DateTimeExtension on DateTime {
  TimeOfDay toTimeOfDay() {
    return TimeOfDay(hour: hour, minute: minute);
  }
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDateTime() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day, hour, minute);
  }
}

// Col --------------------------------------------------------------------
// class Col extends StatelessWidget {
//   MainAxisAlignment maa;
//   CrossAxisAlignment caa;
//   final List[Widget?] children;
//
//   const Col({
//     Key? key,
//     this.maa = MainAxisAlignment.start,
//     this.caa = CrossAxisAlignment.center,
//
//
//
//     this.children,
//   }) : super(key: key)
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: maa,
//       crossAxisAlignment: caa,
//     );
//   }
// }

// Con --------------------------------------------------------------------
class Con extends StatelessWidget {
  final Color? color;

  final double? ptop;
  final double? pbottom;
  final double? pleft;
  final double? pright;
  final double? pall;

  final double? mtop;
  final double? mright;
  final double? mbottom;
  final double? mleft;
  final double? mall;

  final double? width;
  final double? height;
  final double? box;

  final bool rounded;
  final double rtopleft;
  final double rtopright;
  final double rbottomleft;
  final double rbottomright;

  final bool border;
  final double bwidth;
  final bool btop;
  final bool bright;
  final bool bleft;
  final bool bbottom;
  final Color borderColor;

  final bool visible;
  final bool shadow;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureTapCallback? onLongPress;
  final Widget? child;

  const Con({
    Key? key,
    this.color,
    this.ptop,
    this.pright,
    this.pbottom,
    this.pleft,
    this.pall,
    this.mtop,
    this.mright,
    this.mbottom,
    this.mleft,
    this.mall,
    this.width,
    this.height,
    this.box,
    this.rounded = false,
    this.rtopleft = 5,
    this.rtopright = 5,
    this.rbottomleft = 5,
    this.rbottomright = 5,
    this.border = false,
    this.bwidth = 1,
    this.btop = true,
    this.bright = true,
    this.bleft = true,
    this.bbottom = true,
    this.borderColor = white,
    this.visible = true,
    this.shadow = false,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    // hide
    if (!visible) return Container();

    // padding
    EdgeInsets? pad;
    if (pall != null) {
      pad = EdgeInsets.all(pall!);
    } else if (ptop != null ||
        pbottom != null ||
        pleft != null ||
        pright != null) {
      pad = EdgeInsets.only(
        top: ptop ?? 0,
        bottom: pbottom ?? 0,
        left: pleft ?? 0,
        right: pright ?? 0,
      );
    }

    // margin
    EdgeInsets? marg;
    if (mall != null) {
      marg = EdgeInsets.all(mall!);
    } else if (mtop != null ||
        mbottom != null ||
        mleft != null ||
        mright != null) {
      marg = EdgeInsets.only(
        top: mtop ?? 0,
        bottom: mbottom ?? 0,
        left: mleft ?? 0,
        right: mright ?? 0,
      );
    }

    // rounded
    BorderRadius? decRounded;
    if (rounded) {
      decRounded = BorderRadius.only(
        topLeft: Radius.circular(rtopleft),
        topRight: Radius.circular(rtopright),
        bottomLeft: Radius.circular(rbottomleft),
        bottomRight: Radius.circular(rbottomright),
      );
    }

    // border
    Border? decBorder;
    if (border) {
      decBorder = Border(
        top: btop
            ? BorderSide(width: bwidth, color: borderColor)
            : const BorderSide(),
        bottom: bbottom
            ? BorderSide(width: bwidth, color: borderColor)
            : const BorderSide(),
        left: bleft
            ? BorderSide(width: bwidth, color: borderColor)
            : const BorderSide(),
        right: bright
            ? BorderSide(width: bwidth, color: borderColor)
            : const BorderSide(),
      );
    }

    // shadow
    List<BoxShadow>? decShadow;
    if (shadow) {
      decShadow = [
        const BoxShadow(
          //offset: const Offset(3.0, 3.0),
          blurRadius: 5.0,
          spreadRadius: 0.0,
          color: Colors.black12,
        )
      ];
    }

    // decoration
    BoxDecoration dec = BoxDecoration(
      color: color,
      borderRadius: decRounded,
      border: decBorder,
      boxShadow: decShadow,
    );
    // if (rounded) {
    //   dec.borderRadius = BorderRadius.only(
    // topLeft: Radius.circular(rounded ? rtopleft : 0),
    // topRight: Radius.circular(rounded ? rtopright : 0),
    // bottomLeft: Radius.circular(rounded ? rbottomleft : 0),
    // bottomRight: Radius.circular(rounded ? rbottomright : 0),
    // );
    // }
    //
    //
    // if (rounded || shadow || border) {
    // dec = BoxDecoration(
    // color: color,
    // borderRadius: BorderRadius.only(
    // topLeft: Radius.circular(rounded ? rtopleft : 0),
    // topRight: Radius.circular(rounded ? rtopright : 0),
    // bottomLeft: Radius.circular(rounded ? rbottomleft : 0),
    // bottomRight: Radius.circular(rounded ? rbottomright : 0),
    // ),
    // border: border
    // ? Border(
    // top: BorderSide(width: bwidth, color: btop ? borderColor : trans),
    // bottom: BorderSide(width: bwidth, color: bbottom ? borderColor : trans),
    // left: BorderSide(width: bwidth, color: bleft ? borderColor : trans),
    // right: BorderSide(width: bwidth, color: bright ? borderColor : trans),
    // )
    //     : null,
    // //border: border ? Border.all(color: borderColor ?? white) : null,
    //
    // boxShadow: [
    // if (shadow)
    // const BoxShadow(
    // //offset: const Offset(3.0, 3.0),
    // blurRadius: 5.0,
    // spreadRadius: 0.0,
    // color: Colors.black12,
    // ),
    // ],
    // );
    // }

    Widget returnWidget = Container(
      padding: pad,
      margin: marg,
      height: box ?? height,
      width: box ?? width,
      //color: (rounded || shadow || border) ? null : color,
      decoration: dec,
      child: child,
    );

    if (onTap != null || onDoubleTap != null || onLongPress != null) {
      returnWidget = GestureDetector(
        child: returnWidget,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
      );
    }

    return returnWidget;
  }
}

// Pad --------------------------------------------------------------------
class Pad extends StatelessWidget {
  final double? ptop;
  final double? pright;
  final double? pbottom;
  final double? pleft;
  final double? pall;
  final double? mtop;
  final double? mright;
  final double? mbottom;
  final double? mleft;
  final double? mall;
  final Widget? child;

  const Pad({
    Key? key,
    this.ptop,
    this.pright,
    this.pbottom,
    this.pleft,
    this.pall,
    this.mtop,
    this.mright,
    this.mbottom,
    this.mleft,
    this.mall,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == null) return Container();

    // padding
    EdgeInsets? pad;
    if (pall != null) {
      pad = EdgeInsets.all(pall!);
    } else if (ptop != null ||
        pbottom != null ||
        pleft != null ||
        pright != null) {
      pad = EdgeInsets.only(
        top: ptop ?? 0,
        bottom: pbottom ?? 0,
        left: pleft ?? 0,
        right: pright ?? 0,
      );
    }

    // margin
    EdgeInsets? marg;
    if (mall != null) {
      marg = EdgeInsets.all(mall!);
    } else if (mtop != null ||
        mbottom != null ||
        mleft != null ||
        mright != null) {
      marg = EdgeInsets.only(
        top: mtop ?? 0,
        bottom: mbottom ?? 0,
        left: mleft ?? 0,
        right: mright ?? 0,
      );
    }

    if (pad == null && marg == null) return child!;

    if (pad != null && marg == null) {
      return Padding(
        padding: pad,
        child: child,
      );
    }

    if (marg != null) {
      return Container(
        padding: pad,
        margin: marg,
        child: child,
      );
    }

    return child!;
  }
}

// Tex --------------------------------------------------------------------
class Tex extends StatelessWidget {
  final String text;
  final double? size;
  final String? fontFamily;
  final Color? color;
  final Color? backgroundColor;
  final double? ptop;
  final double? pright;
  final double? pbottom;
  final double? pleft;
  final double? pall;
  final bool bold;
  final int? maxLines;
  final double? textScaleFactor;
  final TextOverflow? overflow;
  final bool italics;
  final double? width;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onDoubleTap;
  final GestureTapCallback? onLongPress;

  const Tex(
    this.text, {
    Key? key,
    this.size,
    this.fontFamily,
    this.color,
    this.backgroundColor,
    this.ptop,
    this.pright,
    this.pbottom,
    this.pleft,
    this.pall,
    this.bold = false,
    this.italics = false,
    this.width,
    this.maxLines,
    this.textScaleFactor,
    this.overflow,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget retWidget;

    var style = const TextStyle();
    if (size != null || color != null || bold) {
      style = TextStyle(
        fontSize: size,
        fontFamily: fontFamily,
        color: color,
        backgroundColor: backgroundColor,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontStyle: italics ? FontStyle.italic : FontStyle.normal,
      );
    }

    retWidget = Text(
      text,
      maxLines: maxLines,
      textScaleFactor: textScaleFactor,
      overflow: overflow,
      style: style,
    );

    // padding
    EdgeInsets? pad;
    if (pall != null) {
      pad = EdgeInsets.all(pall!);
    } else if (ptop != null ||
        pbottom != null ||
        pleft != null ||
        pright != null) {
      pad = EdgeInsets.only(
        top: ptop ?? 0,
        bottom: pbottom ?? 0,
        left: pleft ?? 0,
        right: pright ?? 0,
      );
    }

    if (width != null) {
      retWidget = Container(
        width: width,
        padding: pad,
        child: retWidget,
      );
    } else if (pad != null) {
      retWidget = Padding(
        padding: pad,
        child: retWidget,
      );
    }

    if (onTap != null || onDoubleTap != null || onLongPress != null) {
      retWidget = GestureDetector(
        child: retWidget,
        onTap: onTap,
        onDoubleTap: onDoubleTap,
        onLongPress: onLongPress,
      );
    }

    return retWidget;
  }
}
