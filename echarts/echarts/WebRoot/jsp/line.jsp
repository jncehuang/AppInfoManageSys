<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/echarts/js/echarts.js"></script>
<script type="text/javascript" src="/echarts/js/jquery-1.8.3.js"></script>
</head>
<body>
	<div id="main" style="width: 600px;height:400px;"></div>
	<script type="text/javascript">
		var myChart = echarts.init(document.getElementById('main'));
		// 显示标题，图例和空的坐标轴
		option={
			title : {// 图表标题，可以通过show:true/false控制显示与否，还有subtext:'二级标题',link:'http://www.baidu.com'等  
				text : '实例'
			},
			tooltip : {// 这个是鼠标浮动时的工具条，显示鼠标所在区域的数据，trigger这个地方每种图有不同的设置，见官网吧，一两句说不清楚  
				trigger : 'axis'
			},
			legend : {// 这个就是图例，也就是每条折线或者项对应的示例，就是这个<a target=_blank href="http://img.blog.csdn.net/20160622094820180?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center">图例</a>  
				data : []
			},
			toolbox : {
				feature : {
					saveAsImage : {}
				// 工具，提供几个按钮，例如动态图表转换，数据视图，保存为图片等  
				}
			},
			grid : {
				left : '3%',
				right : '4%',
				bottom : '3%',// 这几个属性可以控制图表上下左右的空白尺寸，可以自己试试。  
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				boundaryGap : false,
				data : []
			// X轴的定义  
			} ],
			yAxis : [ {
				type : 'value'// Y轴的定义  
			} ],
			series : []
		// 这里就是数据了  
		};

		myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

		jQuery.ajax({
			url : "/echarts/getLineEcharts",
			type : 'get',
			dataType : 'json',
			success : function(jsons) {
				var Item = function() {
					return {
						name : '',
						type : 'line',
						label : {
						},
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						},
						data : []
					};
				};// series中的每一项为一个item,所有的属性均可以在此处定义  
				var legends = [];// 准备存放图例数据  
				var Series = []; // 准备存放图表数据  
				var json = jsons.data;// 后台返回的json  
				for ( var i = 0; i < json.length; i++) {
					var it = new Item();
					it.name = json[i].name;// 先将每一项填充数据  
					legends.push(json[i].name);// 将每一项的图例名称也放到图例的数组中  
					it.data = json[i].data;
					Series.push(it);// 将item放在series中  
				}
				option.xAxis[0].data = jsons.xcontent;// 这一步是设置X轴数据了，需要注意：option.xAxis.data = json.xcontent这样不行  
				// 折线图可设置上下两个X轴，所以必须是option.xAxis[0].data = json.xcontent  
				option.legend.data = legends;// 设置图例  
				option.series = Series; // 设置图表  
				myChart.setOption(option);// 重新加载图表  
				myChart.hideLoading(); //隐藏加载动画
			},
			error : function() {
				alert("数据加载失败！请检查数据链接是否正确");
			}
		});
	</script>
</body>
 	<div align="center">  
        <div id="main" style="width: 1000px;height:700px"></div>  
    </div>  
</html>