package com.ly.pojo;

public class ItemBean {
    private Figure figure;
    private int quantity;

    public ItemBean(Figure figure, int quantity) {
        this.figure = figure;
        this.quantity = quantity;
    }

    public Figure getFigure() {
        return figure;
    }

    public void setFigure(Figure figure) {
        this.figure = figure;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
