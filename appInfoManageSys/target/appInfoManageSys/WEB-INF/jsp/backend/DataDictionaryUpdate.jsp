<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../backend/common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>数据信息的修改<i class="fa fa-user"></i><small>${userSession.userName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
        <form class="form-horizontal form-label-left" action="/appManager/flatform/dataDictionary/datadictionarymodifysave" method="post">
          <input type="hidden" name="id" id="id" value="${dataDictionary.id}">
          <input type="hidden" name="typeNameHide" id="typeNameHide" value="${dataDictionary.typeName}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <select name="typeName" id="typeName" class="form-control"  required="required"></select>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型编码 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" id="c1" />
              <input type="text" name="typeCode" id="typeCode" class="form-control"  required="required" placeholder="请输入类型编码"  readonly="readonly" value="${dataDictionary.typeCode}"/>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型值ID <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="valueId" type="number" class="form-control col-md-7 col-xs-12"
                     name="valueId" placeholder="请输入类型值ID" value="${dataDictionary.valueId}">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">类型值Name<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12"
                     name="valueName"  required="required"
                     data-validate-length-range="20" data-validate-words="1"
                     placeholder="请输入类型值Name" type="text" value="${dataDictionary.valueName}">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建者<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${dataDictionary.createdBy}" id="u1" />
              <select name="createdBy" id="createdBy" class="form-control"  required="required" readonly="readonly"></select>
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="date" id="downloads" name="creationDate" value="<fmt:formatDate value='${dataDictionary.creationDate}' pattern='yyyy-MM-dd'></fmt:formatDate>" required="required" readonly="readonly" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">更新者 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${dataDictionary.modifyBy}" id="m1" />
              <select name="modifyBy" id="modifyBy" class="form-control"  required="required" readonly="readonly"></select>
            </div>
            </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">最新更新时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input id="statusName" type="date" class="form-control col-md-7 col-xs-12"
              	name="modifyDate" value="<fmt:formatDate value='${dataDictionary.modifyDate}' pattern='yyyy-MM-dd'></fmt:formatDate>" readonly="readonly">
            </div>
          </div>
          </div>
          <div class="form-group">
            <div class="col-md-6 col-md-offset-3">
              <button id="send" type="submit" class="btn btn-success">保存</button>
              <button type="button" class="btn btn-primary" id="back">返回</button>
              <br/><br/>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<%@include file="../developer/common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/dataDictionarymodify.js"></script>