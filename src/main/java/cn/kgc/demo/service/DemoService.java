package cn.kgc.demo.service;

import cn.kgc.demo.pojo.ReplyDetail;
import com.github.pagehelper.PageInfo;

public interface DemoService {
    //根据搜索条件分页查询
    PageInfo findInvitationByPage(String searchName, Integer pageNum, Integer pageSize);

    //根据帖子id分页查看回复列表
    PageInfo findReplyDetailByInvId(Integer invId, Integer pageNum, Integer pageSize);

    boolean saveReplyDetail(ReplyDetail replyDetail);

    boolean removeInvitationAndReplyDetailByID(Integer invId);
}
