package com.ly.service.HyrzResource;

import com.ly.dao.HyrzIntroduce.HyrzIntroduceMapper;
import com.ly.dao.HyrzResource.HyrzResourceMapper;
import com.ly.pojo.HyrzResource;
import com.ly.pojo.HyrzResourceApply;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class HyrzResourceServiceImpl implements HyrzResourceService {
    @Autowired
    private HyrzResourceMapper hyrzResourceMapper;

    public void setHyrzResourceMapper(HyrzResourceMapper hyrzResourceMapper) {
        this.hyrzResourceMapper = hyrzResourceMapper;
    }

    @Override
    public int addResource(HyrzResource hyrzResource) {
        return hyrzResourceMapper.addResource(hyrzResource);
    }

    @Override
    public List<HyrzResource> allResource() {
        return hyrzResourceMapper.allResource();
    }

    @Override
    public int deleteResourceById(int id) {
        return hyrzResourceMapper.deleteResourceById(id);
    }

    @Override
    public int updateResource(HyrzResource hyrzResource) {
        return hyrzResourceMapper.updateResource(hyrzResource);
    }

    @Override
    public HyrzResource queryResourceById(int id) {
        return hyrzResourceMapper.queryResourceById(id);
    }

    @Override
    public int UserApplyAddResource(HyrzResourceApply hyrzResourceApply) {
        return hyrzResourceMapper.UserApplyAddResource(hyrzResourceApply);
    }

    @Override
    public List<HyrzResourceApply> AdminShowAllResourceApply() {
        return hyrzResourceMapper.AdminShowAllResourceApply();
    }

    @Override
    public HyrzResourceApply queryApplyResourceById(int resourceApplyAddID) {
        return hyrzResourceMapper.queryApplyResourceById(resourceApplyAddID);
    }

    @Override
    public int AdminPassApplyResource(HyrzResource hyrzResource) {
        return hyrzResourceMapper.AdminPassApplyResource(hyrzResource);
    }

    @Override
    public int AdminUpdateApplyResource(int resourceApplyAddID) {
        return hyrzResourceMapper.AdminUpdateApplyResource(resourceApplyAddID);
    }

    @Override
    public int AdminReduceApplyResource(int resourceApplyAddID) {
        return hyrzResourceMapper.AdminReduceApplyResource(resourceApplyAddID);
    }

    @Override
    public List<HyrzResourceApply> UserQueryApplyResourceByUserid(int userid) {
        return hyrzResourceMapper.UserQueryApplyResourceByUserid(userid);
    }


}
