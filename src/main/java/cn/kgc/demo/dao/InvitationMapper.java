package cn.kgc.demo.dao;

import cn.kgc.demo.pojo.Invitation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InvitationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Invitation record);

    int insertSelective(Invitation record);

    Invitation selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Invitation record);

    int updateByPrimaryKey(Invitation record);

    //根据搜索条件模糊查询
    List<Invitation> selInvitationBySearchName(@Param("searchName") String searchName);
}