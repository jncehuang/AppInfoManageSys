$(".addDevUser").on("click",function(){
	var obj = $(this);
	window.location.href="/dev/flatform/devUser/DevUserAdd";
});
$(".modifyDevUser").on("click",function(){
	var obj = $(this);
	window.location.href="devUsermodify?id="+ obj.attr("devUserid");
});

$(".viewDevUser").on("click",function(){
	var obj = $(this);
	window.location.href="devUserview/"+ obj.attr("devUserid");
});

$(".deleteUser").on("click",function(){
	var obj = $(this);
	if(confirm("你确定要删除该用户的所有信息吗？")){
		$.ajax({
			type:"GET",
			url:"delDevUser.json",
			data:{id:obj.attr("devUserid")},
			dataType:"json",
			success:function(data){
				if(data.delResult == "true"){//删除成功：移除删除行
					alert("删除成功");
					obj.parents("tr").remove();
				}else if(data.delResult == "false"){//删除失败
					alert("对不起，删除该用户失败");
				}else if(data.delResult == "notexist"){
					alert("对不起，删除的该用户不存在");
				}
			},
			error:function(data){
				alert("对不起，删除失败");
			}
		});
	}
});


