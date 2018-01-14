<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@page import="org.platform.snail.model.Resources"%>
<%@page import="org.platform.snail.utils.CommonKeys"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta name="description" content="overview &amp; stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
<title>企业资源管理-users</title>
</head>
<jsp:include page="../../common/common.jsp" />
<script type="text/javascript" src="${pageContext.request.contextPath}/content/report/CreateControl.js"></script>
<body  onload="window_onload()">
<script type="text/javascript">document.write(breadcrumbs());</script>
<script type="text/javascript">

var CustomerReport;
var ProductReport;
var Top10CustomerReport;
var Top10ProductReport;

//在网页初始加载时向报表提供数据
function window_onload() {
    CustomerReport = ReportViewer.Report.ControlByName("srCustomerList").AsSubReport.Report;
    ProductReport = ReportViewer.Report.ControlByName("srProductList").AsSubReport.Report;
    Top10CustomerReport = ReportViewer.Report.ControlByName("srTop10Customer").AsSubReport.Report;
    Top10ProductReport = ReportViewer.Report.ControlByName("srTop10Product").AsSubReport.Report;
    
    //关联事件
    CustomerReport.OnInitialize = OnCustomerInitialize;
    ProductReport.OnInitialize = OnProductInitialize;
    Top10CustomerReport.OnInitialize = OnTop10CustomerInitialize;
    Top10ProductReport.OnInitialize = OnTop10ProductInitialize;
    
	//开启报表生成进度条显示
	ReportViewer.Report.ShowProgressUI = true;
	
    //启动运行
    ReportViewer.Start();
}

function OnCustomerInitialize()
{
    //载入子报表数据
	CustomerReport.LoadDataFromURL("http://www.rubylong.cn/webreport/data/xmlCustomer.txt");
}

function OnProductInitialize()
{
    //载入子报表数据
	ProductReport.LoadDataFromURL("http://www.rubylong.cn/webreport/06.SubReport/xmlProductList.txt");
}

function OnTop10CustomerInitialize()
{
    //载入子报表数据
	Top10CustomerReport.LoadDataFromURL("http://www.rubylong.cn/webreport/06.SubReport/xmlTop10Customer.txt");
}

function OnTop10ProductInitialize()
{
    //载入子报表数据
	Top10ProductReport.LoadDataFromURL("http://www.rubylong.cn/webreport/06.SubReport/xmlTop10Product.txt");
}
	</script>
 <script type="text/javascript"> 
 		var screenHeight=window.innerHeight-50;
	    CreatePrintViewerEx("100%", screenHeight, "http://www.rubylong.cn/webreport/grf/4a.txt", "", false, "");
    </script>

<jsp:include page="/dynamic/common/footer-1.jsp" />
<jsp:include page="/dynamic/common/footer-2.jsp" />
</body>		
</html>