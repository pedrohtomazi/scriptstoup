var buyData = [];
var sellData = [];
var loaded = false;
var currentActions = "buy";
var currentClass = {};
var currentPrice = 0;
var moneytype = "";
var currentLabel = "";
var framework = "";
$(document).ready(function () {
  $('.store-container').hide();
  $('.sellbtn').hide();
  $('.sellpage').hide();
  $('.iteminput').hide();




  // VORP
  function setupBuyPage(buyItems) {
    $("#buyitems").html("");
    let buyitemshtml = "";
    buyData = [];
    buyItems.forEach(function (item, index) {
      let moneytype = item.moneytype ? item.moneytype : "cash"; 
      let iconifyIcon = (moneytype == "gold") ? "ant-design:gold-filled" : "foundation:dollar";
      let iconClass = (moneytype == "gold") ? "listitemprice-icongold" : "listitemprice-iconcash";

      buyData[index] = {
        price: Math.floor(parseFloat(item.price) * 100) / 100,
        moneytype: moneytype,
        name: item.itemName,
        label: item.itemLabel
      };
      let itemImagePath = framework === "RSG"
        ? `nui://rsg-inventory/html/images/${item.itemName}.png`
        : `nui://vorp_inventory/html/img/items/${item.itemName}.png`;

      buyitemshtml += `<div class="item-container" uid="${index}">
            <div id="listitem">
                <div id="listitemimg" style="background-image: url('${itemImagePath}');">
                </div>
                <div id="listitemlabel">${item.itemLabel}</div>
                <div id="listitemprice">
                    <iconify-icon class="${iconClass}" icon="${iconifyIcon}"></iconify-icon>
                    <span class="listitemprice-value">${Math.floor(parseFloat(item.price) * 100) / 100}</span>
                </div>
            </div>
        </div>`;
    });

    $("#buyitems").html(buyitemshtml);
  }


  function setupSellPage(sellItems) {
    $("#sellitems").html("");
    let sellitemshtml = "";
    sellData = []

    sellItems.forEach(function (item, index) {
      let moneytype = item.moneytype ? item.moneytype : "cash"; // Eğer moneytype yoksa "cash" olarak ayarla
      let iconifyIcon = (moneytype == "gold") ? "ant-design:gold-filled" : "foundation:dollar";
      let iconClass = (moneytype == "gold") ? "listitemprice-icongold" : "listitemprice-iconcash";

      Math.floor(parseFloat(item.price) * 100) / 100

      sellData[index] = {
        price: Math.floor(parseFloat(item.price) * 100) / 100,
        moneytype: moneytype,
        name: item.itemName,
        label: item.itemLabel
      }
      let itemImagePath = framework === "RSG"
        ? `nui://rsg-inventory/html/images/${item.itemName}.png`
        : `nui://vorp_inventory/html/img/items/${item.itemName}.png`;

      let itemCount = item.count == "none" ? `` : `<div id="itemcount">${item.count ? item.count : 0}</div>`
      sellitemshtml += `<div class="item-container" uid="${index}">
            <div id="listitem">
                <div id="listitemimg" style="background-image: url('${itemImagePath}');">
                    ${itemCount}
                </div>
                <div id="listitemlabel">${item.itemLabel}</div>
                <div id="listitemprice">
                    <iconify-icon class="${iconClass}" icon="${iconifyIcon}"></iconify-icon>
                    <span class="listitemprice-value">${Math.floor(parseFloat(item.price) * 100) / 100}</span>
                </div>
            </div>
        </div>`;
    });
    $("#sellitems").html(sellitemshtml);
  }



  function removeActive() {
    var altDivler = $(".itemlist").children(".item-container");
    altDivler.each(function () {
      if ($(this).hasClass("active")) {
        $(this).removeClass("active");
      }
    });
  }


  function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.15;
    audio.play();
  }
  function cancelSetupButtons() {
    $(".closebtn").off("mouseenter"); 
    $(".craftbtn").off("mouseenter"); 
    $("#confirm").off("mouseenter"); 
    $("#confirm").off("click"); 
    $("#inputcount").off("input"); 
    $("#cancel").off("click"); 
    $(".item-container").off("mouseenter"); 
    $(".item-container").off("click"); 
    $(".buybtn").off("click"); 
    $(".closebtn").off("click"); 
    $(".sellbtn").off("click");
  }
  function setupButtons() {
    $(".closebtn").hover(function () {
      playClickSound();
    });
    $(".craftbtn").hover(function () {
      playClickSound();
    });
    $("#confirm").hover(function () {
      playClickSound();
    });
    $("#confirm").click(function () {
      playClickSound();
      $('.iteminput').hide();
      let count = $("#inputcount").val();

      count = parseInt(count) ? parseInt(count) : 0;
      $.post(`https://${GetParentResourceName()}/buyorsellactions`, JSON.stringify({
        type: currentActions,
        itemName: currentClass,
        count: count,
        itemLabel: currentLabel,
        moneytype: moneytype,
        price: currentPrice
      }));
    });
    $("#inputcount").on("input", function () {
      var value = $(this).val();
      var parsedValue = parseInt(value);
      if (value.includes("-") || value.includes("+")) {
        $(this).val('');
        return;
      }
      if (value.includes(".")) {
        $(this).val('');
        return;
      }
      if (isNaN(parsedValue) || parsedValue <= 0) {
        $(this).val('');
        return;
      }
      if (value.length > 3) {
        $(this).val(value.substring(0, 3));
      }
    });
    $("#cancel").click(function () {
      playClickSound();
      $('.iteminput').fadeOut();
    });
    $(".item-container").hover(function () {
      playClickSound();
    });
    $(".item-container").click(function () {
      playClickSound();
      $('.iteminput').fadeIn();

      removeActive();
      $(this).addClass("active");

      if (currentActions == "sell") {
        currentClass = sellData[$(this).attr("uid")].name;
        currentPrice = sellData[$(this).attr("uid")].price;
        currentLabel = sellData[$(this).attr("uid")].label;
        moneytype = sellData[$(this).attr("uid")].moneytype;
      }else{
        currentClass = buyData[$(this).attr("uid")].name;
        currentPrice = buyData[$(this).attr("uid")].price;
        currentLabel = buyData[$(this).attr("uid")].label;
        moneytype = buyData[$(this).attr("uid")].moneytype;
      }
    });

    $(".buybtn").click(function (e) {
      e.preventDefault();
      $('.buybtn').fadeOut();
      $('.buypage').fadeOut();
      $('.sellbtn').fadeIn();
      $('.sellpage').fadeIn();
      $('.iteminput').fadeOut();
      currentActions = "sell";
    })
    $('.closebtn').click(function (e) {
      e.preventDefault();
      $(".store-container").hide();
      $.post(`https://${GetParentResourceName()}/closeUI`, JSON.stringify({}));
    })
    $(".sellbtn").click(function (e) {
      e.preventDefault();
      $('.sellbtn').fadeOut();
      $('.sellpage').fadeOut();
      $('.buybtn').fadeIn();
      $('.buypage').fadeIn();
      $('.iteminput').fadeOut();
      currentActions = "buy";
    })
    $("#itemsearch").bind("input", function () {
      var searchFor = $("#itemsearch").val().toLowerCase();
      let div = "#sellitems"
      if (currentActions === "buy") {
        div = "#buyitems"
      }
      $(`${div} .item-container`).each(function () {
        var label = $(this).attr("label");
        if (label) { // Check that label is defined
          label = label.toLowerCase();

          if (label.indexOf(searchFor) < 0) {
            $(this).hide();
          } else {
            $(this).show();
          }
        }
      });
    });
  }

  function Controller(data) {
    if (data.BuyItems.length == 0) {
      $('.buybtn').hide();
      $('.buypage').hide();
      $('.sellbtn').hide();
      $('.sellpage').fadeIn();
      currentActions = "sell";
    } else if (data.SellItems.length == 0) {
      $('.sellbtn').hide();
      $('.sellpage').hide();
      $('.buybtn').hide();
      $('.buypage').fadeIn();
      currentActions = "buy";
    } else {
      $('.sellbtn').fadeOut();
      $('.sellpage').fadeOut();
      $('.buybtn').fadeIn();
      $('.buypage').fadeIn();
      currentActions = "buy";
    }
  }
  window.addEventListener("message", function (event) {
    switch (event.data.action) {
      case "openMenu":
        framework = event.data.array.framework;
        $(".store-container").show();
        setupBuyPage(event.data.array.BuyItems);
        setupSellPage(event.data.array.SellItems);
        $("#storepng").attr("src", event.data.array.image);
        $(".sellbtn").hide();
        $(".sellpage").hide();
        $(".buybtn").show();
        $(".buypage").show();
        currentClass = 0;
        currentPrice = 0;
        currentLabel = "";
        Controller(event.data.array);
        cancelSetupButtons();
        setupButtons();
        if (!loaded) {
          loaded = true;
        }
        break;
  
      case "updateMenu":
        setupBuyPage(event.data.array.BuyItems);
        setupSellPage(event.data.array.SellItems);
        currentClass = 0;
        currentPrice = 0;
        currentLabel = "";
        cancelSetupButtons();
        setupButtons();
        break;
    }
  });
  
});
