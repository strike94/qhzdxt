<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2018/1/2
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%   String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta name="Description" content=""/>
    <meta name="keywords" content=""/>
    <title>青海省征地信息公开系统-拟征收土地公告-新增</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/themes/css/default.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/javascript/chosen/chosen.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/javascript/artDialog-master/css/ui-dialog.css" />
    <script type="text/javascript" src="<%=basePath%>/javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/javascript/chosen/chosen.jquery.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath%>/javascript/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>/javascript/artDialog-master/dist/dialog-plus-min.js"></script>
    <script type="text/javascript">
        $(function(){

            $('#addSamples').on('click', function () {
                var d = dialog({
                    title: '添加器具',
                    content: '',
                    cancelValue: '取消',
                    okValue: '确定',
                    ok: function () {
                    },

                    cancel: function () {}
                });
                var elem = $("#addSampleBox");
                d.content(elem).showModal();
            });
        });

    </script>
</head>

<body>
<div class="header">
    <h1 class="logoText">青海省征地信息公开系统</h1>
    <div class="menuGroup">
        <ul>
            <li><a href="default.html" class="home"><i></i>首页</a></li>
            <li><a href="javascript:;" onclick="showMessage(this)" class="message"><i><em class="iconState"></em></i>待办提醒</a></li>
            <li><a href="setting.html" class="setting"><i></i>系统设置</a></li>
            <li class="i_user"><a href="user.html" class="user"><i></i>我的账号</a>
                <div class="userbox"> <span class="username"><em>西宁市大通县</em>张三：欢迎您！</span>
                    <div class="s_group">
                        <div class="it_group"><a href="changepassaord.html" class="grayColor">修改密码</a> </div>
                        <div class="it_group"><a href="login.html" class="s_btn">退出系统</a></div>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="wrp clearfix">
        <div class="crumbs clearfix"><span class="backTo"><a href="javascript:history.go(-1)" class="backToIcon"></a><a class="backLinks heightColor" href="javascript:history.go(-1)">拟征收土地公告</a><b class="partLine grayColor">/</b><b>新增拟征收土地公告</b></span></div>
        <div class="processWrap">
            <div class="processBox threeStep">
                <div class="percentage"></div>
                <div class="pocessLine"> <span class="processPoint active"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">县级发起批前项目</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">市（州）审核</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">发布成功</b> </span> </div>
            </div>
        </div>
        <form action="<%=basePath %>back/notice/noticedetail" method="post" enctype="multipart/form-data">
            <div class="pulicBox">
                <div class="newArticle">
                    <div class="msgEditlabel clearfix">
                        <div class="halfPart"> <em class="frmLabel">公告名称</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit"> ${data.notice_name} </div>
                            <input type="hidden" class="textInput" name="noticeid"value="${data.notice_id}"/>
                            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                        </div>
                        <div class="halfPart"> <em class="frmLabel">文号</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit"> ${data.notice_docnum}</div>
                        </div>
                    </div>
                    <div class="msgEditlabel clearfix">
                        <div class="halfPart"> <em class="frmLabel">发布时间</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit">${data.s_time}</div>
                            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                        </div>
                    </div>
                    <div class="msgEditlabel clearfix">
                        <div class="halfPart"> <em class="frmLabel">项目位置</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit"> ${data.notice_local1}${data.notice_local2}${data.notice_local3}</div>
                            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                        </div>
                    </div>
                    <div class="msgEditlabel clearfix">
                        <div class="halfPart"> <em class="frmLabel">所属村居</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit">
                                ${data.notice_street}
                            </div>
                            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                        </div>
                    </div>
                    <div class="msgEditlabel clearfix">
                        <div class="halfPart"> <em class="frmLabel">上传公告</em>
                            <div class="frmInputBox frmInputBoxNoTextLimit">
                                <div class="uploadBox">

                                    <div class="uploadFinish"><!--失败调用error-->
                                        <a href="javascript:;" class="loadName" >${data.notice_context}  </a> </div>
                                </div>
                            </div>
                            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                        </div>
                    </div>
                </div>
            </div>
            <div class="ctrlBar">
                <button class="ctrlBtn" type="button" onClick="javascript:history.back(-1);">返回</button>
                <button class="ctrlBtn focusBtn" type="submit" name="state" value="3">修改</button>
                <button class="ctrlBtn focusBtn" type="submit" name="state" value="2">送审</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    var config = {
        '.chosen-select'           : {},
        '.chosen-select-deselect'  : {allow_single_deselect:true},
        '.chosen-select-no-single' : {disable_search_threshold:10},
        '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
        '.chosen-select-width'     : {width:"100%"}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
    $('.chosen-select').chosen();
</script>
<div class="messageBox">
    <div class="messageBoxContent">
        <div class="messageMain">
            <a href="javascript:;">加载更多</a>
        </div>
        </div>
    </div>
    <a class="closeMessageBox" href="javascript:;" onClick="closeMessage(this)"></a>
    <script type="text/javascript">
        function closeMessage(obj){
            $(obj).parent().slideUp("fast");
        }
        function showMessage(){
            $(".messageBox").slideToggle("fast");
        }
    </script>
</div>
</body>
</html>