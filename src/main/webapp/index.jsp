<!DOCTYPE HTML>
<html>
<head>

<title>Index</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>
<body>

	


<div class="container">
    <div class="row">
        <div class="span12">
            <ul class="nav nav-tabs" id="myTabs">
              <li class="active"><a href="#employee" data-toggle="tab">Employee</a></li>
              <li><a href="#family" data-toggle="tab">Family</a></li>
              <li><a href="#education" data-toggle="tab">Education</a></li>
              <li><a href="#experience" data-toggle="tab">Experience</a></li>
              <li><a href="#ability" data-toggle="tab">Ability</a></li>
              <li><a href="#reference" data-toggle="tab">Reference</a></li>
              <li><a href="#reward" data-toggle="tab">Reward</a></li>
              <li><a href="#history" data-toggle="tab">History</a></li>
            </ul>
            
            <div class="tab-content">
              <div class="tab-pane active" id="employee">
                  <iframe src="${pageContext.request.contextPath}/employee" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="family">
                  <iframe src="${pageContext.request.contextPath}/family/" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="education">
                  <iframe src="${pageContext.request.contextPath}/education" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="experience">
                  <iframe src="${pageContext.request.contextPath}experience" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="ability">
                  <iframe src="${pageContext.request.contextPath}/ability" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="reference">
                  <iframe src="${pageContext.request.contextPath}/reference" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="reward">
                  <iframe src="${pageContext.request.contextPath}/reward" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
              
              <div class="tab-pane" id="history">
                  <iframe src="${pageContext.request.contextPath}/history" style="width: 100%; height: 600px; " 
		marginwidth="0" marginheight="0" frameborder="0"
		vspace="0" hspace="0"></iframe>
              </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
