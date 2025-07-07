'use strict';

var FXRadialMenu = null;
var toggleConfig = false;
var keybindConfig = false;


$(document).ready(function () {
    window.addEventListener('message', function (event) {
        switch (event.data.action) {
            case "ui":
            toggleConfig = event.data.toggle;
            keybindConfig = event.data.keybind;
            if (event.data.radial) {
                createMenu(event.data.items)
                FXRadialMenu.open();
            } else {
                FXRadialMenu.close(true);
            }
            if (toggleConfig === false) {
                $(document).on('keyup', function (e) {
                    if (e.key == keybindConfig | e.key === keybindConfig.toLowerCase()) {
                        FXRadialMenu.close();
                    }
                });
            } else {
                $(document).on('keydown', function (e) {
                    switch (e.key) {
                        case keybindConfig:
                            FXRadialMenu.close();
                            break;
                    }
                });
            }
        }
    });
});


// Dice
$(document).ready(function () {
    window.addEventListener("message", function (event) {

        let item = event.data;
        if (item.type == true) { document.getElementById("data").innerHTML = item.html; }
    });

});

function createMenu(items) {
    FXRadialMenu = new RadialMenu({
        parent: document.body,
        size: 375,
        menuItems: items,
        onClick: function (item) {
            if (item.shouldClose) {
                FXRadialMenu.close(true);
            }

            if (item.items == null && item.shouldClose != null) {
                $.post('https://fx-radialmenu/selectItem', JSON.stringify({
                    itemData: item
                }))
            }
        }
    });
}

// Close on escape pressed
$(document).on('keydown', function (e) {
    switch (e.key) {
        case "Escape":
            FXRadialMenu.close();
            break;
    }
});