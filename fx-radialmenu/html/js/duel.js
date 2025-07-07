var CD = {

	isPlay: false,
	isStop: false,

	anim: function (n) {
		setTimeout(function () {
			countdown.style.opacity = "1";
			countdown.style.fontSize = "5em";

			if (CD.isPlay == false) {
				n++;
				countdown.innerText = n;
				countdown.style.top = "20%";
				countdown.style.color = "rgb(255,255,255)";
				CD.isPlay = true;
			}
			else if (CD.isStop == true) {
				countdown.style.top = "5%";
				countdown.style.opacity = "0";
				CD.isPlay = false;
				CD.isStop = false;
				return;
			}

			n--;
			if (n == 0) {
				countdown.style.color = "rgb(196,0,0)";

				countdown.innerText = "START!";
				CD.tick("last");

				setTimeout(function () {
					countdown.style.top = "5%";
					countdown.style.opacity = "0";
					CD.isPlay = false;
				}, 1500)
				return;
			}
            else if (n < 4) {
				countdown.style.color = "rgb(196,0,0)";
                CD.tick("");
			}
			else if (n < 10) {
				countdown.style.color = "rgb(255,255,255)";
			}
			countdown.innerText = n;
			setTimeout(function () {
				countdown.style.fontSize = "6em";
				countdown.style.opacity = "0";
				CD.anim(n);
			}, 500);
		}, 500);
	},

	tick: function (type) {
		var audio = new Audio();
		if (type == "last") {
			audio.src = 'sound/tick.mp3';
		}
		else {
			audio.src = 'sound/countdown.mp3';
		}
		audio.autoplay = true;
	}
};

$(document).ready(function () {
    window.addEventListener('message', (event) => {
        if (!event.data || !event.data.countdown) {
            // console.log("Event data or countdown is undefined");
            return;
        }
        let num = event.data.countdown
        if (CD.isPlay == true) {
            if (num == "stop") {
                CD.isStop = true;
                countdown.innerText = "stop";
                countdown.style.color = "rgb(255,55,55)";
                console.log("stop countdown");
            }
            else {
                console.log("the countdown is already running");
            }
        }
        else if (Number.isInteger(parseInt(num, 10))) {
            CD.anim(num);
        }
        else {
            console.log("Use a number");
        }
    });
});
