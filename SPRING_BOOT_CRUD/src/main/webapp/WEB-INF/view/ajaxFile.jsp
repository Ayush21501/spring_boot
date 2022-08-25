<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ajaxFile.jsp</title>
</head>

	<script type="text/javascript">
	
		function fan()
		{
			
			var fn = document.getElementById("firstName");
			var ln = document.getElementById("lastName");
		
			var htp = new XMLHttpRequest();
			
			htp.onreadystatechange = function() {			
				
				if(htp.readyState == 4)	
				{
					alert(htp.responseText);
					
					var jsn = JSON.parse(htp.responseText);
					console.log('jsn', jsn);

				
					var a = document.getElementById("tab");
					
					var tableData = '<tr><td>NO.</td>'+'<td>FirstName</td>'+'<td>LastName</td></tr>'
					
					for(var i=0; i<jsn.length; i++ )
					{
						var id = jsn[i].id;
						var fname = jsn[i].firstName;
						var lname = jsn[i].lastName;
						
						tableData = tableData + '<tr><td>' + id + '</td>'
								+ '<td>' + fname + '</td>' + '<td>' + lname + '</td>'
								+ '</tr>';

					}
					a.innerHTML = tableData;
				}
			}
			
			htp.open("get","ajaxinsert?fn="+fn.value+"&ln="+ln.value+" ",true);
			htp.send();
				
		}
	
		
		function f1()
		{
			var fn = document.getElementById("firstName");
			var labelId = document.getElementById("labelId");
			var htp = new XMLHttpRequest();
			
			htp.onreadystatechange = function() {				
				if(htp.readyState == 4)	
				{
					
					console.log(htp.responseText);
					labelId.innerHTML = htp.responseText;
					
				}
			}
			
			htp.open("get","validfn?Firstname="+fn.value,true);
			htp.send();
			
			
		}
		
		
		
	</script>


<body>

	<table border="1px solid black">
		<tr>
			<td>First Name: </td>
			<td>	<input type="text" name="firstName" id="firstName" onblur="f1()"> </td>
			
		</tr>
	<tr><td><label id="labelId"></label></td></tr>
		<tr>
			<td>Last Name:</td>
			<td><input type="text" name="lastName" id="lastName"></td>
		</tr>

		<tr>
			<td colspan="2"><input type="submit" onclick="fan()"></td>
		</tr>
	</table>

	
	<table border="1px solid black" id="tab">
		<tr>
			<td>Id</td>
			<td>FirstName</td>
			<td>LastName</td>
		</tr>	
	</table>
	

</body>
</html>