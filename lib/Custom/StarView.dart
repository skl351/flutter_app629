import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarView extends CustomPainter {
  Paint mHelpPaint;
  BuildContext context;

  StarView(this.context) {
    mHelpPaint = new Paint();
    mHelpPaint.style=PaintingStyle.stroke;
    mHelpPaint.color=Color(0xffBBC3C5);
    mHelpPaint.isAntiAlias=true;
  }



  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    canvas.drawPath(gridPath(20, winSize), mHelpPaint);
    drawCoo(canvas,size, winSize);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  /**
   * 绘制网格路径
   *
   * @param step    小正方形边长
   * @param winSize 屏幕尺寸
   */
  Path gridPath(int step, Size winSize) {
    Path path = new Path();

    for (int i = 0; i < winSize.height / step + 1; i++) {
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    for (int i = 0; i < winSize.width / step + 1; i++) {
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }
//绘制坐标系
  drawCoo(Canvas canvas, Size coo, Size winSize) {
    //初始化网格画笔
    Paint paint = new Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    //绘制直线
    canvas.drawPath(cooPath(coo, winSize), paint);
    //左箭头
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height + 6), paint);
    //下箭头
    canvas.drawLine(new Offset(coo.width, winSize.height-90),
        new Offset(coo.width - 6, winSize.height - 10-90), paint);
    canvas.drawLine(new Offset(coo.width, winSize.height-90),
        new Offset(coo.width + 6, winSize.height - 10-90), paint);
  }
  /**
   * 坐标系路径
   *
   * @param coo     坐标点
   * @param winSize 屏幕尺寸
   * @return 坐标系路径
   */
  Path cooPath(Size coo, Size winSize) {
    Path path = new Path();
    //x正半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(winSize.width, coo.height);
    //x负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width - winSize.width, coo.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, coo.height - winSize.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, winSize.height);
    return path;
  }

}
