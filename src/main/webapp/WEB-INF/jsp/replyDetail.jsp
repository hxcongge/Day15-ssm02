<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Cong
  Date: 2021/4/27
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>回复信息列表</title>
        <!--引入bookstrap的css-->
        <link rel="stylesheet"  href="/statics/css/bootstrap.css"/>
        <!--引入jQuery-->
        <script src="/statics/js/jquery-1.12.4.js"></script>
        <!--引入bookstrap的js-->
        <script src="/statics/js/bootstrap.js"></script>
        <%--引入bootstrap的分页插件--%>
        <script src="/statics/js/bootstrap-paginator.js"></script>
    </head>
    <body>
        <div class="container">
            <!--标题-->
            <div class="row">
                <div class="col-md-4 col-md-offset-5">
                    <h3>回复信息列表</h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-md-offset-8">
                    <a href="/invitation/addUI/${invId}">添加回复</a>
                    <a href="/invitation/list">返回帖子列表</a>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>回复内容</th>
                                <th>回复昵称</th>
                                <th>发布时间</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pageInfo.list}" var="replyDetail">
                                <tr>
                                    <td>${replyDetail.content}</td>
                                    <td>${replyDetail.author}</td>
                                    <td>${replyDetail.createdate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <!--分页组件-->
                    <ul id="page"></ul>
                </div>
            </div>
        </div>
        <script>
            /*jquery的入口函数*/
            $(function() {
                //获取当前页
                var currentPage = ${pageInfo.pageNum};
                //获取总页数
                var totalPages = ${pageInfo.pages};
                $("#page").bootstrapPaginator({
                    bootstrapMajorVersion:3, //对应的bootstrap版本
                    currentPage: currentPage, //当前页数
                    numberOfPages: 10, //每次显示页数
                    totalPages:totalPages, //总页数
                    useBootstrapTooltip:false,
                    itemTexts : function(type, page, current) {//设置分页按钮显示字体样式
                        switch (type) {
                            case "first":
                                return "首页";
                            case "prev":
                                return "上一页";
                            case "next":
                                return "下一页";
                            case "last":
                                return "末页";
                            case "page":
                                return page;
                        }
                    },
                    //点击事件
                    onPageClicked: function (event, originalEvent, type, page) {
                        //在浏览器控制台上输入page
                        console.log(page);
                        // 业务处理
                        //page: 表示当前页码
                        window.location.href = "/invitation/reply/" + ${invId} +"?pageNum="+page;
                    }
                });
            });
            //提示是否添加成功
            if(${saveMsg != null and saveMsg != ''}){
                alert("${saveMsg}");
            }
        </script>
    </body>
</html>
