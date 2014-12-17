$(document).ready(function(){
	//buttons efects
		$("#buttonb").mouseover(function(){
			$("#buttonb").fadeTo('fast',1);
		});
		$("#buttong").mouseover(function(){
			$("#buttong").fadeTo('fast',1);
		});
		$("#buttonc").mouseover(function(){
			$("#buttonc").fadeTo('fast',1);
		});
		$("#buttont").mouseover(function(){
			$("#buttont").fadeTo('fast',1);
		});
		$("#buttonb").mouseleave(function(){
			$("#buttonb").fadeTo('fast',0.5);
		});
		$("#buttong").mouseleave(function(){
			$("#buttong").fadeTo('fast',0.5);
		});
		$("#buttonc").mouseleave(function(){
			$("#buttonc").fadeTo('fast',0.5);
		});
		$("#buttont").mouseleave(function(){
			$("#buttont").fadeTo('fast',0.5);
		});
		$("#clear").mouseover(function(){
			$("#clear").fadeTo('fast',1);
		});
		$("#make").mouseover(function(){
			$("#make").fadeTo('fast',1);
		});
		$("#clear").mouseleave(function(){
			$("#clear").fadeTo('fast',0.5);
		});
		$("#make").mouseleave(function(){
			$("#make").fadeTo('fast',0.5);
		});
		$(".heading").mouseover(function(){
			$(".heading").fadeTo('fast',1);
		});
		$(".heading").mouseleave(function(){
			$(".heading").fadeTo('fast',0.5);
		});
	//grid program starts here	
	buildGrid(24);
});


function buildGrid(size){
	sqrw = Math.floor(960/size)-4;
	sqrh = Math.floor(960/size)-5;
	for (var i = 0; i < (size*size); i++) {
		$(".grid").append('<div class="square"></div>')
	};
	$(".square").css("width",sqrw);
	$(".square").css("height",sqrh);
	defaultPaint();
}

function defaultPaint(){
	$(".square").mouseover(function(){
		$(this).css("background-color",'black');
	});
};

function clearGrid(){
	x = prompt("How many squares per side?(1-64)");
	$(".square").remove();
	buildGrid(x)
}













