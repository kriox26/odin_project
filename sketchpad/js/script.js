$(document).ready(function(){
	//Animations for the buttons
		$("#black").mouseover(function(){
			$("#black").fadeTo('fast',1);
		});
		$("#tilde").mouseover(function(){
			$("#tilde").fadeTo('fast',1);
		});
		$("#color").mouseover(function(){
			$("#color").fadeTo('fast',1);
		});
		$("#grey").mouseover(function(){
			$("#grey").fadeTo('fast',1);
		});
		$("#clear").mouseover(function(){
			$("#clear").fadeTo('fast',1);
		});
		$("#black").mouseleave(function(){
			$("#black").fadeTo('fast',0.75);
		});
		$("#tilde").mouseleave(function(){
			$("#tilde").fadeTo('fast',0.75);
		});
		$("#grey").mouseleave(function(){
			$("#grey").fadeTo('fast',0.75);
		});
		$("#color").mouseleave(function(){
			$("#color").fadeTo('fast',0.75);
		});
		$("#clear").mouseleave(function(){
			$("#clear").fadeTo('fast',0.75);
		});
		buildGrid(16);
		defaultPaint();
});

function numberSquares(){
	x = prompt("Squares per side ? (1-64)");
	if(x < 0){
		x = prompt("The number must be higher than 0!");
	}
	$(".square").remove();
	return x;
}

function buildGrid(size){
	box = Math.floor(960 / size);
	for (var i = 0; i < (size*size); i++) {
		$(".wrapper").append('<div class="square"></div>');
	};
$(".square").css("width",box);
	$(".square").css("height",box);
}

function defaultPaint(){
	$(".square").mouseover(function(){
		$(this).css("background-color",'white');
	});
}

function clearGrid(){
	x = numberSquares(); 
	buildGrid(x);
	defaultPaint();
}

function greyPaint(){
	x = numberSquares();
	buildGrid(x);
	$(".square").mouseover(function(){
		$(this).css("background-color",'grey');
	});
}

function randomColors(){
	letters = '0123456789ABCDEF'.split('');
	color = '#';
	for (var i = 0; i < 6; i++) {
		color+=letters[Math.floor(Math.random()*16)];
	};
	return color;
}
function colorPaint(){
	x = numberSquares();
	buildGrid(x);
	$(".square").mouseover(function(){
		color = randomColors();
		$(this).css("background-color",color);
	});
};

function blackPaint(){
	x = numberSquares();
	buildGrid(x);
	$(".square").mouseover(function(){
		$(this).css("background-color",'black');
	});
}
