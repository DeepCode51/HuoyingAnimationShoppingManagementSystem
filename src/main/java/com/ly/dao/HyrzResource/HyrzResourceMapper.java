package com.ly.dao.HyrzResource;

import com.ly.pojo.HyrzResource;
import com.ly.pojo.HyrzResourceApply;
import com.ly.pojo.Renzhe;

import java.util.List;

public interface HyrzResourceMapper {
    //新增资源
    int addResource(HyrzResource hyrzResource);
    //查询所有资源
    List<HyrzResource> allResource();
    //根据当前选中的资源id删除资源
    int deleteResourceById(int id);
    //更新资源
    int updateResource(HyrzResource hyrzResource);
    //更新时点击该资源的修改，根据该资源的id去查找信息，将信息赋值给model或session，通过存储的数据输出
    HyrzResource queryResourceById(int id);
    //用户上传自己的资源（经过管理员审核后，方可加入资源列表中）
    int UserApplyAddResource(HyrzResourceApply hyrzResourceApply);
    //管理员进去资源审核界面，将用户的所有资源上传信息列出来
    List<HyrzResourceApply> AdminShowAllResourceApply();
    //根据用户上传资源的resourceApplyAddID查询该用户的上传信息
    HyrzResourceApply queryApplyResourceById(int resourceApplyAddID);
    //管理员审核通过用户上传的资源，并加入资源列表
    int AdminPassApplyResource(HyrzResource hyrzResource);
    //管理员审核通过用户上传的资源，并更新用户那边的上传审核状态为“审核通过”
    int AdminUpdateApplyResource(int resourceApplyAddID);
    //管理员拒绝通过用户上传的资源，并更新用户那边的上传审核状态为“审核不通过”
    int AdminReduceApplyResource(int resourceApplyAddID);
    //去往用户查询上传审核进度的界面
    List<HyrzResourceApply> UserQueryApplyResourceByUserid(int userid);
}
