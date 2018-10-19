<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>数据字典 <i class="fa fa-user"></i><small>${userSession.userName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_title">
            <h2>查看数据字典信息</h2>
          <div class="clearfix"></div>
      </div>
      <div class="x_content1">
        <form class="form-horizontal form-label-left" >
          <input type="hidden" name="id" value="${dataDictionary.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型编码 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" value="${dataDictionary.typeCode}"
              type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              value="${dataDictionary.typeName}" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型值ID <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" 
              	value="${dataDictionary.valueId}" type="text" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型值Name <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input class="form-control col-md-7 col-xs-12" readonly="readonly"
              	value="${dataDictionary.valueName}" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建者 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="<c:choose>
    <c:when test='${dataDictionary.createdBy eq 1}'>
        系统管理员
    </c:when>
    <c:when test='${dataDictionary.createdBy eq 2}'>
        超级管理员
    </c:when>
    <c:when test='${dataDictionary.createdBy eq 3}'>
        测试管理员
    </c:when>
    <c:otherwise>
        ${dataDictionary.createdBy}
    </c:otherwise></c:choose>"
              class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" value="<fmt:formatDate value='${dataDictionary.creationDate}' pattern='yyyy-MM-dd'></fmt:formatDate>"
               class="form-control col-md-7 col-xs-12" readonly="readonly">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12"  for="select">更新者 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="<c:choose>
    <c:when test='${dataDictionary.modifyBy eq 1}'>
        系统管理员
    </c:when>
    <c:when test='${dataDictionary.modifyBy eq 2}'>
        超级管理员
    </c:when>
    <c:when test='${dataDictionary.modifyBy eq 3}'>
        测试管理员
    </c:when>
    <c:otherwise>
        ${dataDictionary.createdBy}
    </c:otherwise></c:choose>" readonly="readonly">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="select">最新更新时间 <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="text" class="form-control col-md-7 col-xs-12" 
              	value="<fmt:formatDate value='${dataDictionary.modifyDate}' pattern='yyyy-MM-dd'></fmt:formatDate>" readonly="readonly">
            </div>
          </div>

        </form>
        </div>
        <div class="clearfix"></div>
    </div>
     <div class="form-group">
        <div class="col-md-6 col-md-offset-3">
          <button type="button" class="btn btn-primary" id="back">返回</button>
        </div>
      </div>
    <div class="clearfix"></div>
    <br/><br/>
  </div>
</div>
<%@include file="../developer/common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/appinfoview.js"></script>