var HudAutoHide = false;
var onEditMenu= false;
var defaultHudCheckedData = {};
var DisableNumbersAboveCores = false;
var currentHudData = {
    ".horse-stamina": 0,
    ".horse-health": 0,
    ".dirty": 0,
    ".stress": 0,
    ".thirst": 0,
    ".hungry": 0,
    ".alcohol": 0,
    ".stamina": 0,
    ".health": 0,
    ".microphone": 0,
    ".temp": 0,
    ".onesync": 0,
    ".level-bar": 0,

}

var currentHudPositionData = {
    ".horse-stamina": { left: "2%", top: "5%" },
    ".horse-health": { left: "2%", top: "5%" },
    ".dirty": { left: "2%", top: "5%" },
    ".stress": { left: "2%", top: "5%" },
    ".thirst": { left: "2%", top: "5%" },
    ".hungry": { left: "2%", top: "5%" },
    ".stamina": { left: "2%", top: "5%" },
    ".health": { left: "2%", top: "5%" },
    ".microphone": { left: "2%", top: "5%" },
    ".temp": { left: "2%", top: "5%" },
    ".onesync": { left: "2%", top: "5%" },
    ".alcohol": { left: "2%", top: "5%" },

    ".server-logo": { left: "2%", top: "5%" },
    ".level": { left: "2%", top: "5%" },
    ".hour": { left: "2%", top: "5%" },
    ".cash": { left: "2%", top: "5%" },
    ".gold": { left: "2%", top: "5%" },
    ".id": { left: "2%", top: "5%" },

    ".notify-container": { left: "0%", top: "5%" },
}
var currentHudSizeData = {
    ".horse-stamina": { left: "2%", top: "5%" },
    ".horse-health": { left: "2%", top: "5%" },
    ".dirty": { left: "2%", top: "5%" },
    ".stress": { left: "2%", top: "5%" },
    ".thirst": { left: "2%", top: "5%" },
    ".hungry": { left: "2%", top: "5%" },
    ".stamina": { left: "2%", top: "5%" },
    ".health": { left: "2%", top: "5%" },
    ".microphone": { left: "2%", top: "5%" },
    ".temp": { left: "2%", top: "5%" },
    ".onesync": { left: "2%", top: "5%" },
    ".alcohol": { left: "2%", top: "5%" },
}

var currentSizeData = {
    ".horse-stamina": {},
    ".horse-health": {},
    ".dirty": {},
    ".stress": {},
    ".thirst": {},
    ".hungry": {},
    ".alcohol": {},
    ".stamina": {},
    ".health": {},
    ".microphone": {},
    ".temp": {},
    ".onesync": {},
    ".server-logo": {},
    ".level": {},
    ".level-text": {},
    ".level-xp": {},
}

