<html>
<body>
	<h1>${message}</h1>
	<table >
		<c: var="teacher">
			<tr>
				<th>name</th>
				<td><a href="/showteacher/${tercher.name}">${tercher.name}</a></td>
			</tr>
			<tr>
				<th>age</th>
				<td>${tercher.age}</td>
			</tr>
			<tr>
				<th>school</th>
				<th>${tercher.school}</th>
			</tr>
		</c:>
	</table>
</body>
</html>