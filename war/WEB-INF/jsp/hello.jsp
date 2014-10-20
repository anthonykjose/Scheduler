<%@ include file="/WEB-INF/jsp/include.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap -->
<link href="<c:url value="css/bootstrap.min.css" />" rel="stylesheet">
<link
	href="<c:url value="/bower_components/seiyria-bootstrap-slider/css/bootstrap-slider.css" />"
	rel="stylesheet">

<link href="<c:url value="css/bootstrap-glyphicons.css" />"
	rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="<c:url value="js/bootstrap.min.js"/>"></script>
<script
	src="<c:url value="bower_components/seiyria-bootstrap-slider/js/bootstrap-slider.js"/>"></script>
</head>
<body>
	<div class="container">
		<h3 align=center style="font-size: 48px; font-weight: bold">
			<span class="label label-primary">Am I</span> Around
		</h3>
		<div
			style="max-width: 600px; display: block; margin-left: auto; margin-right: auto;">
			<ul class="pager">
				<li class="previous"><a style="font-weight: bold"
					href="<c:url value="/main.htm"/>">&larr; Older</a></li>
				<li class="next"><a style="font-weight: bold"
					href="<c:url value="/main.htm"/>">Newer &rarr;</a></li>
			</ul>
			<div class="panel panel-default">
				<div class="panel-heading">
					<!-- Sum of width of all elements in the div container should add up to 399 px to ensure centering -->
					<div style="margin-left: auto; margin-right: auto; max-width: 500px">
						<div class="row">
							<!-- Left time marker -->
							<div class="col-md-2" style="text-align:center; padding: 7px 0px;">
								<span id="ex1CurrentSliderValLabel" style="margin: auto" ><span ><p class="text-muted" id="ex1SliderVal">00:00</p></span></span>
							</div>
							<!-- Center selector - 50% of total space usage. Hence md-6 -->
							<div class="col-md-6" style="text-align:center; padding: 7px 0px;">
								<input id="ex2" type="text" class="span2" value=""
									data-slider-tooltip="hide" data-slider-min="0"
									data-slider-max="1440" data-slider-step="5"
									data-slider-value="[250,450]" style="margin: auto" />
							</div>
							<!-- Right time marker -->
							<div class="col-md-2" style="text-align:center; padding: 7px 0px;">
								<span id="ex2CurrentSliderValLabel" style="margin: auto"><span
									><p class="text-muted" id="ex2SliderVal">24:00</p></span></span>
							</div>
							<div class="col-md-2" style="text-align:center; padding: 0px 15px;">
								<!-- Book the time slot button -->
								<button type="button" class="btn btn-success navbar-btn btn-block" style="margin: auto">Book!</button>
							</div>
						</div>
					</div>
				</div>
				<div class="panel-body">
					<!-- General information alert box. -->
					<div class="alert alert-info alert-dismissable">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">&times;</button>
						<strong>Start Here!</strong> Pick a time slot below and set the
						time range above for your new booking.
					</div>
					<!-- Time slots. -->
					<div class="list-group">
						<c:forEach items="${model.slots}" var="slot">
							<a href="#"
								class=<c:choose>
										<c:when test="${slot.type=='Free'}">"list-group-item list-group-item-success free-slot" data-toggle="modal" data-target="#slotModifyModal"</c:when>
										<c:otherwise>"list-group-item list-group-item-danger occupied-slot"</c:otherwise></c:choose>>
								<c:out value="${slot.timeRange}" />
							</a>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#ex2").slider({});
		// conver a number num to string, pad 0.
		function format(num) {
			var xx = num.toString();
			if (xx.length === 1) {
				return "0" + xx;
			} else {
				return xx;
			}
		}

		$("#ex2").on(
				'slide',
				function(slideEvt) {
					var data = String(slideEvt.value);
					var data_array = data.split(",");

					var start = data_array[0];
					var end = data_array[1];

					$("#ex1SliderVal").text(
							format(Math.floor(start / 60)) + ":"
									+ format(start % 60));
					$("#ex2SliderVal").text(
							format(Math.floor(end / 60)) + ":"
									+ format(end % 60));

				});
		$(".free-slot").click(function() {
			var text = $(this).text();
			text.split("->");
			$("#ex1SliderVal").text();
			$("#ex2SliderVal").text();
		});
	</script>

</body>
</html>