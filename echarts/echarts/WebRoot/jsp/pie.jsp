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
		myChart.setOption({
			color : [ '#ff7d27', '#47b73d', '#fcc36e', '#57a2fd', "#228b22" ],//饼图颜色
			title : {
				text : '信息发布排行(异步请求)',
				subtext : '纯属虚构',
				x : 'center'
			},
			tooltip : {
				trigger : 'item',
				formatter : "{a} <br/>{b} : {c} ({d}%)"
			},
			legend : {
				orient : 'vertical',
				x : 'left',
				data : []
			},
			toolbox : {
				show : true,
				feature : {
					mark : {
						show : true
					},
					dataView : {
						show : true,
						readOnly : false
					},
					magicType : {
						show : true,
						type : [ 'pie', 'funnel' ],
						option : {
							funnel : {
								x : '25%',
								width : '50%',
								funnelAlign : 'left',
								max : 1548
							}
						}
					},
					restore : {
						show : true
					},
					saveAsImage : {
						show : true
					}
				}
			},
			series : [ {
				name : '发布排行',
				type : 'pie',
				radius : '55%',
				center : [ '50%', '60%' ],
				data : []
			} ]
		});

		myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

		var names = []; //类别数组（用于存放饼图的类别）
		var brower = [];
		$.ajax({
			type : "get",
			url : "/echarts/getPieEcharts",//请求数据的地址
			dataType : "json", //返回数据形式为json
			success: function (result) {
            //请求成功时执行该函数内容，result即为服务器返回的json对象
            $.each(result.visitInfo, function (index, item) {
                names.push(item.name);    //挨个取出类别并填入类别数组 
                brower.push({
                    name: item.name,
                    value: item.value
                });
            });
				myChart.hideLoading(); //隐藏加载动画
				myChart.setOption({ //加载数据图表                
					legend : {
						data : names
					},
					series : [ {
						data : brower
					} ]
				});
			},
			error : function(errorMsg) {
				//请求失败时执行该函数
				alert("图表请求数据失败!");
				myChart.hideLoading();
			}
		});
	</script>
</body>
</html>