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


Changekeyword = function(keyid)
{
	alert(keyid);
	$.ajax({
		type: 'POST',
		url: "/accountroles", 
		data: { keywordid: keyid}
		}).success(function(data) {			
			alert("success");
		}).error(function(jqXHR, ajaxOptions, thrownError){
			alert(jqXHR.status);
			alert(thrownError);
	});
}
