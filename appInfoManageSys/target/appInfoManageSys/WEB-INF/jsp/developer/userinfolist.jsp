<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>
<div class="clearfix"></div>
<div class="row">
	<div class="col-md-12">
		<div class="x_panel">
			<div class="x_title">
				<h2>
					个人账户信息维护 <i class="fa fa-user"></i><small>${devUserSession.devName}
						- 在此页面您可以通过搜索等其他操作对个人的信息进行修改、删除等管理操作。^_^</small>
				</h2>
				<div class="clearfix"></div>
			</div>
			<div class="x_content">
				<form method="post" action="list">
					<input type="hidden" name="pageIndex" value="1" />
			    <ul>
					<li>
						<div class="form-group">
							<label class="control-label col-md-3 col-sm-3 col-xs-12">开发者名称</label>
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input name="querySoftwareName" type="text" class="form-control col-md-7 col-xs-12" value="${querySoftwareName }">
							</div>
						</div>
					</li>
					<li><button type="submit" class="btn btn-primary"> 查 &nbsp;&nbsp;&nbsp;&nbsp;询 </button></li>
				</ul>
			</form>
		</div>
	</div>
</div>
<div class="col-md-12 col-sm-12 col-xs-12">
	<div class="x_panel">
		<div class="x_content">
			<p class="text-muted font-13 m-b-30"></p>
			<div id="datatable-responsive_wrapper"
				class="dataTables_wrapper form-inline dt-bootstrap no-footer">
				<div class="row">
					<div class="col-sm-12">
						<table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap dataTable no-footer dtr-inline collapsed"
							cellspacing="0" width="100%" role="grid" aria-describedby="datatable-responsive_info" style="width: 100%;">
							<thead>
								<tr role="row">
									<th class="sorting_asc" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="First name: activate to sort column descending"
										aria-sort="ascending">开发者名称</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										开发者帐号</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										开发者电子邮箱</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										开发者简介</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										创建者</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										创建时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										更新者</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										aria-label="Last name: activate to sort column ascending">
										最新更新时间</th>
									<th class="sorting" tabindex="0"
										aria-controls="datatable-responsive" rowspan="1" colspan="1"
										style="width: 124px;"
										aria-label="Last name: activate to sort column ascending">
										操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="devUserInfoList" items="${devUserInfoList}" varStatus="status">
									<tr role="row" class="odd">
										<td tabindex="0" class="sorting_1">${devUserInfoList.devName}</td>
										<td>${devUserInfoList.devCode}</td>
										<td>${devUserInfoList.devEmail }</td>
										<td>${devUserInfoList.devInfo }</td>
										<td><c:choose>
											<c:when test="${devUserInfoList.createdBy eq 1}">
												系统管理员
											</c:when>
											<c:when test="${devUserInfoList.createdBy eq 2}">
												超级管理员
											</c:when>
											<c:when test="${devUserInfoList.createdBy eq 3}">
												测试管理员
											</c:when>
											<c:otherwise>
												${devUserInfoList.createdBy}
											</c:otherwise>
										</c:choose></td>
										<td><fmt:formatDate value="${devUserInfoList.creationDate }"></fmt:formatDate></td>
										<td><c:choose>
											<c:when test="${devUserInfoList.modifyBy eq 1}">
												系统管理员
											</c:when>
											<c:when test="${devUserInfoList.modifyBy eq 2}">
												超级管理员
											</c:when>
											<c:when test="${devUserInfoList.modifyBy eq 3}">
												测试管理员
											</c:when>
											<c:otherwise>
												${devUserInfoList.modifyBy}
											</c:otherwise>
										</c:choose></td>
										<td><fmt:formatDate value="${devUserInfoList.modifyDate }"></fmt:formatDate></td>
										<td>
										<div class="btn-group">
                      <button type="button" class="btn btn-danger">点击操作</button>
                      <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu" role="menu">
                        <li><a class="addDevUser" devUserid="${devUserInfoList.id }" data-toggle="tooltip" data-placement="top" title="" data-original-title="新增用户信息">新增</a>
                        </li>
                        <li><a class="modifyDevUser"
							   devUserid="${devUserInfoList.id}"
											data-toggle="tooltip" data-placement="top" title="" data-original-title="修改用户信息">修改</a>
                        </li>
                        <li><a  class="viewDevUser" devUserid="${devUserInfoList.id }"  data-toggle="tooltip" data-placement="top" title="" data-original-title="查看用户信息">查看</a></li>
						<li><a  class="deleteUser" devUserid="${devUserInfoList.id }" data-toggle="tooltip" data-placement="top" title="" data-original-title="删除用户信息">删除</a></li>
                      </ul>
                    </div>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<div class="dataTables_info" id="datatable-responsive_info"
							role="status" aria-live="polite">共${pages.totalCount }条记录
							${pages.currentPageNo }/${pages.totalPageCount }页</div>
					</div>
					<div class="col-sm-7">
						<div class="dataTables_paginate paging_simple_numbers"
							id="datatable-responsive_paginate">
							<ul class="pagination">
								<c:if test="${pages.currentPageNo > 1}">
									<li class="paginate_button previous"><a
										href="javascript:page_nav(document.forms[0],1);"
										aria-controls="datatable-responsive" data-dt-idx="0"
										tabindex="0">首页</a>
									</li>
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo-1});"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">上一页</a>
									</li>
								</c:if>
								<c:if test="${pages.currentPageNo < pages.totalPageCount }">
									<li class="paginate_button "><a
										href="javascript:page_nav(document.forms[0],${pages.currentPageNo+1 });"
										aria-controls="datatable-responsive" data-dt-idx="1"
										tabindex="0">下一页</a>
									</li>
									<li class="paginate_button next"><a
										href="javascript:page_nav(document.forms[0],${pages.totalPageCount });"
										aria-controls="datatable-responsive" data-dt-idx="7"
										tabindex="0">最后一页</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>
</div>
<%@include file="common/footer.jsp"%>
<script src="${pageContext.request.contextPath }/statics/localjs/rollpage.js"></script>

<script src="${pageContext.request.contextPath }/statics/localjs/devUserinfolist.js"></script>
