package cn.kgc.demo.service.impl;

import cn.kgc.demo.dao.InvitationMapper;
import cn.kgc.demo.dao.ReplyDetailMapper;
import cn.kgc.demo.pojo.Invitation;
import cn.kgc.demo.pojo.ReplyDetail;
import cn.kgc.demo.service.DemoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = false)
public class DemoServiceImpl implements DemoService {

    //引入帖子的mapper
    @Autowired
    private InvitationMapper invitationMapper;

    //引入回复信息的mapper
    @Autowired
    private ReplyDetailMapper replyDetailMapper;

    @Override
    public PageInfo findInvitationByPage(String searchName, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //查询数据,根据搜索条件模糊查询
        List<Invitation> invitations = invitationMapper.selInvitationBySearchName(searchName);
        //封装pageInfo
        PageInfo pageInfo = new PageInfo(invitations);
        return pageInfo;
    }
    //根据帖子id分页查看回复列表
    @Override
    public PageInfo findReplyDetailByInvId(Integer invId, Integer pageNum, Integer pageSize) {
        //开启分页查询
        PageHelper.startPage(pageNum,pageSize);
        //查询数据,根据帖子id分页查看回复列表
        List<ReplyDetail> list = replyDetailMapper.selReplyDetailByInvId(invId);
        //封装pageInfo
        PageInfo pageInfo = new PageInfo(list);
        return pageInfo;
    }

    @Override
    public boolean saveReplyDetail(ReplyDetail replyDetail) {
        if(replyDetailMapper.insert(replyDetail)>0){
            return true;
        }
        return false;
    }

    @Override
    public boolean removeInvitationAndReplyDetailByID(Integer invId) {
        try {
            // 根据帖子ID删除该帖子的回复信息
            replyDetailMapper.delReplyDetailByInvitationId(invId);
            //根据帖子ID删除该帖子
            invitationMapper.deleteByPrimaryKey(invId);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
