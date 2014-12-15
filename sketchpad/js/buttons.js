$(document).ready(function(){
	//animations for the buttons
		$("#black").mouseover(function(){
			$("#black").fadeTo('fast',1);
		});
		$("#grey").mouseover(function(){
			$("#grey").fadeTo('fast',1);
		});
		$("#colors").mouseover(function(){
			$("#colors").fadeTo('fast',1);
		});
		$("#clear").mouseover(function(){
			$("#clear").fadeTo('fast',1);
		});
		$("#black").mouseleave(function(){
			$("#black").fadeTo('fast',0.75);
		});
		$("#grey").mouseleave(function(){
			$("#grey").fadeTo('fast',0.75);
		});
		$("#colors").mouseleave(function(){
			$("#colors").fadeTo('fast',0.75);
		});
		$("#clear").mouseleave(function(){
			$("#clear").fadeTo('fast',0.75);
		});
	//here starts the actual grid program
});
