# FX-Store in Lua System for VORPCore framework

* Please join our discord about script development. You will automatically get a Discord Role.
* https://discord.gg/PjEu6tgAkU

## Setup
* Download the lastest version of FX-Store

### After completing the installation
* Copy and paste ```fx-store``` folder to ```resources/fx-store```
* Add ```ensure fx-store``` to your ```resource.cfg``` file
* Add ```ensure fx-store``` to your ```resource.cfg``` file
* To change the language go to ```resources/fx-store/config``` and change the default language.

## Setup rsg-core inventory images

main.js change code line 
```js
  function setupBuyPage(buyItems) {
    $("#buyitems").html("");
    let buyitemshtml = "";
    buyItems.forEach(function (item, index) {
      buyitemshtml = buyitemshtml + `<div class="item-container" id="${item.itemName}" label="${item.itemLabel}" price="${item.price}">
      <div id="listitem">
          <div id="listitemimg" style="background-image: url('nui://rsg-inventory/html/images/${item.itemName}.png');">
        
          </div>
          <div id="listitemlabel">${item.itemLabel}</div>
          <div id="listitemprice">$${item.price}</div>
      </div>
      </div>`;

    });
    $("#buyitems").html(buyitemshtml);
  }
  function setupSellPage(sellItems) {
    $("#sellitems").html("");
    let sellitemshtml = "";
    sellItems.forEach(function (item, index) {
      sellitemshtml = sellitemshtml + `<div class="item-container" id="${item.itemName}" label="${item.itemLabel}" price="${item.price}">
      <div id="listitem">
          <div id="listitemimg" style="background-image: url('nui://rsg-inventory/html/images/${item.itemName}.png');">
          <div id="itemcount">${item.count ? item.count : 0}</div>
          </div>
          <div id="listitemlabel">${item.itemLabel}</div>
          <div id="listitemprice">$${item.price}</div>
      </div>
      </div>`;

    });
    $("#sellitems").html(sellitemshtml);
  }   
```