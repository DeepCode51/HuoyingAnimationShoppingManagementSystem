package com.ly.service.HyrzIntroduce;

import com.ly.dao.HyrzIntroduce.HyrzIntroduceMapper;
import com.ly.pojo.HyrzIntroduce;
import org.springframework.beans.factory.annotation.Autowired;

public class HyrzIntroduceServiceImpl implements HyrzIntroduceService{
    @Autowired
    private HyrzIntroduceMapper hyrzIntroduceMapper;

    public void setHyrzIntroduceMapper(HyrzIntroduceMapper hyrzIntroduceMapper) {
        this.hyrzIntroduceMapper = hyrzIntroduceMapper;
    }

    @Override
    public HyrzIntroduce selectHyrzIntroduce() {
        return hyrzIntroduceMapper.selectHyrzIntroduce();
    }

    @Override
    public int updateIntroduce(HyrzIntroduce hyrzIntroduce) {
        return hyrzIntroduceMapper.updateIntroduce(hyrzIntroduce);
    }

    @Override
    public HyrzIntroduce queryIntroduceById(int id) {
        return hyrzIntroduceMapper.queryIntroduceById(id);
    }

    @Override
    public HyrzIntroduce Selectxuanwomingren() {
        return hyrzIntroduceMapper.Selectxuanwomingren();
    }

    @Override
    public HyrzIntroduce Selectzhuzhu() {
        return hyrzIntroduceMapper.Selectzhuzhu();
    }
}
