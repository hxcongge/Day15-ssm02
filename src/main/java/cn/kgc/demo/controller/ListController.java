package cn.kgc.demo.controller;


import cn.kgc.demo.pojo.ReplyDetail;
import cn.kgc.demo.service.DemoService;
import cn.kgc.demo.utils.Constants;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;

@Controller
@RequestMapping("invitation")
public class ListController {

    @Autowired
    private DemoService demoService;

    @RequestMapping("list")
    public String list(@RequestParam(required = false) String searchName,
                       Model model,
                       @RequestParam(defaultValue = "1") Integer pageNum){
       //分页查询
       PageInfo pageInfo= demoService.findInvitationByPage(searchName,pageNum,Constants.PAGE_SIZE);

       model.addAttribute("pageInfo",pageInfo);
       //回显搜索框的查询条件
       model.addAttribute("searchName",searchName);
       return "list";
    }

    //根据帖子id查看回复信息列表
    @RequestMapping("reply/{invId}")
    public String replyDetail(@PathVariable("invId") Integer invId,
                              Model model,
                              @RequestParam(defaultValue = "1") Integer pageNum){
        //根据帖子id查询回复信息列表
        PageInfo pageInfo = demoService.findReplyDetailByInvId(invId,pageNum,Constants.PAGE_SIZE);
        model.addAttribute("pageInfo",pageInfo);
        //回显invId
        model.addAttribute("invId",invId);
        System.out.println(invId);
        return "replyDetail";
    }

    //携带帖子ID跳转到添加页面
    @RequestMapping("addUI/{invId}")
    public String addUI(@PathVariable("invId") Integer invId,Model model){
        System.out.println(invId);
        model.addAttribute("invId",invId);
        return "addReply";
    }

    //从replyDetail.jsp上获取数据进行添加
    //添加完成后需要帖子Id回到帖子的回复信息列表
    @RequestMapping("add/{invId}")
    public String add(@PathVariable("invId") Integer invId,
                      Model model,
                      ReplyDetail replyDetail){
        //设置日期
        replyDetail.setCreatedate(new Date());
        //设置帖子ID用来回到回复信息列表
        replyDetail.setInvid(invId);
        boolean b = demoService.saveReplyDetail(replyDetail);
        if (b){
            model.addAttribute("saveMsg","添加成功！");
        }else {
            model.addAttribute("saveMsg","添加失败！");
        }
        return "forward:/invitation/reply/"+ invId;
    }

    @RequestMapping("del/{invId}")
    public String delInvitationAndReplyDetail(@PathVariable("invId")Integer invId,Model model){
       boolean b = demoService.removeInvitationAndReplyDetailByID(invId);
       if (b){
           model.addAttribute("delMsg","删除成功！");
       }else {
           model.addAttribute("delMsg","删除失败！");
       }
       return "forward:/invitation/list";
    }
}
