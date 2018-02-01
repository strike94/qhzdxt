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
<link type="text/css" rel="stylesheet" href="../themes/base.css" />
<link type="text/css" rel="stylesheet" href="../themes/default.css" />
<link type="text/css" rel="stylesheet" href="../javascript/chosen/chosen.min.css" />
<link type="text/css" rel="stylesheet" href="../javascript/artDialog-master/css/ui-dialog.css" />
<script type="text/javascript" src="../javascript/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="../javascript/chosen/chosen.jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="../javascript/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="../javascript/artDialog-master/dist/dialog-plus-min.js"></script>
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
        <div class="pocessLine"> <span class="processPoint passed"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">县级发起批前项目</b> </span> <span class="processPoint active"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">市（州）审核</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">发布成功</b> </span> </div>
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
              <div class="frmInputBox frmInputBoxNoTextLimit"> ${data.notice_address} </div>
              <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
            </div>
          </div>
          <div class="msgEditlabel clearfix">
            <div class="halfPart"> <em class="frmLabel">所属村居</em>
              <div class="frmInputBox frmInputBoxNoTextLimit">
                ${data.notice_address}
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
        <button class="ctrlBtn" onClick="javascript:history.go(-1)">返回</button>
        <button class="ctrlBtn canclBtn" name="state" value="4">取消发布</button>
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
    <ul>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.html">立即处理</a>
        </div>
      </li>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.html">立即处理</a>
        </div>
      </li>
      <li class="messageItem">
        <div class="messageTime"> <i class="lineBg"></i><b class="timePoint"></b><p class="timeBlock">2017-06-05<br />21:21</p></div>
        <div class="messageBlock">
        <h2 class="messageItemTitle">2017年度西商村拟征收土地公告</h2>
        <p class="cmessageContent">项目由省厅发起，项目位置西宁市上东区，项目文号ABC-123456。</p>
        <a class="messageTodo" href="plan.html">立即处理</a>
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
