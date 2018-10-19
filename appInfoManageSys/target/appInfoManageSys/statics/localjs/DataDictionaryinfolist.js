$(".addDataDictionary").on("click",function(){
	var obj = $(this);
	window.location.href="DatadictionaryAdd";
});
$(".addDataDictionaryForValue").on("click",function(){
    var obj = $(this);
    window.location.href="dataDictionaryAddVales";
});
$(".modifyDataDictionary").on("click",function(){
	var obj = $(this);
	window.location.href="datadictionarymodify?id="+ obj.attr("dataid");
});
$(".viewDataDictionary").on("click",function(){
	var obj = $(this);
	window.location.href="DictionaryView/"+ obj.attr("dataid");
});
$(function () {
    $.ajax({
        type:"GET",//请求类型
        url:"datadictionarylist.json",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            $("#typeName").html("");
            var options = "<option value=\"\">--请选择--</option>";
            for(var i = 0; i < data.length; i++){
            	options += "<option value=\""+data[i].typeName+"\">"+data[i].typeName+"</option>";
            }
            $("#typeName").html(options);
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("加载分类列表失败！");
        }
    });
});