var homeSettingsData = {
    ".health": 1,
    ".stamina": 1,
    ".hungry": 1,
    ".thirst": 1,
    ".stress": 1,
    ".dirty": 1,
    ".microphone": 1,
    ".temp": 1,
    ".onesync": 1,
    ".alcohol": 1,
    ".horse-health": 1,
    ".horse-stamina": 1,

    ".level": 1,
    ".hour": 1,
    ".cash": 1,
    ".gold": 1,
    ".id": 1,
}
const homesettings = {
    ".checkboxhealth": ".health",
    ".checkboxstamina": ".stamina",
    ".checkboxhungry": ".hungry",
    ".checkboxthirst": ".thirst",
    ".checkboxstress": ".stress",
    ".checkboxdirty": ".dirty",
    ".checkboxmic": ".microphone",
    ".checkboxtemp": ".temp",
    ".checkboxonesync": ".onesync",
    ".checkboxlevel": ".level",
    ".checkboxhour": ".hour",
    ".checkboxcash": ".cash",
    ".checkboxgold": ".gold",
    ".checkboxid": ".id",
    ".checkboxalcohol": ".alcohol"
}
var hudColorSettings = {
    "level2": ".level-bar",
    "health2": ".health #icon",
    "stamina2": ".stamina #icon",
    "hungry2": ".hungry #icon",
    "thirst2": ".thirst #icon",
    "alcohol2": ".alcohol #icon",
    "stress2": ".stress #icon",
    "dirty2": ".dirty #icon",
    "temp2": ".temp-value",
    "microphone2": ".microphone #icon",
    "onesync2": ".onesync #icon",
    "horse-health2": ".horse-health #icon",
    "horse-stamina2": ".horse-stamina #icon",
    "gold2": "#gold-icon",
    "cash2": "#cash-icon",
    "id2": "#id-icon",
    "hour2": "#hour-icon",
    "health1": ".health .progress-bar",
    "stamina1": ".stamina .progress-bar",
    "hungry1": ".hungry .progress-bar",
    "thirst1": ".thirst .progress-bar",
    "alcohol1": ".alcohol .progress-bar",
    "stress1": ".stress .progress-bar",
    "dirty1": ".dirty .progress-bar",
    "microphone1": ".microphone .progress-bar",
    "temp1": ".temp .progress-bar",
    "onesync1": ".onesync .progress-bar",
    "horse-health1": ".horse-health .progress-bar",
    "horse-stamina1": ".horse-stamina .progress-bar",
    "level1": ".levelx",
    "hour1": ".hour-text",
    "cash1": ".cash-value",
    "gold1": ".gold-value",
    "id1": ".id-text"

}
var hudForceColor = {}
var hudColorData = {
    ".level-bar": "#ffffff",
    ".health #icon": "#ffffff",
    ".stamina #icon": "#ffffff",
    ".hungry #icon": "#ffffff",
    ".thirst #icon": "#ffffff",
    ".alcohol #icon": "#ffffff",
    ".stress #icon": "#ffffff",
    ".dirty #icon": "#ffffff",
    ".temp-value": "#ffffff",
    ".microphone #icon": "#ffffff",
    ".onesync #icon": "#ffffff",
    ".horse-health #icon": "#ffffff",
    ".horse-stamina #icon": "#ffffff",
    "#gold-icon": "#ffffff",
    "#cash-icon": "#ffffff",
    "#id-icon": "#ffffff",
    "#hour-icon": "#ffffff",
    ".health .progress-bar": "#ffffff",
    ".stamina .progress-bar": "#ffffff",
    ".hungry .progress-bar": "#ffffff",
    ".thirst .progress-bar": "#ffffff",
    ".alcohol .progress-bar": "#ffffff",
    ".stress .progress-bar": "#ffffff",
    ".dirty .progress-bar": "#ffffff",
    ".microphone .progress-bar": "#ffffff",
    ".temp .progress-bar": "#ffffff",
    ".onesync .progress-bar": "#ffffff",
    ".horse-health .progress-bar": "#ffffff",
    ".horse-stamina .progress-bar": "#ffffff",
    ".levelx": "#ffffff",
    ".hour-text": "#ffffff",
    ".cash-value": "#ffffff",
    ".gold-value": "#ffffff",
    ".id-text": "#ffffff"
}
var progressIsBussy = false;
$(document).ready(function () {

    function resetHudData() {
        $(".notify-container").html('')
        $(".notify-container").css({
            "background-color": 'rgba(0, 0, 0, 0.0)'
        })
        if (window.innerWidth >= 3440) {
            currentSizeData = {
                ".horse-stamina": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".horse-health": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".dirty": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".stress": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".thirst": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".hungry": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".alcohol": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".stamina": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".health": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".microphone": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".temp": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".onesync": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".server-logo": { "height": "7%", "width": "5%" },
                ".level": { "width": "15%", "height": "5%", "border-radius": "10px" },
                ".level-text": { "width": "35%", "height": "35%", "font-size": "1.0vh" },
                ".level-xp": { "width": "35%", "height": "35%", "font-size": "1.0vh" },
            }
        } else {
            currentSizeData = {
                ".horse-stamina": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".horse-health": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".dirty": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".stress": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".thirst": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".hungry": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".alcohol": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".stamina": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".health": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".microphone": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".temp": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".onesync": { "width": "1.8%", "height": "3.1%", "border-radius": "50%", "font-size": "1.5vh" },
                ".server-logo": { "height": "7%", "width": "5%" },
                ".level": { "width": "15%", "height": "5%", "border-radius": "10px" },
                ".level-text": { "width": "35%", "height": "35%", "font-size": "1.0vh" },
                ".level-xp": { "width": "35%", "height": "35%", "font-size": "1.0vh" },
            }
        }
        currentHudPositionData = {
            ".horse-stamina": { left: "0.5%", top: "96%" },
            ".horse-health": { left: "0.5%", top: "96%" },
            ".dirty": { left: "0.5%", top: "96%" },
            ".stress": { left: "0.5%", top: "96%" },
            ".thirst": { left: "0.5%", top: "96%" },
            ".hungry": { left: "0.5%", top: "96%" },
            ".stamina": { left: "0.5%", top: "96%" },
            ".health": { left: "0.5%", top: "96%" },
            ".microphone": { left: "0.5%", top: "96%" },
            ".temp": { left: "0.5%", top: "96%" },
            ".onesync": { left: "0.5%", top: "96%" },
            ".alcohol": { left: "0.5%", top: "96%" },

            ".server-logo": { left: "89%", top: "6%" },
            ".level": { left: "72%", top: "95%" },
            ".cash": { left: "90%", top: "1%" },
            ".gold": { left: "90%", top: "5%" },
            ".hour": { left: "90%", top: "9%" },
            ".id": { left: "90%", top: "13%" },

            ".notify-container": { left: "1%", top: "5%" },
        }
        currentHudSizeData = {
            ".horse-stamina": { left: "2%", top: "5%" },
            ".horse-health": { left: "2%", top: "5%" },
            ".dirty": { left: "2%", top: "5%" },
            ".stress": { left: "2%", top: "5%" },
            ".thirst": { left: "2%", top: "5%" },
            ".hungry": { left: "2%", top: "5%" },
            ".stamina": { left: "2%", top: "5%" },
            ".health": { left: "2%", top: "5%" },
            ".microphone": { left: "2%", top: "5%" },
            ".temp": { left: "2%", top: "5%" },
            ".onesync": { left: "2%", top: "5%" },
            ".alcohol": { left: "2%", top: "5%" },
        }
        homeSettingsData = {
            ".health": 1,
            ".stamina": 1,
            ".hungry": 1,
            ".thirst": 1,
            ".stress": 1,
            ".dirty": 1,
            ".microphone": 1,
            ".temp": 1,
            ".onesync": 1,
            ".alcohol": 1,
            ".horse-health": 1,
            ".horse-stamina": 1,

            ".level": 1,
            ".hour": 1,
            ".cash": 1,
            ".gold": 1,
            ".id": 1,
        }
        hudColorData = {
            ".level-bar": "#ffffff",
            ".health #icon": "#ffffff",
            ".stamina #icon": "#ffffff",
            ".hungry #icon": "#ffffff",
            ".thirst #icon": "#ffffff",
            ".alcohol #icon": "#ffffff",
            ".stress #icon": "#ffffff",
            ".dirty #icon": "#ffffff",
            ".temp-value": "#ffffff",
            ".microphone #icon": "#ffffff",
            ".onesync #icon": "#ffffff",
            ".horse-health #icon": "#ffffff",
            ".horse-stamina #icon": "#ffffff",
            "#gold-icon": "#ffffff",
            "#cash-icon": "#ffffff",
            "#id-icon": "#ffffff",
            "#hour-icon": "#ffffff",
            ".health .progress-bar": "#ffffff",
            ".stamina .progress-bar": "#ffffff",
            ".hungry .progress-bar": "#ffffff",
            ".thirst .progress-bar": "#ffffff",
            ".alcohol .progress-bar": "#ffffff",
            ".stress .progress-bar": "#ffffff",
            ".dirty .progress-bar": "#ffffff",
            ".microphone .progress-bar": "#ffffff",
            ".temp .progress-bar": "#ffffff",
            ".onesync .progress-bar": "#ffffff",
            ".horse-health .progress-bar": "#ffffff",
            ".horse-stamina .progress-bar": "#ffffff",
            ".levelx": "#ffffff",
            ".hour-text": "#ffffff",
            ".cash-value": "#ffffff",
            ".gold-value": "#ffffff",
            ".id-text": "#ffffff"
        }

        $(".ui-panel").slideUp()
        // $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        onloadFunc({
            currentHudPositionData: currentHudPositionData,
            currentHudSizeData: currentHudSizeData,
            currentSizeData: currentSizeData,
            homeSettingsData: homeSettingsData,
            hudColorData: hudColorData,
        })

    }

    $(".showvoicerange").hide();
    $(".ui-panel").hide()
    onEditMenu= false;
    for (key in currentHudData) {
        $(key).hide()
    }
    $(".cash").hide()
    $(".gold").hide()
    $(".id").hide()
    $(".level").hide()
    $(".server-logo").hide()
    $(".hour").hide()

    function setSvgProgressById(id, value, color = '#ffffff') {
        const circle = document.querySelector(`${id} .progress-circle`);
        const radius = 45;
        const circumference = 2 * Math.PI * radius;
        const offset = circumference - (value / 100) * circumference;
      
        if (!circle) return;
        circle.style.strokeDasharray = `${circumference}`;
        circle.style.strokeDashoffset = offset;
        circle.style.stroke = color;
      }
      
      
    function setProgress(divname, value, autohide) {
        const pureKey = divname.replace('.', '');

        if (defaultHudCheckedData[pureKey]) {
            // console.log(`⛔ setProgress: ${pureKey} defaultHudCheckedData nedeniyle iptal`);
            return;
        }
        var currentValue = currentHudData[divname];
        const animatedElements = [".health", ".stamina", ".horse-stamina", ".horse-health", ".hungry", ".thirst", ".alcohol"];
        HudAutoHide = autohide
        if (autohide) {
            if (value <= 0 && divname !== ".temp") {
                $(divname).fadeOut();
            } else if (homeSettingsData[divname] === 1 || homeSettingsData[divname] === undefined) {
                $(divname).fadeIn();
            } 
        } else {
            if (value <= 0 && (divname === ".horse-stamina" || divname === ".horse-health")) {
                $(divname).fadeOut();
            } else if (divname === ".horse-stamina" || divname === ".horse-health") {
                $(divname).fadeIn();
            }
        }

       
        if (divname == ".temp") {
            $(".temp-value").html(`${value}°`)
        }
        if (animatedElements.includes(divname) && currentValue > value) {
            StartAnimation(divname, "-");
            let eksilen = currentValue - value
            if (eksilen > 5){
                eksilen = eksilen * -1
                usedItem(divname,eksilen.toFixed(0))
            } 
        } else if (animatedElements.includes(divname) && currentValue == value) {
            StopAnimation(divname);
        } else if (animatedElements.includes(divname) && currentValue < value) {
            StartAnimation(divname, "+");
            let eksilen = value - currentValue
            if (eksilen > 5){
                usedItem(divname,eksilen.toFixed(0))
            } 
        }
        var renk = hudColorData[divname + " .progress-bar"]

        if (divname == ".level-bar") {
            renk = hudColorData[divname]
        }
        if (renk === undefined) {
            renk = "#ffffff"
        }
        if (hudForceColor[divname + " .progress-bar"]) {
            renk = hudForceColor[divname + " .progress-bar"]
        }

        if (hudForceColor[divname + " #icon"]) {
            let renk2 = hudForceColor[divname + " #icon"]
            $(divname + " #icon").css({
                'color': renk2
            })
        } else {
            let renk2 = hudColorData[divname + " #icon"]
            $(divname + " #icon").css({
                'color': renk2
            })

        }
        if (!onEditMenu) {
            if (divname === ".onesync" && value > 32) {
                renk = "#ff0000";
                $(divname + " #icon").css({ 'color': "#ff0000" });
            } else if (divname === ".onesync" && value > 28) {
                renk = "#ffff00";
                $(divname + " #icon").css({ 'color': "#ffff00" });
            }
        }
        
        currentHudData[divname] = value
        if (divname == ".level-bar") {
            $(".level-bar").css({
                'background': `linear-gradient(to right, ${renk} ${value}%, transparent 0% 100%), linear-gradient(to right, rgb(0, 0, 0) 100%, transparent 80% 100%)`
            });
        } else {
            setSvgProgressById(divname, value, renk);
        }
    }


    function closeAllSettings() {
        $(".hud-settings").hide()
        $(".home-container").hide()
        $(".hud-size-container").hide()
    }
    $("#home-btn").on("click", function () {
        closeAllSettings()
        $(".home-container").show();
    })
    $("#hud-color-btn").on("click", function () {
        closeAllSettings()
        $(".hud-settings").show();
    })
    $("#hud-setting-btn").on("click", function () {
        closeAllSettings()
        $(".hud-size-container").show();
    })

    for (let key in homesettings) {
        $(key).on("change", function () {
            let settingKey = homesettings[key];      
            let pureKey = settingKey.replace(/^\./, ""); 
    
            if (defaultHudCheckedData[pureKey] === true) {
                $(this).prop("checked", false).prop("disabled", true);
                $(settingKey).hide();
                return;
            }
    
            if ($(this).is(":checked")) {
                homeSettingsData[settingKey] = 1;
                $(settingKey).fadeIn();
            } else {
                homeSettingsData[settingKey] = 0;
                $(settingKey).fadeOut();
            }
        });
    }
    
    
    for (let key in currentHudPositionData) {
        currentHudPositionData[key].top = $(key).css('top');
        currentHudPositionData[key].left = $(key).css('left');
    }
    for (let key in currentSizeData) {
        currentSizeData[key]["width"] = $(key).css('width');
        currentSizeData[key]["height"] = $(key).css('height');
        currentSizeData[key]["border-radius"] = $(key + " .progress-bar").css('border-radius');
        currentSizeData[key]["font-size"] = $(key + " #icon").css('font-size');
    }

    for (let key in currentHudPositionData) {
        $(key).draggable({
            start: function (event, ui) {
                $(key).css({
                    'position': 'absolute',
                })
            },
            stop: function (event, ui) {
                currentHudPositionData[key].left = ui.position.left + "px"
                currentHudPositionData[key].top = ui.position.top + "px"

            }
        });
    }



    function changeProgressColor(div, color) {
        let baseDiv = div.replace(" .progress-bar", "");
        hudColorData[div] = color;
    
        // Eğer eski sistemde kalan .level-bar gibi bir şeyse, eski yöntemle güncelle
        if (div === ".level-bar") {
            $(div).css({
                'background': `linear-gradient(to right, ${color} 79%, transparent 80% 100%),
                               linear-gradient(to right, rgb(0, 0, 0) 100%, transparent 80% 100%)`
            });
        } else {
            let className = baseDiv.replace(".", ""); 
            let value = currentHudData[baseDiv] || 0;
    
            let circle = $(`.${className} .progress-circle`)[0];
            if (circle) {
                let radius = circle.r.baseVal.value;
                let circumference = 2 * Math.PI * radius;
                let offset = circumference - (value / 100) * circumference;
    
                $(`.${className} .progress-circle`).css({
                    stroke: color,
                    strokeDasharray: `${circumference} ${circumference}`,
                    strokeDashoffset: offset
                });
            }
        }
    }
    
    $('input[type="color"]').on('change', function () {
        var deger = $(this).val()
        var dataType = $(this).data('type');
        if (hudColorSettings[dataType]) {
            if (hudColorSettings[dataType].includes("progress-bar") || dataType == "level2") {
                changeProgressColor(hudColorSettings[dataType], deger)
            } else {
                hudColorData[hudColorSettings[dataType]] = deger
                $(hudColorSettings[dataType]).css({
                    'color': `${deger}`
                })
            }
        }
    });


    $("#widht-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'width': `${val}%`
            })
            currentSizeData[key]["width"] = val + "%"
        }
    })
    $(".hud-widht #up-value").on("click", function () {
        var sayi = Number($("#widht-value").val()) + 0.1
        $("#widht-value").val(sayi.toFixed(1))
        var val = Number($("#widht-value").val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'width': `${val}%`
            })
            currentSizeData[key]["width"] = val + "%"
        }
    })
    $(".hud-widht #down-value").on("click", function () {
        var sayi = Number($("#widht-value").val()) - 0.1
        $("#widht-value").val(sayi.toFixed(1))
        var val = Number($("#widht-value").val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'width': `${val}%`
            })
            currentSizeData[key]["width"] = val + "%"
        }
    })

    $("#height-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'height': `${val}%`
            })
            currentSizeData[key]["height"] = val + "%"
        }
    })
    $(".hud-height #up-value").on("click", function () {
        var sayi = Number($("#height-value").val()) + 0.1
        $("#height-value").val(sayi.toFixed(1))
        var val = Number($("#height-value").val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'height': `${val}%`
            })
            currentSizeData[key]["height"] = val + "%"
        }
    })
    $(".hud-height #down-value").on("click", function () {
        var sayi = Number($("#height-value").val()) - 0.1
        $("#height-value").val(sayi.toFixed(1))
        var val = Number($("#height-value").val())

        for (let key in currentHudSizeData) {
            $(key).css({
                'height': `${val}%`
            })
            currentSizeData[key]["height"] = val + "%"
        }
    })

    $("#radius-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        for (let key in currentHudSizeData) {
            $(key + " .progress-bar").css({
                'border-radius': `${val}%`
            })
            currentSizeData[key]["border-radius"] = val + "%"
        }
    })
    $(".hud-radius #up-value").on("click", function () {
        var sayi = Number($("#radius-value").val()) + 1
        $("#radius-value").val(sayi.toFixed(1))
        var val = Number($("#radius-value").val())

        for (let key in currentHudSizeData) {
            $(key + " .progress-bar").css({
                'border-radius': `${val}%`
            })
            currentSizeData[key]["border-radius"] = val + "%"
        }
    })
    $(".hud-radius #down-value").on("click", function () {
        var sayi = Number($("#radius-value").val()) - 1
        $("#radius-value").val(sayi.toFixed(1))
        var val = Number($("#radius-value").val())

        for (let key in currentHudSizeData) {
            $(key + " .progress-bar").css({
                'border-radius': `${val}%`
            })
            currentSizeData[key]["border-radius"] = val + "%"
        }
    })

    $("#icon-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        for (let key in currentHudSizeData) {
            $(key + " #icon").css({
                'font-size': `${val}vh`
            })
            currentSizeData[key]["font-size"] = val + "vh"
        }
    })
    $(".hud-icon #up-value").on("click", function () {
        var sayi = Number($("#icon-value").val()) + 0.1
        $("#icon-value").val(sayi.toFixed(1))
        var val = Number($("#icon-value").val())

        for (let key in currentHudSizeData) {
            $(key + " #icon").css({
                'font-size': `${val}vh`
            })
            currentSizeData[key]["font-size"] = val + "vh"
        }
    })
    $(".hud-icon #down-value").on("click", function () {
        var sayi = Number($("#icon-value").val()) - 0.1
        $("#icon-value").val(sayi.toFixed(1))
        var val = Number($("#icon-value").val())

        for (let key in currentHudSizeData) {
            $(key + " #icon").css({
                'font-size': `${val}vh`
            })
            currentSizeData[key]["font-size"] = val + "vh"
        }
    })

    $("#level-widht-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        $(".level").css({
            'width': `${val}%`
        })
        currentSizeData[".level"]["width"] = val + "%"
    })
    $(".level-widht #up-value").on("click", function () {
        var sayi = Number($("#level-widht-value").val()) + 0.1
        $("#level-widht-value").val(sayi.toFixed(1))
        var val = Number($("#level-widht-value").val())

        $(".level").css({
            'width': `${val}%`
        })
        currentSizeData[".level"]["width"] = val + "%"
    })
    $(".level-widht #down-value").on("click", function () {
        var sayi = Number($("#level-widht-value").val()) - 0.1
        $("#level-widht-value").val(sayi.toFixed(1))
        var val = Number($("#level-widht-value").val())

        $(".level").css({
            'width': `${val}%`
        })
        currentSizeData[".level"]["width"] = val + "%"
    })
    $("#level-height-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        $(".level").css({
            'height': `${val}%`
        })
        currentSizeData[".level"]["height"] = val + "%"
    })
    $(".level-height #up-value").on("click", function () {
        var sayi = Number($("#level-height-value").val()) + 0.1
        $("#level-height-value").val(sayi.toFixed(1))
        var val = Number($("#level-height-value").val())

        $(".level").css({
            'height': `${val}%`
        })
        currentSizeData[".level"]["height"] = val + "%"
    })
    $(".level-height #down-value").on("click", function () {
        var sayi = Number($("#level-height-value").val()) - 0.1
        $("#level-height-value").val(sayi.toFixed(1))
        var val = Number($("#level-height-value").val())

        $(".level").css({
            'height': `${val}%`
        })
        currentSizeData[".level"]["height"] = val + "%"
    })
    $("#level-fontsize-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())

        $(".level-text").css({
            'font-size': `${val}vh`
        })
        $(".level-xp").css({
            'font-size': `${val}vh`
        })
        currentSizeData[".level-text"]["font-size"] = val + "vh"
        currentSizeData[".level-xp"]["font-size"] = val + "vh"
    })
    $(".level-fontsize #up-value").on("click", function () {
        var sayi = Number($("#level-fontsize-value").val()) + 0.1
        $("#level-fontsize-value").val(sayi.toFixed(1))
        var val = Number($("#level-fontsize-value").val())

        $(".level-text").css({
            'font-size': `${val}vh`
        })
        $(".level-xp").css({
            'font-size': `${val}vh`
        })
        currentSizeData[".level-text"]["font-size"] = val + "vh"
        currentSizeData[".level-xp"]["font-size"] = val + "vh"
    })
    $(".level-fontsize #down-value").on("click", function () {
        var sayi = Number($("#level-fontsize-value").val()) - 0.1
        $("#level-fontsize-value").val(sayi.toFixed(1))
        var val = Number($("#level-fontsize-value").val())

        $(".level-text").css({
            'font-size': `${val}vh`
        })
        $(".level-xp").css({
            'font-size': `${val}vh`
        })
        currentSizeData[".level-text"]["font-size"] = val + "vh"
        currentSizeData[".level-xp"]["font-size"] = val + "vh"
    })


    $("#level-logo-value").on("keyup change", function (e) {
        e.preventDefault()
        var val = Number($(this).val())
        $(".server-logo").css({
            'width': `${val}%`,
            'height': `${val + 2}%`,
        })
        currentSizeData[".server-logo"]["width"] = val + "%"
        currentSizeData[".server-logo"]["height"] = val + 2 + "%"


    })
    $(".level-logo #up-value").on("click", function () {
        var sayi = Number($("#level-logo-value").val()) + 0.1
        $("#level-logo-value").val(sayi.toFixed(1))
        var val = Number($("#level-logo-value").val())
        $(".server-logo").css({
            'width': `${val}%`,
            'height': `${val + 2}%`,
        })
        currentSizeData[".server-logo"]["width"] = val + "%"
        currentSizeData[".server-logo"]["height"] = val + 2 + "%"

    })
    $(".level-logo #down-value").on("click", function () {
        var sayi = Number($("#level-logo-value").val()) - 0.1
        $("#level-logo-value").val(sayi.toFixed(1))
        var val = Number($("#level-logo-value").val())

        $(".server-logo").css({
            'width': `${val}%`,
            'height': `${val + 2}%`,
        })
        currentSizeData[".server-logo"]["width"] = val + "%"
        currentSizeData[".server-logo"]["height"] = val + 2 + "%"
    })


    $("#default-btn").on("click", function () {
        resetHudData()
    })

    function onloadFunc(data) {
        $(".cash").show()
        $(".gold").show()
        $(".id").show()
        $(".level").show()
        $(".server-logo").show()
        $(".hour").show()
        if (data.currentHudPositionData) {
            currentHudPositionData = data.currentHudPositionData
            currentHudSizeData = data.currentHudSizeData
            currentSizeData = data.currentSizeData
            homeSettingsData = data.homeSettingsData
            hudColorData = data.hudColorData
        }
        for (let key in currentHudPositionData) {
            $(key).css({
                'top': currentHudPositionData[key].top,
                'left': currentHudPositionData[key].left,
            })
            if (currentHudPositionData[key].top == "96%" && currentHudPositionData[key].left == "0.5%") {
                $(key).css({ 'position': 'relative' })
            } else {
                $(key).css({ 'position': 'absolute' })
            }
        }

        for (let key in currentHudSizeData) {
            $(key).css({
                'width': `${currentSizeData[key]["width"]}%`
            })
        }
        for (let key in currentHudSizeData) {
            $(key).css({
                'height': `${currentSizeData[key]["height"]}%`
            })
        }
        for (let key in currentHudSizeData) {
            $(key + " .progress-bar").css({
                'border-radius': `${currentSizeData[key]["border-radius"]}%`
            })
        }
        for (let key in currentHudSizeData) {
            $(key + " #icon").css({
                'font-size': `${currentSizeData[key]["font-size"]}vh`
            })
        }
        $(".level").css({
            'width': `${currentSizeData[".level"]["width"]}%`
        })
        $(".level").css({
            'height': `${currentSizeData[".level"]["height"]}%`
        })

        $(".level-text").css({
            'font-size': `${currentSizeData[".level-text"]["font-size"]}vh`
        })
        $(".level-xp").css({
            'font-size': `${currentSizeData[".level-xp"]["font-size"]}vh`
        })

        $(".server-logo").css({
            'width': `${currentSizeData[".server-logo"]["width"]}%`,
            'height': `${currentSizeData[".server-logo"]["height"] + 2}%`,
        })
        for (let key in hudColorSettings) {
            const element = hudColorSettings[key]
            let degisken = element.replace(" .progress-bar", "");
            var deger = hudColorData[degisken]
            if (element.includes("progress-bar") || key == "level2") {

                var deger2 = hudColorData[degisken + " .progress-bar"]
                changeProgressColor(element, deger2)
            } else {
                $(element).css({
                    'color': `${deger}`
                })
            }
        }


        for (let key in currentSizeData) {

            $(key).css({
                'width': currentSizeData[key]["width"],
            })
            $(key).css({
                'height': currentSizeData[key]["height"],
            })
            $(key + " .progress-bar").css({
                'border-radius': currentSizeData[key]["border-radius"],
            })
            $(key + " #icon").css({
                'font-size': currentSizeData[key]["font-size"],
            })
        }

        for (let key in homeSettingsData) {
            if (homeSettingsData[key] === 1 || homeSettingsData[key] === undefined) {
                $(key).fadeIn(1000)
            } else {
                $(key).fadeOut()

            }
        }
        // for (key in currentHudData) {
        //     setProgress(key, 50, HudAutoHide)
        // }
    }
    function getText(text) {
        var colors = {
            "~e~": "#FF0000",    // Red
            "~o~": "#FFFF00",    // Yellow
            "~d~": "#FFA500",    // Orange
            "~m~": "#808080",    // Grey
            "~q~": "#FFFFFF",    // White
            "~t~": "#D3D3D3",    // Light Grey
            "~v~": "#000000",    // Black
            "~u~": "#FFC0CB",    // Pink
            "~pa~": "#0000FF",   // Blue
            "~t1~": "#800080",   // Purple
            "~t2~": "#FFA500",   // Orange
            "~t3~": "#ADD8E6",   // Light Blue
            "~t4~": "#FFFF00",   // Yellow
            "~t5~": "#FFB6C1",   // Light Pink
            "~t6~": "#008000",   // Green
            "~t7~": "#00008B",   // Dark Blue
            "~t8~": "#FF6961"    // Light RedIsh
        };
        text = text.replace(/~n~/g, '<br>');
        text = text.replace(/~italic~/g, '<span style="font-style: italic;">');
        text = text.replace(/~\/italic~/g, '</span>');
        text = text.replace(/~bold~/g, '<span style="font-weight: bold;">');
        text = text.replace(/~\/bold~/g, '</span>');
        for (var key in colors) {
            if (colors.hasOwnProperty(key)) {
                var regex = new RegExp(key, "g");
     
                text = text.replace(regex, '<span style="color:' + colors[key] + ';">');
            }
        }
        text = text.replace(/~.*?~/g, '</span>');
        return text;
    }
    
    function showNotify(text, type, time) {
        let typetext = "Information";
        let iconSrc = "/ui/assets/img/info.png"; // default image
        
        if (type == "error") {
            typetext = "Error";
            iconSrc = "/ui/assets/img/cancel.png";
        } else if (type == "info" || type == "inform") {
            typetext = "Information";
            iconSrc = "/ui/assets/img/info.png";
        } else if (type == "success") {
            typetext = "Success";
            iconSrc = "/ui/assets/img/success.png"; // varsayalım bu görsel varsa
        } else if (type == "warn" || type == "warning") {
            typetext = "Warning";
            iconSrc = "/ui/assets/img/warning.png";
        }
        
        const randomNumber = Math.floor(Math.random() * 10000) + 1;
        const newText = getText(text);
        
        $(".notify-container").append(`
            <div class="notify id${randomNumber}" style="display: none;">
                <span class="notify-title">${typetext}</span>
                <span class="notify-desc">${newText}</span>
                <div class="notify-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100">
                    <img id="notify-img" src="${iconSrc}" alt="">
                </div>
            </div>
        `);
        
        $(`.id${randomNumber}`).fadeIn();
        var remainingTime = time
        function updateProgressBar() {
            let val = (remainingTime / time) * 100
            $(`.id${randomNumber} .notify-bar`).css({
                'background': `radial-gradient(closest-side, rgb(0, 0, 0) 79%, transparent 80% 100%), conic-gradient(rgb(255, 255, 255) ${val}%, rgba(37, 37, 37, 0.0) 0)`
            })
        }
        const timer = setInterval(() => {
            remainingTime -= 10;
            updateProgressBar();
            if (remainingTime <= 0) {
                $(`.id${randomNumber}`).fadeOut();
                setTimeout(function () {
                    $(`.id${randomNumber}`).remove();

                }, 2000)
                clearInterval(timer);
            }
        }, 10);
    }

    function openUIPanel() {
        onEditMenu = true;
        $(".home-container").show();    
        for (let key in homesettings) {
            let settingKey = homesettings[key];        
            let pureKey = settingKey.replace(/^\./, ""); 
    
            if (defaultHudCheckedData[pureKey] === true) {
                $(settingKey).hide();
                $(key).prop("disabled", true).prop("checked", false);
            } else {
                if (homeSettingsData[settingKey] === 1 || homeSettingsData[settingKey] === undefined) {
                    $(settingKey).fadeIn();
                    homeSettingsData[settingKey] = 1;
                    $(key).prop("checked", true).prop("disabled", false);
                } else {
                    $(settingKey).fadeOut();
                    homeSettingsData[settingKey] = 0;
                    $(key).prop("checked", false).prop("disabled", false);
                }
            }
        }
    
        $(".ui-panel").fadeIn();
        $(".notify-container").css({
            "background-color": 'rgba(146, 213, 240, 0.55)'
        });
    
        showNotify("You can change the location of this notification..", "info", 60000);
    }
       
    
    $("#close-btn").on("click", function () {
        $(".ui-panel").fadeOut();
        onEditMenu= false;
        // $(".ui-panel").slideUp()
        // $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        $(".notify-container").html('')
        $(".notify-container").css({
            "background-color": 'rgba(0, 0, 0, 0.0)'
        })
        $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({
            currentHudPositionData: currentHudPositionData,
            currentHudSizeData: currentHudSizeData,
            currentSizeData: currentSizeData,
            homeSettingsData: homeSettingsData,
            hudColorData: hudColorData,
        }));

    })
    window.addEventListener('message', function (event) {
        const data = event.data;

        switch (data.action) {
            case 'onPlayerLoaded':
                onloadFunc(data.settings);
                break;
            case 'notify':
                showNotify(data.text, data.ntype, data.time);
                break;
            case 'openUIPanel':
                openUIPanel();
                break;
            case 'hudtick':
                handleHudTick(data.huddata);
                break;
            case 'voicerange':
                var voiceValue = data.voicerange;
                var coord = data.coord;
                $(".voice-range").html(voiceValue);
                var leftStyle = `left: ${coord.x * 104}%;`;
                var topStyle = `top: ${coord.y * 76}%`;
                $(".showvoicerange").attr("style", leftStyle + topStyle).fadeIn(500);
                setTimeout(function () {
                    $(".showvoicerange").fadeOut(500);
                }, 2000);
                break;
            case 'updateXP':
                $(".level-text").html(`Level: ${data.level}`)
                $(".level-xp").html(`${data.xp}/${data.neededxp}`)
                var val = (data.xp / data.neededxp) * 100
                setProgress(".level-bar", val, HudAutoHide)
                break;
            case 'setOther':
                if (data.id) {
                    $(".id-text").html(data.id);
                }
            
                if (data.gold !== undefined) {
                    var currentGold = parseFloat(data.gold).toFixed(2);
                    $(".gold-value").html(currentGold);
                }
            
                if (data.cash !== undefined) {
                    var currentCash = parseFloat(data.cash).toFixed(2);
                    $(".cash-value").html(currentCash);
                }
            
                if (data.time) {
                    $(".hour-text").html(data.time);
                }
            
                break;

            case 'setGolden':
                hudForceColor = data.forcedata
                break;

            case 'hideHuds':
                defaultHudCheckedData = data.disabled
                if (data.disabled.cash) $(".cash").hide();
                if (data.disabled.gold) $(".gold").hide();
                if (data.disabled.logo) $(".server-logo").hide();
                if (data.disabled.hour) $(".hour").hide();
                if (data.disabled.playerid) $(".id").hide();
                if (data.disabled.level) $(".level").hide();
            
                if (data.disabled.dirty) $(".dirty").hide();
                if (data.disabled.stress) $(".stress").hide();
                if (data.disabled.temp) $(".temp").hide();
                if (data.disabled.alcohol) $(".alcohol").hide();
                if (data.disabled.onesync) $(".onesync").hide();
                break;
            case 'hideHud':
                $(".cash").hide()
                $(".gold").hide()
                $(".id").hide()
                $(".level").hide()
                $(".server-logo").hide()
                $(".hour").hide()
                for (let key in homeSettingsData) {
                    $(key).fadeOut()
                }
                break;
            case 'showHud':
                for (let key in homeSettingsData) {
                    if (homeSettingsData[key] === 1 || homeSettingsData[key] === undefined) {
                        $(key).fadeIn(1000);
                    } else {
                        $(key).fadeOut();
                    }
                }
            
                if (data.disabled.cash) $(".cash").hide();
                if (data.disabled.gold) $(".gold").hide();
                if (data.disabled.logo) $(".server-logo").hide();
                if (data.disabled.hour) $(".hour").hide();
                if (data.disabled.playerid) $(".id").hide();
                if (data.disabled.level) $(".level").hide();
            
                if (data.disabled.dirty) $(".dirty").hide();
                if (data.disabled.stress) $(".stress").hide();
                if (data.disabled.temp) $(".temp").hide();
                if (data.disabled.alcohol) $(".alcohol").hide();
                if (data.disabled.onesync) $(".onesync").hide();
            
                break;
                
            case 'usedItem':
                usedItem(data.type,data.val)
                break;
        }
    });


    var usedItemArray = {}

    function usedItem(div, val) {
        if (!DisableNumbersAboveCores) {
            if ($(div).is(":visible") && (!usedItemArray.hasOwnProperty(div) || usedItemArray[div] == false)) {
                var parentelement = $(div).parent();
                var pWidth = parentelement.width();
                var pHeight = parentelement.height();
    
                var curPos = $(div).position();
                var top = (curPos.top / pHeight) * 100;
                var left = (curPos.left / pWidth) * 100;
                var ilktop = top;
    
                if ($(div).css("display") != "none") {
                    if (top > 50) {
                        top = top - 3; // 3 yukarı
                    } else {
                        top = top + 3; // 3 aşağı
                    }
    
                    left = left - 0.5;
    
                    let isFloat = val.toString().includes(".");
                    val = isFloat ? Number(val).toFixed(2) : val;
    
                    var element = $(`<div class="usevalue" style="left:${left}%;top:${ilktop}%;">${val > 0 ? "+" : ""}${val}</div>`)
                    usedItemArray[div] = true;
                    $(".use-text").append(element);
    
                    element.animate({ top: top + "%" }, 1000).delay(3000).animate({ top: ilktop + "%" }, 1000).delay(1000);
                    setTimeout(function () {
                        usedItemArray[div] = false;
                        element.remove();
                    }, 6000);
                }
            }
        }
    }
    
    function handleHudTick(hudData) {
        $(".health-bounding").html(hudData['horse-bounding']);
        $(".stamina-bounding").html(hudData['horse-bounding']);

        DisableNumbersAboveCores = hudData['DisableNumbersAboveCores'];

        if (!progressIsBussy) {
            // progressIsBussy = true;
            for (const key in hudData) {
                setProgress(key, hudData[key], hudData['autohide']);
            }
        }

        // const innerCore = hudData['innercorestamina'];
        // if (innerCore > 0) {
        //     let renk = hudColorData[".stamina #icon"]
        //     $(".stamina #icon").css({
        //         'color': renk
        //     })
        // } else {
        //     let renk = "#700f0f"
        //     $(".stamina #icon").css({
        //         'color': renk
        //     })
        // }

        const talking = hudData["talking"];
        if (talking) {
            StartAnimation(".microphone", "-");
        } else {
            StopAnimation(".microphone");
        }
    }
    function StartAnimation(divname, tp) {
        $(divname).css({
            "animation": `${tp == "-" ? "pulse" : "pulse2"} 0.8s infinite`,
            "z-index": "0"
        });
        $(divname + " #icon").css({
            "animation": "pulseicon 0.3s infinite",
            "z-index": "0"
        });
    }

    function StopAnimation(divname) {
        $(divname).css({
            "animation": "none",
            "z-index": "2"
        });
        $(divname + " #icon").css({
            "animation": "none",
            "z-index": "2"
        });
    }
});
