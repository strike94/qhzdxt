<%--
  Created by IntelliJ IDEA.
  User: 神裂火织
  Date: 2017/12/20
  Time: 16:30
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
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/base.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>themes/css/default.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>javascript/chosen/chosen.min.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>javascript/artDialog-master/css/ui-dialog.css" />
    <link type="text/css" rel="stylesheet" href="<%=basePath %>javascript/treeTable-1.4.2/default/jquery.treeTable.css" />
    <script type="text/javascript" src="<%=basePath %>javascript/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/chosen/chosen.jquery.min.js"></script>
    <script language="javascript" type="text/javascript" src="<%=basePath %>javascript/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/artDialog-master/dist/dialog-plus-min.js"></script>
    <script type="text/javascript" src="<%=basePath %>javascript/treeTable-1.4.2/jquery.treeTable.js"></script>
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
            var option = {
                theme:'vsStyle',
                expandLevel : 2,
                beforeExpand : function($treeTable, id) {
                    //判断id是否已经有了孩子节点，如果有了就不再加载，这样就可以起到缓存的作用
                    if ($('.' + id, $treeTable).length) { return; }
                    //这里的html可以是ajax请求
                    var html = '<tr id="8" pId="6"><td><span class="tree_icon"><b class="treeName">碾伯镇</b></span></td><td></td><td align="right"><a href="javascript:;" class="normalLink editGroup">编辑</a><a href="javascript:;" class="normalLink dellinks">删除</a></td></tr>'
                        + '<tr id="9" pId="6"><td><span class="tree_icon"><b class="treeName">碾伯镇</b></span></td><td></td><td align="right"><a href="javascript:;" class="normalLink editGroup">编辑</a><a href="javascript:;" class="normalLink dellinks">删除</a></td></tr>';

                    // $treeTable.addChilds(html);
                },
                onSelect : function($treeTable, id) {
                    window.console && console.log('onSelect:' + id);

                }

            };
            $('#treeTable1').treeTable(option);

            option.theme = 'default';
            $('#treeTable2').treeTable(option);
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
            <div class="processBox fiveStep"><!--定义步数，系统自动分配宽度-->
                <div class="percentage"></div>
                <div class="pocessLine"> <span class="processPoint active"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">省厅发起项目</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">县级填报</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">市（州）填报</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">省厅同意发布</b> </span> <span class="processPoint"> <em class="percentage"></em> <i class="pointIcon"></i> <b class="ponitText">发布成功</b> </span> </div>
            </div>
        </div>
        <form action="<%=basePath%>project/add" method="post" enctype="multipart/form-data">
        <div class="pulicBox">
            <div class="newArticle">
                <div class="msgEditlabel clearfix">
                    <div class="halfPart"> <em class="frmLabel">建设用地类型</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <div class="selectionGroup">
                                <div class="dropDown"  style="width:220px;">
                                    <select data-placeholder="请选择" class="chosen-select-no-single" tabindex="9" name="type">
                                        <option value=""></option>
                                        <option value="单独选址项目">单独选址项目</option>
                                        <option value="城镇分批次项目">城镇分批次项目</option>
                                        <option value="城乡建设用地增减挂钩">城乡建设用地增减挂钩</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                    <div class="halfPart"> <em class="frmLabel">填报发起时间</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput"  onClick="WdatePicker()" name="date"/>
                        </div>
                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                </div>
                <div class="msgEditlabel clearfix">
                    <div class="halfPart"> <em class="frmLabel">用地项目名称</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput" name="name"/>
                        </div>
                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                    <div class="halfPart"> <em class="frmLabel">批准文号</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput" name="docnum"/>
                        </div>
                    </div>
                </div>
                <div class="msgEditlabel clearfix">
                    <div class="halfPart"> <em class="frmLabel">批准年度</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput" onClick="WdatePicker()" name="accessdate"/>
                        </div>
                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                </div>
                <div class="msgEditlabel clearfix">
                    <div class="halfPart"> <em class="frmLabel">项目位置</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <div class="selectionGroup">
                                <div class="dropDown"  style="width:120px;">
                                    <select data-placeholder="所属地市" class="chosen-select-no-single" tabindex="9" name="local1">
                                        <option value=""></option>
                                        <option value="全部">全部</option>
                                        <option value="已发布">已发布</option>
                                        <option value="未发布">未发布</option>
                                    </select>
                                </div>
                            </div>
                            <div class="selectionGroup">
                                <div class="dropDown"  style="width:120px;">
                                    <select data-placeholder="所属区县" class="chosen-select-no-single" tabindex="9" name="local2">
                                        <option value=""></option>
                                        <option value="全部">全部</option>
                                        <option value="已发布">已发布</option>
                                        <option value="未发布">未发布</option>
                                    </select>
                                </div>
                            </div>
                            <div class="selectionGroup">
                                <div class="dropDown"  style="width:120px;">
                                    <select data-placeholder="乡镇（街道）" class="chosen-select-no-single" tabindex="9" name="local3"><option value=""></option>
                                    <option value="全部">全部</option>
                                    <option value="已发布">已发布</option>
                                    <option value="未发布">未发布</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                </div>
                <div class="msgEditlabel clearfix">
                    <div class="halfPart"> <em class="frmLabel">所属村居</em>
                        <div class="frmInputBox frmInputBoxNoTextLimit">
                            <input type="text" class="textInput"  name="address"/>
                        </div>
                        <!--<div class="pagesTips errorText" style="display:block;">一个字也没有，你还想保存？</div>-->
                    </div>
                </div>
                <div class="subEditlabelBox">
                    <div class="dataGrild treeTable">
                        <table id="treeTable1" style="width:100%">
                            <tr>
                                <th align="left"><span class="fieldBlock leftAlign">文件名称</span></th>
                                <th  align="left"><span class="fieldBlock leftAlign">公开类型</span></th>
                                <th  align="left"><span class="fieldBlock leftAlign">是否上传</span></th>
                                <th  align="left"><span class="fieldBlock rightAlign">操作</span></th>
                            </tr>
                            <tr id="1">
                                <td><span controller="true" class="tree_icon"><b class="treeName">省厅</b></span></td>
                                <td></td>
                                <td></td>
                                <td align="right"></td>
                            </tr>
                            <tr id="101" pId="1">
                                <td><span controller="true" class="tree_icon"><b class="treeName">国务院批准用地</b></span></td>
                                <td></td>
                                <td></td>
                                <td align="right"><a href="javascript:;" class="normalLink addGroup">上传文件</a><a href="javascript:;" class="normalLink editGroup">编辑</a><a href="javascript:;" class="normalLink dellinks">删除文件</a></td>
                            </tr>
                            <tr id="101" pId="1">
                                <td><span controller="true" class="tree_icon"><b class="treeName">省级批准用地</b></span></td>
                                <td></td>
                                <td></td>
                                <td align="right"><a href="javascript:;" class="normalLink addGroup">上传文件</a><a href="javascript:;" class="normalLink editGroup">编辑</a><a href="javascript:;" class="normalLink dellinks">删除文件</a></td>
                            </tr>
                        </table>
                        <script type="text/javascript">
                            $(function(){
                                $('.addGroup').on('click',
                                    function() {
                                        var d = dialog({
                                            //title: '添加组',
                                            content: '',
                                            follow: this,
                                            cancelValue: '取消',
                                            okValue: '确定',
                                            ok: function() {},
                                            quickClose: true,
                                            cancel: function() {}
                                        });
                                        var elem = $("#addGroup");
                                        d.content(elem).show();
                                    });

                                $('.editGroup').on('click',
                                    function() {
                                        var d = dialog({
                                            //title: '添加组',
                                            width:480,
                                            content: '',
                                            follow: this,
                                            cancelValue: '取消',
                                            okValue: '确定',
                                            ok: function() {},
                                            quickClose: true,
                                            cancel: function() {}
                                        });
                                        var elem = $("#editGroup");
                                        d.content(elem).show();
                                    });

                                $(".dellinks").on('click',
                                    function() {
                                        var d = dialog({
                                            title: '删除确认',
                                            content: '',
                                            cancelValue: '取消',
                                            okValue: '确定',
                                            ok: function() {},

                                            cancel: function() {}
                                        });
                                        var elem = $("#confirmBox");
                                        d.content(elem).showModal();
                                    });
                            })


                        </script>
                    </div>
                </div>
            </div>
        </div>
        <div class="ctrlBar">
            <button class="ctrlBtn">返回</button>
            <button class="ctrlBtn focusBtn">保存</button>
            <button class="ctrlBtn focusBtn" type="submit">保存并发起</button>
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
</body>
</html>

