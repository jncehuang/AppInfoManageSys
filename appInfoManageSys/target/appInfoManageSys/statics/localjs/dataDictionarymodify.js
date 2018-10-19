
function  loadBackendUser(cl,BackendUser){
    $.ajax({
        type:"GET",//请求类型
        url:"getBackendlist.json",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            $("#"+BackendUser).html("");
            var options = "<option value=\"\">--请选择--</option>";
            for(var i = 0; i < data.length; i++){
                if(cl != null && cl != undefined && data[i].id == cl ){
                    options += "<option selected=\"selected\" value=\""+data[i].id+"\" >"+data[i].userName+"</option>";
                }else{
                    options += "<option value=\""+data[i].id+"\">"+data[i].userName+"</option>";
                }
            }
            $("#"+BackendUser).html(options);
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("加载分类列表失败！");
        }
    });
}
$(function() {
    $.ajax({
        type:"GET",//请求类型
        url:"datadictionarylist.json",//请求的url
        data:{},//请求参数
        dataType:"json",//ajax接口（请求url）返回的数据类型
        success:function(data){//data：返回数据（json对象）
            $("#typeName").html("");
            var cl =  $("#typeNameHide").val();
            var options = "<option value=\"\">--请选择--</option>";
            for(var i = 0; i < data.length; i++){
                if(cl != null && cl != undefined && data[i].typeName == cl ){
                    options += "<option selected=\"selected\" value=\""+data[i].typeName+"\" >"+data[i].typeName+"</option>";
                }else{
                    options += "<option value=\""+data[i].typeName+"\">"+data[i].typeName+"</option>";
                }
            }
            $("#typeName").html(options);
        },
        error:function(data){//当访问时候，404，500 等非200的错误状态码
            alert("加载分类列表失败！");
        }
    });
    // //动态加载所属平台列表
    // $.ajax({
    //     type: "GET",//请求类型
    //     url: "datadictionarylist.json",//请求的url
    //     data: {tcode: "APP_FLATFORM"},//请求参数
    //     dataType: "json",//ajax接口（请求url）返回的数据类型
    //     success: function (data) {//data：返回数据（json对象）
    //         var fid = $("#fid").val();
    //         $("#flatformId").html("");
    //         var options = "<option value=\"\">--请选择--</option>";
    //         for (var i = 0; i < data.length; i++) {
    //             if (fid != null && fid != undefined && data[i].valueId == fid) {
    //                 options += "<option selected=\"selected\" value=\"" + data[i].valueId + "\" >" + data[i].valueName + "</option>";
    //             } else {
    //                 options += "<option value=\"" + data[i].valueId + "\">" + data[i].valueName + "</option>";
    //             }
    //         }
    //         $("#flatformId").html(options);
    //     },
    //     error: function (data) {//当访问时候，404，500 等非200的错误状态码
    //         alert("加载平台列表失败！");
    //     }
    // });
    $("#typeName").change(function(){
        var typeName = $("#typeName").val();
        if(typeName != '' && typeName != null){
            $.ajax({
                type:"GET",//请求类型
                //url:"categorylevellist.json",//请求的url1231231
                url:"datadictionaryForByTypeCodeByTypeName.json",
                data:{typeName:typeName},//请求参数
                dataType:"json",//ajax接口（请求url）返回的数据类型
                success:function(data){//data：返回数据（json对象）
                    $("#typeCode").val(data);
                },
                error:function(data){//当访问时候，404，500 等非200的错误状态码
                    alert("加载二级分类失败！");
                }
            });
        }else{
            $("#typeCode").val();
        }
    });
    var cl1 = $("#u1").val();
    loadBackendUser(cl1, "createdBy");
    var cl2 = $("#m1").val();
    loadBackendUser(cl2, "modifyBy");
});
$("#back").on("click",function(){
    window.location.href = "/appManager/flatform/dataDictionary/list";
});
      
      
      