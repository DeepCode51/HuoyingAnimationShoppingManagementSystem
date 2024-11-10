package com.ly.service.RenZhe;

import com.ly.dao.RenZhe.RenZheMapper;
import com.ly.pojo.Renzhe;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class RenZheServiceImpl implements RenZheService{
    @Autowired
    private RenZheMapper renZheMapper;

    public void setRenZheMapper(RenZheMapper renZheMapper) {
        this.renZheMapper = renZheMapper;
    }

    @Override
    public int addrenzhe(Renzhe renzhe) {
        return renZheMapper.addrenzhe(renzhe);
    }

    @Override
    public List<Renzhe> allrenzhe() {
        return renZheMapper.allrenzhe();
    }

    @Override
    public List<Renzhe> xiaozuzhi() {
        return renZheMapper.xiaozuzhi();
    }

    @Override
    public List<Renzhe> lidaihuoying() {
        return renZheMapper.lidaihuoying();
    }

    @Override
    public List<Renzhe> rendaoqiren() {
        return renZheMapper.rendaoqiren();
    }

    @Override
    public List<Renzhe> bamendunjia() {
        return renZheMapper.bamendunjia();
    }

    @Override
    public int deleterenzheById(int id) {
        return renZheMapper.deleterenzheById(id);
    }

    @Override
    public int updaterenzhe(Renzhe renzhe) {
        return renZheMapper.updaterenzhe(renzhe);
    }

    @Override
    public Renzhe queryrenzheById(int id) {
        return renZheMapper.queryrenzheById(id);
    }
}
