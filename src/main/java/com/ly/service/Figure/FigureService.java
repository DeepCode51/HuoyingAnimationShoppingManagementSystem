package com.ly.service.Figure;

import com.ly.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface FigureService {
    //新增手办
    int addrenzheFigure(Figure figure);
    //查询所有手办（默认数据库排序）
    List<Figure> allrenzheFigure();
    //查询以销售量排序（降序）
    List<Figure> SalesSort();
    //查询晓组织手办
    List<Figure> xiaozuzhiFigure();
    //查询历代火影手办
    List<Figure> lidaihuoyingFigure();
    //查询所有忍刀七人众成员手办
    List<Figure> rendaoqirenFigure();
    //查询所有会八门遁甲的忍者手办
    List<Figure> bamendunjiaFigure();
    //根据当前选中的忍者id删除忍者手办
    int deleterenzheFigureById(int id);
    //更新忍者手办
    int updaterenzheFigure(Figure figure);
    //更新时点击该忍者的修改，根据该忍者的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    Figure queryrenzheFigureById(int id);
    //商品购买后增加销量
    int addFigureSales(@Param("figureId") int figureId, @Param("figureSales") int figureSales);
    //管理员查询所有手办的分类
    List<FigureBelong> allFigureBelong();
    //管理员新增手办分类
    int addFigureBelong(FigureBelong figureBelong);
    //更新时点击该手办分类的修改，根据该手办分类的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    FigureBelong queryFigureBelongById(int id);
    //管理员更新手办分类信息
    int updateFigureBelong(FigureBelong figureBelong);
    //管理员根据当前选中的手办分类id删除手办分类
    int deleteFigureBelongById(int id);

    //管理员去报表页面，查看“当日”各个手办的销售情况
    List<Order> toAdminShowFigureReportFormsToday(Date days);
    //管理员去报表页面，根据jsp页面传递过来的“jspDays”，即天数，从而各个手办的销售情况
    List<Order> toAdminShowFigureReportFormsDays(Date days);
}
