
  <c:if test="${not empty products}">
					<c:forEach items="${products}" var="product">
						<tr>
							<td>${product.id}</td>
							<td>${product.src}</td>
							<td>${product.name}</td>
							<td>${product.attr}</td>
							<td>${product.price}</td>
							<td>${product.stock}</td>
							<td>1</td>
						</tr>
					</c:forEach>
					<tr></tr>
			
					</c:if>
					    <thead>
	                  <tr>
						<th>编号</th>
						<th>图片</th>
						<th>名称</th>
						<th>类别</th>
						<th>价格</th>
						<th>库存</th>
						<th>操作</th>
					</tr>	
                  </thead>