<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/18
  Time: 15:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="Description" content=""/>
<meta name="keywords" content=""/>
<title>青海省征地信息公开系统</title>
<link type="text/css" rel="stylesheet" href="<%=basePath %>/themes/base.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>/themes/default.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath %>/javascript/chosen/chosen.min.css" />
<script type="text/javascript" src="<%=basePath %>/javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath %>/javascript/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	 $(".i_user").hoverDelay({
    hoverDuring: 0,
    outDuring: 300,
    hoverEvent: function() {
      $(".userbox", $(".i_user")).slideDown("fast");
    },
    outEvent: function() {
      $(".userbox", $(".i_user")).slideUp("fast");
    }
  });
	});
	//延时通用
(function($) {
  $.fn.hoverDelay = function(options) {
    var defaults = {
      hoverDuring: 200,
      outDuring: 200,
      hoverEvent: function() {
        $.noop();
      },
      outEvent: function() {
        $.noop();
      }
    };
    var sets = $.extend(defaults, options || {});
    var hoverTimer, outTimer;
    return $(this).each(function() {
      $(this).hover(function() {
        clearTimeout(outTimer);
        hoverTimer = setTimeout(sets.hoverEvent, sets.hoverDuring);
      },
      function() {
        clearTimeout(hoverTimer);
        outTimer = setTimeout(sets.outEvent, sets.outDuring);
      });
    });
  }
})(jQuery);
function showDetaile(obj){
	$(obj).addClass("active").siblings().removeClass("active");
	}
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
  <div class="menu">
    <ul>
      <li><a href="javascript:;" class="all"><i></i><span>系统及配置</span></a></li>
      <li><a href="user.html" class=""><i></i><span>我的账号</span></a></li>
      
      <li><a href="setting.html" class="active end"><i></i><span>系统管理</span></a></li>
    </ul>
  </div>
  <div class="wrp hasleft">
    <div class="crumbs clearfix"><span class="backTo"><a href="javascript:history.go(-1)" class="backToIcon"></a><a class="backLinks heightColor" href="javascript:history.go(-1)">系统管理</a><b class="partLine grayColor">/</b><b>添加用户</b></span></div>
    <div class="pulicBox clearfix">
      <div class="newArticle" style="padding-top:0;">
        <div class="tipsInforBlock">新增用户默认密码均为:123456</div>
        <div class="msgEditlabel clearfix">
          <div class="halfPart"> <em class="frmLabel">账号名称</em>
            <div class="frmInputBox frmInputBoxNoTextLimit"> ABC123456 </div>
            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>--> 
          </div>
          <div class="halfPart"> <em class="frmLabel">状态</em>
            <div class="frmInputBox frmInputBoxNoTextLimit"> 正常 </div>
            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>--> 
          </div>
        </div>
        <div class="msgEditlabel clearfix">
          <div class="halfPart"> <em class="frmLabel">姓名</em>
            <div class="frmInputBox frmInputBoxNoTextLimit"> 文超 </div>
            <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>--> 
          </div>
          <div class="halfPart"> <em class="frmLabel">所属单位</em>
            <div class="frmInputBox frmInputBoxNoTextLimit"> 国土所 </div>
          </div>
        </div>
        <div class="msgEditlabel clearfix">
          <div class="halfPart"> <em class="frmLabel">邮箱</em>
            <div class="frmInputBox frmInputBoxNoTextLimit">
              <input type="text" class="textInput"/>
            </div>
          </div>
          <div class="halfPart halfPartEnd"> <em class="frmLabel">联系电话</em>
            <div class="frmInputBox frmInputBoxNoTextLimit">
              <input type="text" class="textInput" />
            </div>
          </div>
        </div>
        <div class="msgEditlabel clearfix">
          <div class="halfPart halfPartEnd"> <em class="frmLabel">联系地址</em>
            <div class="frmInputBox frmInputBoxNoTextLimit">
              <input type="text" class="textInput" />
            </div>
          </div>
        </div>
        <div class="msgEditlabel clearfix">
          <div class="halfPart halfPartEnd"> <em class="frmLabel">用户角色</em>
            <div class="frmSelectBox frmInputBoxNoTextLimit dropDown">
              <select data-placeholder="可选择多个角色" class="chosen-select" multiple tabindex="4">
                <option value=""></option>
                <option value="United States">县级发布人员</option>
                <option value="United Kingdom">州级发布人员</option>
                <option value="Afghanistan">省级发布人员</option>
                <option value="Aland Islands">超级管理员</option>
              </select>
            </div>
          </div>
        </div>
        <div class="msgEditlabel"> <em class="frmLabel">备注<b class="aboutMsg"></b></em>
          <div class="frmAreaBox">
            <textarea name="" cols="" rows=""></textarea>
          </div>
        </div>
      </div>
      <div class="ctrlBar">
        <button class="ctrlBtn">取消</button>
        <button class="ctrlBtn focusBtn">保存</button>
      </div>
    </div>
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
    <ul>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.jsp">立即处理</a>
        </div>
      </li>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.jsp">立即处理</a>
        </div>
      </li>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.jsp">立即处理</a>
        </div>
      </li>
    </ul><div class="loadMore">
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
