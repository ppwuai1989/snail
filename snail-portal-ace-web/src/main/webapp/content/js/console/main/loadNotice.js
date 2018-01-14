$(document).ready(function() {
	initNoticeTopList();

});

function initNoticeTopList() {
	
	$
			.ajax({
				type : "post",
				url : contextPath+"/notice/findListTop.do",
				data : {limit:5},
				beforeSend : function(XMLHttpRequest) {
				},
				success : function(rst, textStatus) {

					if (rst) {
						var html = new Array();
						var k=0;
						for ( var i in rst.list) {
							var o=rst.list[i];
							o.url=contextPath+"/dynamic/console/notice/preview.jsp?noticeId="+o.noticeId+"&taskId=0"
							k++;
							s=parseInt(i)+parseInt(1);
							html.push('<tr>');
							html.push('<td width="50px" align="middle">');
							html.push('<span">'+s+'</span> ');
							
							html.push('</td>');
							
							html.push('<td >');
							html.push('<a href="javascript:parent.addPanel(\''+o.title+'\',\''+o.url+'\',true)">');
							
							html.push(o.title);
							
							
							html.push('</a>');
							
							if(o.top=='1'){
								html.push('  <span class="badge badge-yellow">置顶</span> ');
						
							}
							html.push('</td>');
						
							
							
							html.push('<td width="150px" align="left">');
							html.push(o.publishTime.substr(0,11));
							html.push('</td>');
							
							
							html.push('</tr>');
							
							//console.log(rst.list[i]);
						}
						$('#notice-list-grid').html(html.join(''));
					}
				},
				complete : function(XMLHttpRequest, textStatus) {

				},
				error : function() {

				}
			});
}