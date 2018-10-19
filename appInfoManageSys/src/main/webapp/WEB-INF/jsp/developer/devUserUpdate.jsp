<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../developer/common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="x_panel">
      <div class="x_title">
        <h2>个人信息的维护<i class="fa fa-user"></i><small>${devUserSession.devName}</small></h2>
             <div class="clearfix"></div>
      </div>
      <div class="x_content">
        <form class="form-horizontal form-label-left" action="/dev/flatform/devUser/BackendmodifysaveByPerson" method="post">
          <input type="hidden" name="id" id="id" value="${devUserSession.id}">
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">开发者名称 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="softwareName" class="form-control col-md-7 col-xs-12"
               data-validate-length-range="20" data-validate-words="1" 
               name="devName" value="${devUserSession.devName}" required="required"
               placeholder="请输入开发者名称" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">开发者帐号 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="APKName" type="text" class="form-control col-md-7 col-xs-12"
                     name="devCode" value="${devUserSession.devCode}">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">开发者密码 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="devPassword" type="text" class="form-control col-md-7 col-xs-12"
              name="devPassword" value="${devUserSession.devPassword}">
            </div>
          </div>
          
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">开发者电子邮箱<span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="supportROM" class="form-control col-md-7 col-xs-12" 
              	name="devEmail" value="${devUserSession.devEmail}" required="required"
              	data-validate-length-range="20" data-validate-words="1" 
              	placeholder="请输入开发者电子邮箱" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">开发者简介 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input id="interfaceLanguage" class="form-control col-md-7 col-xs-12" 
              data-validate-length-range="20" data-validate-words="1"  required="required"
              name="devInfo" value="${devUserSession.devInfo}"
              placeholder="请输入开发者简介" type="text">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建者 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${devUserSession.createdBy}" id="u1" />
              <select name="createdBy" id="createdBy" class="form-control"  required="required" readonly="readonly"></select>
            </div>
          </div>

          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="number">创建时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="date" id="downloads" name="creationDate" value="<fmt:formatDate value='${devUserSession.creationDate}' pattern='yyyy-MM-dd'></fmt:formatDate>" required="required" readonly="readonly" class="form-control col-md-7 col-xs-12">
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">更新者 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
              <input type="hidden" value="${devUserSession.modifyBy}" id="m1" />
              <select name="modifyBy" id="modifyBy" class="form-control"  required="required"></select>
            </div>
          </div>
          <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-12" for="name">最新更新时间 <span class="required">*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-12">
            	<input id="statusName" type="text" class="form-control col-md-7 col-xs-12"
              	name="modifyDate" value="<fmt:formatDate value='${devUserSession.modifyDate}' pattern='yyyy-MM-dd'></fmt:formatDate>" readonly="readonly">
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
<script src="${pageContext.request.contextPath }/statics/localjs/devUsermodify.js"></script>