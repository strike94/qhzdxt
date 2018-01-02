<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/27
  Time: 15:14
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
    <title>青海省征地信息公开系统</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/default.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>javascript/artDialog-master/css/ui-dialog.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>javascript/chosen/chosen.min.css" />
    <script type="text/javascript" src="<%=basePath %>javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/chosen/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/ueditor1_4_3-utf8-net/ueditor.config.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/ueditor1_4_3-utf8-net/ueditor.all.min.js"> </script>
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
            <li><a href="article.jsp" class="all"><i></i><span>所有文章</span></a></li>
            <li><a href="article.jsp" class="active"><i></i><span>相关法律法规</span></a></li>
            <li><a href="article.jsp" class="end"><i></i><span>征地补偿标准</span></a></li>
        </ul>
    </div>
    <div class="wrp hasleft">
        <div class="crumbs clearfix"><span class="backTo"><a href="javascript:history.go(-1)" class="backToIcon"></a><a class="backLinks heightColor" href="javascript:history.go(-1)">征地信息文章</a><b class="partLine grayColor">/</b><b>添加文章</b></span></div>
        <form action="<%=basePath%>art/add" method="post" id="article">
        <div class="pulicBox clearfix">
            <div class="newArticle" style="padding-top:0;">

                <div class="msgEditlabel clearfix">
                    <div class="halfPart halfPartEnd"> <em class="frmLabel">文章标题</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput" name="name"/>
                        </div>
                    </div>
                </div>
                <div class="msgEditlabel clearfix">
                    <div class="halfPart halfPartEnd"> <em class="frmLabel">栏目</em>
                        <div class="frmSelectBox frmInputBoxNoTextLimit dropDown">
                            <select data-placeholder="选择"  name="type">
                                <option value=""></option>
                                <option value="相关法律法规">相关法律法规</option>
                                <option value="征地补偿标准">征地补偿标准</option>

                            </select>
                        </div>
                    </div>
                </div>
                <div class="msgEditlabel"> <em class="frmLabel">描述<b class="aboutMsg"></b></em>
                    <div class="frmAreaBox" style="height: 300px;width: 85%">
                        <textarea name="content" form="article"></textarea>
                    </div>
                </div>
            </div>
            <div class="ctrlBar">
                <button class="ctrlBtn">取消</button>
                <button class="ctrlBtn focusBtn" type="submit">保存</button>
            </div>
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
    <script type="text/javascript">
        $(function(){
            //chose_mult_set_ini('.chosen-select', '关于我们,检验周期');
        });
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
        //实例化编辑器
        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
        var ue = UE.getEditor('editor');

        ue.addListener( 'ready', function( editor ) {
            ue.execCommand( 'focus' ); //编辑器家在完成后，让编辑器拿到焦点
            $("div[title]",".uedit").showTips({offsetY:24,tipsTxt:function(obj){
                return $(obj).attr("title");
            }});

            /*	 $(".edui-icon").showTips({offsetY:24,tipsTxt:function(obj){
                     return $(obj).parent().attr("title");
                     }});*/
        } );
        function isFocus(e){
            alert(UE.getEditor('editor').isFocus());
            UE.dom.domUtils.preventDefault(e)
        }
        function setblur(e){
            UE.getEditor('editor').blur();
            UE.dom.domUtils.preventDefault(e)
        }
        function insertHtml() {
            var value = prompt('插入html代码', '');
            UE.getEditor('editor').execCommand('insertHtml', value)
        }
        function createEditor() {
            enableBtn();
            UE.getEditor('editor');
        }
        function getAllHtml() {
            alert(UE.getEditor('editor').getAllHtml())
        }
        function getContent() {
            var arr = [];
            arr.push("使用editor.getContent()方法可以获得编辑器的内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getContent());
            alert(arr.join("\n"));
        }
        function getPlainTxt() {
            var arr = [];
            arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
            arr.push("内容为：");
            arr.push(UE.getEditor('editor').getPlainTxt());
            alert(arr.join('\n'))
        }
        function setContent(isAppendTo) {
            var arr = [];
            arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
            UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
            alert(arr.join("\n"));
        }
        function setDisabled() {
            UE.getEditor('editor').setDisabled('fullscreen');
            disableBtn("enable");
        }

        function setEnabled() {
            UE.getEditor('editor').setEnabled();
            enableBtn();
        }

        function getText() {
            //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
            var range = UE.getEditor('editor').selection.getRange();
            range.select();
            var txt = UE.getEditor('editor').selection.getText();
            alert(txt)
        }

        function getContentTxt() {
            var arr = [];
            arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
            arr.push("编辑器的纯文本内容为：");
            arr.push(UE.getEditor('editor').getContentTxt());
            alert(arr.join("\n"));
        }
        function hasContent() {
            var arr = [];
            arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
            arr.push("判断结果为：");
            arr.push(UE.getEditor('editor').hasContents());
            alert(arr.join("\n"));
        }
        function setFocus() {
            UE.getEditor('editor').focus();
        }
        function deleteEditor() {
            disableBtn();
            UE.getEditor('editor').destroy();
        }
        function disableBtn(str) {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                if (btn.id == str) {
                    UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
                } else {
                    btn.setAttribute("disabled", "true");
                }
            }
        }
        function enableBtn() {
            var div = document.getElementById('btns');
            var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
            for (var i = 0, btn; btn = btns[i++];) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            }
        }

        function getLocalData () {
            alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
        }

        function clearLocalData () {
            UE.getEditor('editor').execCommand( "clearlocaldata" );
            alert("已清空草稿箱")
        }
    </script>
</div>
</body>
</html>
