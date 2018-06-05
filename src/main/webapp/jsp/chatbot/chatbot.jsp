<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Button trigger modal -->
<button class="btn btn-toggle" data-toggle="modal" data-target="#myModal">Show / Hide</button>

<div class="modal fade" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header"></div>
      <div class="modal-body">
        Hello! Webisfree.com
      </div>
      <div class="modal-footer"></div>
    </div>
  </div>
</div>

<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script type="text/javascript">
$('#myModal').modal({
	  keyboard: false
	})
</script>
</body>
</html>