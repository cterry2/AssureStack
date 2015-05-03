IncrementVote = function(answerid)
{
	$.ajax({
		type: 'POST',
		url: "/upvote", 
		data: { answerid: answerid }
		}).success(function(data) {			
			$(".answer" + answerid).empty().append(data);
		}).error(function(jqXHR, ajaxOptions, thrownError){
			alert(jqXHR.status);
			alert(thrownError);
	});	
}

DecrementVote = function(answerid)
{
	$.ajax({
		type: 'POST',
		url: "/downvote", 
		data: { answerid: answerid }
		}).success(function(data) {			
			$(".answer" + answerid).empty().append(data);
		}).error(function(jqXHR, ajaxOptions, thrownError){
			alert(jqXHR.status);
			alert(thrownError);
	});	
}