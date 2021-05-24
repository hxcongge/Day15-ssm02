package cn.kgc.demo.dao;

import cn.kgc.demo.pojo.ReplyDetail;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

public interface ReplyDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReplyDetail record);

    int insertSelective(ReplyDetail record);

    ReplyDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReplyDetail record);

    int updateByPrimaryKey(ReplyDetail record);

    List<ReplyDetail> selReplyDetailByInvId(@Param("invId") Integer invId);

    int delReplyDetailByInvitationId(@Param("invId") Integer invId);
}