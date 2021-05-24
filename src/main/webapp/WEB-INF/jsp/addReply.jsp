<%--
  Created by IntelliJ IDEA.
  User: Cong
  Date: 2021/4/28
  Time: 23:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>添加回复</title>
        <!--引入bookstrap的css-->
        <link rel="stylesheet"  href="/statics/css/bootstrap.css"/>
        <!--引入jQuery-->
        <script src="/statics/js/jquery-1.12.4.js"></script>
        <!--引入bookstrap的js-->
        <script src="/statics/js/bootstrap.js"></script>
    </head>
    <body>
        <div class="container">
            <!--标题-->
            <div class="row">
                <div class="col-md-3 col-md-offset-5">
                    <h1>添加回复</h1>
                </div>
            </div>
            <!--表单提交-->
            <div class="row">
                <div class="col-md-10 col-md-offset-2">
                    <form action="/invitation/add/${invId}" method="post" class="form-horizontal">
                        <div class="form-group">
                            <label for="content" class="control-label col-md-2">回复内容：</label>
                            <div class="col-md-6">
                                <textarea name="content" class="form-control" rows="3" cols="" id="content"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="author" class="control-label col-md-2">回复昵称：</label>
                            <div class="col-md-6">
                                <input type="text" name="author" class="form-control" id="author" placeholder="请输入昵称"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-2">
                                <button type="submit" class="btn btn-success">提交</button>
                                <!--type="button" ： 必须要写，否则谷歌浏览器会默认type="submit"-->
                                <button type="button" class="btn btn-info">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
