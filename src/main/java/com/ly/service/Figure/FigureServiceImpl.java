package com.ly.service.Figure;

import com.ly.dao.Figure.FigureMapper;
import com.ly.pojo.Figure;
import com.ly.pojo.FigureBelong;
import com.ly.pojo.Order;
import com.ly.pojo.ReportForms;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class FigureServiceImpl implements FigureService{
    @Autowired
    private FigureMapper figureMapper;

    public void setFigureMapper(FigureMapper figureMapper) {
        this.figureMapper = figureMapper;
    }

    @Override
    public int addrenzheFigure(Figure figure) {
        return figureMapper.addrenzheFigure(figure);
    }

    @Override
    public List<Figure> allrenzheFigure() {
        return figureMapper.allrenzheFigure();
    }

    @Override
    public List<Figure> SalesSort() {
        return figureMapper.SalesSort();
    }

    @Override
    public List<Figure> xiaozuzhiFigure() {
        return figureMapper.xiaozuzhiFigure();
    }

    @Override
    public List<Figure> lidaihuoyingFigure() {
        return figureMapper.lidaihuoyingFigure();
    }

    @Override
    public List<Figure> rendaoqirenFigure() {
        return figureMapper.rendaoqirenFigure();
    }

    @Override
    public List<Figure> bamendunjiaFigure() {
        return figureMapper.bamendunjiaFigure();
    }

    @Override
    public int deleterenzheFigureById(int id) {
        return figureMapper.deleterenzheFigureById(id);
    }

    @Override
    public int updaterenzheFigure(Figure figure) {
        return figureMapper.updaterenzheFigure(figure);
    }

    @Override
    public Figure queryrenzheFigureById(int id) {
        return figureMapper.queryrenzheFigureById(id);
    }

    @Override
    public int addFigureSales(int figureId, int figureSales) {
        return figureMapper.addFigureSales(figureId,figureSales);
    }

    @Override
    public List<FigureBelong> allFigureBelong() {
        return figureMapper.allFigureBelong();
    }

    @Override
    public int addFigureBelong(FigureBelong figureBelong) {
        return figureMapper.addFigureBelong(figureBelong);
    }

    @Override
    public FigureBelong queryFigureBelongById(int id) {
        return figureMapper.queryFigureBelongById(id);
    }

    @Override
    public int updateFigureBelong(FigureBelong figureBelong) {
        return figureMapper.updateFigureBelong(figureBelong);
    }

    @Override
    public int deleteFigureBelongById(int id) {
        return figureMapper.deleteFigureBelongById(id);
    }

    @Override
    public List<Order> toAdminShowFigureReportFormsToday(Date days) {
        return figureMapper.toAdminShowFigureReportFormsToday(days);
    }

    @Override
    public List<Order> toAdminShowFigureReportFormsDays(Date days) {
        return figureMapper.toAdminShowFigureReportFormsDays(days);
    }
}
