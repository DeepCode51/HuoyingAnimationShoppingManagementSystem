package com.ly.service.Index;

import com.ly.dao.Index.IndexMapper;
import com.ly.pojo.HyrzResource;
import com.ly.pojo.Music;
import com.ly.pojo.Renzhe;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class IndexServiceImpl implements IndexService{
    @Autowired
    private IndexMapper indexMapper;

    public void setIndexMapper(IndexMapper indexMapper) {
        this.indexMapper = indexMapper;
    }

    @Override
    public List<Renzhe> lidaihuoying() {
        return indexMapper.lidaihuoying();
    }

    @Override
    public List<Music> selectED() {
        return indexMapper.selectED();
    }

    @Override
    public List<HyrzResource> allResource() {
        return indexMapper.allResource();
    }
}
