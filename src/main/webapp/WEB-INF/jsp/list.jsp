<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Cong
  Date: 2021/4/26
  Time: 22:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>帖子列表</title>
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
                    <h3>帖子列表</h3>
                </div>
            </div>
            <!--搜索框-->
            <div class="row">
                <div class="col-md-6 col-md-offset-4">

                    <form action="/invitation/list" method="get" class="form-inline" id="myForm">
                        <%--隐藏域--%>
                        <input type="hidden" name="pageNum" id="pageNum">
                        <div class="form-group">
                            <label for="title" class="control-label">帖子标题</label>
                            <input type="text" name="searchName" id="title" value="${searchName}" class="form-control"/>
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary">搜索</button>
                        </div>
                    </form>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                        <tr>
                            <th>标题</th>
                            <th>内容摘要</th>
                            <th>作者</th>
                            <th>发布时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pageInfo.list}" var="invitation">
                                <tr>
                                    <td>${invitation.title}</td>
                                    <td>${invitation.summary}</td>
                                    <td>${invitation.author}</td>
                                    <td>
                                        <%--格式化日期--%>
                                        <fmt:formatDate value="${invitation.createdate}" pattern="yyyy-MM-dd"/>
                                    </td>
                                    <td>
                                        <a href="javascript:toReplyDetail(${invitation.id})">查看回复</a> ||
                                        <a href="javascript:toDel(${invitation.id})">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%--分页插件--%>
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
                        /*获取pageNum隐藏域，给它赋值 page*/
                        $("#pageNum").val(page);
                        /*提交表单*/
                        $("#myForm").submit();
                    }
                });
            });
            //跳转到查看回复的列表
            function toReplyDetail(id){
                window.location.href = "/invitation/reply/" +id;
            }

            function toDel(id) {
                //删除提示
                if(confirm("确认删除该条帖子吗？")){
                    window.location.href = "/invitation/del/" +id;
                }
            }
            //提示是否删除成功
            if(${delMsg != null and delMsg != ''}){
                alert("${delMsg}");
            }
        </script>
    </body>
</html>
