var timeoutForCraft = false;
var currentData = []
var currentWeaponData = []
var currentWeaponIndex = 0
var currentCraftData = []
var currentLevel = 0;
var onMenu = false;
var needWait = false;
var ImgPath = "";
var currentBookId = null;
$(document).ready(function () {
  $.post('http://${GetParentResourceName()}/setFramework', {}, function (response) {
  });

  function updateLevelAndXP(currentLevel, current, total, production) {
    $(".player-lvl-home").html(`Level ${currentLevel}`);
    $(".progress-exp-home").html(`${current} / ${total}`);
    $(".progressbarhome").css('--value', Math.round((current / total) * 100));
    $(".total-amount").html(production);

    if (currentData) {
      currentData.currentLevel = currentLevel;
      currentData.currentXP = current;
      currentData.neededXP = total;
      currentData.totalProduction = production;
    }
  }
  
  function goBack() {
    $("#categories-title").html("CATEGORIES")
    if (onMenu) {
      openCraftBook(currentData)
    } else {
      $(".craftbook").hide();
      $(".craft-page").hide();
      $(".categorie-weapons").hide();
      $(".craft-order-container").hide();
      $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
    }
  }
  function formatSecondsToTime(seconds) {
    if (isNaN(seconds) || seconds < 0) {
      return "Finish Craft";
    }

    var hours = Math.floor(seconds / 3600);
    var minutes = Math.floor((seconds % 3600) / 60);
    var remainingSeconds = seconds % 60;

    var formattedTime = `${pad(minutes)}:${pad(remainingSeconds)}`;
    return formattedTime;
  }

  function pad(num) {
    return num < 10 ? '0' + num : num;
  }

  $(".container").hide();
  $(".craftbook").hide();
  $(".craft-page").hide();
  $(".categorie-weapons").hide();
  $(".craft-order-container").hide();
  function openWeaponMenu(data) {
    $(".craftbook").hide();
    onMenu = true;
    currentWeaponData = currentData.craftData.weapons.items["melee"]
    currentWeaponIndex = 0
    setWeaponData(currentWeaponData[currentWeaponIndex])

    $(".categorie-weapons").show();
  }

  function openMenu(data) {
    $(".craftbook").hide();
    $(".craft-page").show();
    $(".items-container").html("");
    onMenu = true;

    if (Array.isArray(data) && data.length > 0) {
      currentCraftData = data[0];
    } else {
      currentCraftData = data;
    }
    let itemHTML = '';
    data.sort((a, b) => a.requiredLevel - b.requiredLevel); 

    data.forEach((element, index) => {
      const imgSrc = `nui://${ImgPath}${element.itemName}.png`;
      const img = new Image();
      img.src = imgSrc;
      img.onerror = function () {
        $(`#craftItem-${index} .craft-items-png`).css('background-image', `url('/ui/assets/img/defaultimg.png')`);
      };
    
      const isLocked = element.requiredLevel > currentLevel;
      const opacityStyle = isLocked ? "opacity: 0.3;" : "";
      const lockElements = isLocked
        ? `<iconify-icon icon="mdi:eye-lock" id="locklevelicon"></iconify-icon>`: "";
    
      itemHTML += `
        <div class="craft-items" id="craftItem-${index}" style="${opacityStyle}">
            <div class="craft-items-png" style='background-image: url(${imgSrc})'></div>
            <span class="craft-items-name">${element.itemLabel}</span>
            <span class="craft-items-lvl">Level ${element.requiredLevel}</span>
            <span class="craft-items-time">${formatSecondsToTime(element.duration)}</span>
            <span class="craft-items-exp">${element.rewardXP} EXP</span>
            <span class="craft-items-count">${element.itemAmount}x</span>
            ${lockElements}
        </div>`;
    });
    


    $(".items-container").append(itemHTML);

    $(".items-container").off("click").on("click", ".craft-items", function () {
      const index = $(this).attr('id').split('-')[1];
      const element = data[index];
  
      if (element.requiredLevel > currentLevel) {
          $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ 
              text: "Your level is insufficient to view this!" 
          }));
          return;
      }
  
      currentCraftData = element;
  
      $(".craft-items-materials").html("");
      element.requiredItems.forEach(element2 => {
          $(".craft-items-materials").append(`<div class="materials-box">${element2.itemLabel} x${element2.itemCount}</div>`);
      });
  
      $(".item-description .craft-items-lvl").html(`Level ${element.requiredLevel}`);
      $(".item-description .craft-items-time").html(`${formatSecondsToTime(element.duration)}`);
      $(".item-description .craft-items-exp").html(`${element.rewardXP} EXP`);
      $(".item-description .craft-items-count").html(`${element.itemAmount}x`);
      $(".title-2").html(element.itemLabel);
  
      const imgSrc = `nui://${ImgPath}${element.itemName}.png`;
      const img = new Image();
      img.src = imgSrc;
      img.onerror = function () {
          $(".craft-items-pngbox").css('background-image', `url('/ui/assets/img/defaultimg.png')`);
      };
      img.onload = function () {
          $(".craft-items-pngbox").css('background-image', `url(${imgSrc})`);
      };
    });
  

    if (data.length > 0) {
      const firstItem = data[0];
      $(".craft-items-materials").html("");
      firstItem.requiredItems.forEach(element3 => {
        $(".craft-items-materials").append(`<div class="materials-box">${element3.itemLabel} x${element3.itemCount}</div>`);
      });
      $(".title-2").html(firstItem.itemLabel);
      $(".item-description .craft-items-lvl").html(`Level ${firstItem.requiredLevel}`);
      $(".item-description .craft-items-time").html(`${formatSecondsToTime(firstItem.duration)}`);
      $(".item-description .craft-items-exp").html(`${firstItem.rewardXP} EXP`);
      $(".item-description .craft-items-count").html(`${firstItem.itemAmount}x`);
      const imgSrc = `nui://${ImgPath}${firstItem.itemName}.png`;
      const img = new Image();
      img.src = imgSrc;
      img.onerror = function () {
        $(".craft-items-pngbox").css('background-image', `url('/ui/assets/img/defaultimg.png')`);
      };
      img.onload = function () {
        $(".craft-items-pngbox").css('background-image', `url(${imgSrc})`);
      };
    }
  }

  function setupCategory(data) {
    $(".categories").html("");
    
    const sortedEntries = Object.entries(data).sort((a, b) => {
      return a[1].order - b[1].order;
    });
  
    for (const [currentKey, element] of sortedEntries) {
      $(`#categorie-${currentKey}`).off('click');
  
      $(".categories").append(`
        <div class="categorie-box" id="categorie-${currentKey}">
          <div class="categorie-image" style="background-image: url(${element.image})"></div>
          <p class="categorie-name">${element.label}</p>
          <p class="categorie-items">${Array.isArray(element.items) ? element.items.length : Object.keys(element.items).length}</p>
        </div>
      `);
  
      $(`#categorie-${currentKey}`).on("click", function () {
        if (currentKey === "weapons") {
          openWeaponMenu(element.items);
        } else {
          openMenu(element.items);
        }
      });
    }
  }
  
  function openCraftBook(data) {
    onMenu = false;
    currentData = data;

    // Görselin önceden yüklenmesi
    var img = new Image();
    img.src = '/ui/assets/img/craftbook.png';

    $(".container").hide();
    $(".craft-page").hide();
    $(".categorie-weapons").hide();
    $(".categories").hide();
    $(".take-input").hide();
    $(".craft-order-container").hide();
    img.onload = function () {
      $(".craftbook").css('background-image', `url('${img.src}')`).fadeIn(200);
    };
    $(".container").show();
    $(".categories").fadeIn(500);
    $("#player-name").html(data.name);
    $("#player-name").css("font-family", "'crock'");

    $(".player-lvl-home").html(`Level ${data.currentLevel}`);

    var total = data.neededXP;
    var current = data.currentXP;
    var avg = Math.round((current / total) * 100);
    currentLevel = data.currentLevel;

    $(".progress-exp-home").html(`${current} / ${total}`);
    $(".progressbarhome").css('--value', avg);
    $(".total-amount").html(data.totalProduction);

    setupCategory(data.craftData);

  }
  function setWeaponData(data) {
    let confirm = '<span class="lvlcheck cancel"></span>'
    if (currentData.currentLevel >= data.requiredLevel) {
      confirm = '<span class="lvlcheck confirm"></span>'
    }
    $(".weaponname").html(`${data.itemLabel}
      ${confirm}
    `)
    currentCraftData = data
    $(".craft-weapon-materials").html("")
    data.requiredItems.forEach(element => {
      $(".craft-weapon-materials").append(`<div class="materials-box">${element.itemLabel} x${element.itemCount}</div>`)
    });


    $(".weaponpng").css({
      'background-image': `url(nui://${ImgPath}${data.itemName}.png)`
    })
    $(".weapon-description .craft-items-lvl").html(`Level ${data.requiredLevel}`)
    $(".weapon-description .craft-items-time").html(`${formatSecondsToTime(data.duration)}`)
    $(".weapon-description .craft-items-exp").html(`${data.rewardXP} EXP`)
    $(".weapon-description .craft-items-count").html(`${data.itemAmount}x`)

  }
  function setupCategoryWeapon(typee) {
    currentWeaponData = currentData.craftData.weapons.items[typee]
    currentWeaponIndex = 0
    setWeaponData(currentWeaponData[currentWeaponIndex])
  }
  $(".value-right").on("click", function (e) {
    e.preventDefault();
    currentWeaponIndex++;
    if (!currentWeaponData[currentWeaponIndex]) {
      currentWeaponIndex = 0
    }
    setWeaponData(currentWeaponData[currentWeaponIndex])
  })
  $(".value-left").on("click", function (e) {
    e.preventDefault();
    currentWeaponIndex--;
    if (currentWeaponIndex < 0) {
      currentWeaponIndex = currentWeaponData.length - 1
    }
    setWeaponData(currentWeaponData[currentWeaponIndex])
  })
  $(".melee").on("click", function (e) {
    setupCategoryWeapon("melee");
  })
  $(".bow").on("click", function (e) {
    setupCategoryWeapon("bow")
  })
  $(".misc").on("click", function (e) {
    setupCategoryWeapon("misc")
  })
  $(".throwable").on("click", function (e) {
    setupCategoryWeapon("throwable")
  })
  $(".shotgun").on("click", function (e) {
    setupCategoryWeapon("shotgun")
  })
  $(".revolver").on("click", function (e) {
    setupCategoryWeapon("revolver")
  })
  $(".pistol").on("click", function (e) {
    setupCategoryWeapon("pistol")
  })
  $(".repeaters").on("click", function (e) {
    setupCategoryWeapon("repeaters")
  })
  $(".rifle").on("click", function (e) {
    setupCategoryWeapon("rifle")
  })
  let intervals = {};
  $("#take-input").on("input", function () {
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

  function updateCraftingItems(crafts) {
    $(".craft-order-container").html("");
    $("#categories-title").html("ORDER LIST");
    $(".take-input").hide();

    crafts.forEach((element, i) => {
        if (intervals[i]) {
            clearInterval(intervals[i]);
            delete intervals[i];
        }

        let maxAmount = element.data.itemAmount * element.data.amount;
        if (element.remainingTime < 0) element.remainingTime = 0;

        $(".craft-order-container").append(`
            <div class="order-box" 
                 id="order-box-${i}" 
                 data-max-amount="${maxAmount}" 
                 data-expired-time="${element.expiredTime}">
                 
                <div class="order-png" style='background-image: url(nui://${ImgPath}${element.data.itemName}.png)'></div>
                <span class="order-title">${element.data.itemLabel}</span>
                <span class="order-time">
                    <iconify-icon id="order-time-icon-${i}" icon="zondicons:hour-glass"></iconify-icon>
                    <span id="order-time-${i}">${formatSecondsToTime(element.remainingTime)}</span>
                </span>
                <span class="order-exp">${element.data.rewardXP} Exp</span>
                <span class="order-count">
                    <iconify-icon id="ordercount-icon" icon="ic:baseline-discount"></iconify-icon>
                    <span id="order-amount-${i}">${maxAmount}</span>x
                </span>
            </div>
        `);

        intervals[i] = setInterval(() => {
            element.remainingTime--;
            if (element.remainingTime < 0) element.remainingTime = 0;
            $(`#order-time-${i}`).text(formatSecondsToTime(element.remainingTime));
            if (element.remainingTime <= 0) {
                clearInterval(intervals[i]);
                delete intervals[i];
                $(`#order-time-icon-${i}`).remove();
                $(`#order-box-${i}`).removeClass("inactive");
            } else {
                $(`#order-box-${i}`).addClass("inactive");
            }
        }, 1000);
    });

    $(".order-box").on("click", function () {
        const selectedOrderIndex = $(this).attr("id").split("-")[2];
        let selectedOrder = crafts[selectedOrderIndex];
        let maxAmount = parseInt($(`#order-amount-${selectedOrderIndex}`).text(), 10);
        let expiredTime = parseInt($(this).attr("data-expired-time"), 10);

        if (selectedOrder.remainingTime > 0) {
            $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ text: "Production is still ongoing!" }));
            return;
        }

        $(".order-box").removeClass("active");
        $(this).addClass("active");
        $(".take-input").fadeIn(700);

        $(".take-btn").off("click").on("click", function () {
            let takeAmount = parseInt($("#take-input").val(), 10);
            if (!takeAmount || isNaN(takeAmount) || takeAmount <= 0) {
                takeAmount = 1;
            }
            if (takeAmount > maxAmount) {
                $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({
                    text: `You cannot take more than ${maxAmount} items!`
                }));
                return;
            }

            $(".take-input").hide();

            $.post(`https://${GetParentResourceName()}/takeItem`, JSON.stringify({
                data: selectedOrder.data,
                expiredTime: expiredTime,
                takeAmount: takeAmount
            }));
        });
    });

    $(".craft-order-container").show();
  }


  
  $(".craftorder-btn").on("click", function (e) {
    onMenu = true;
    $(".categories").hide();
    $.post(`https://${GetParentResourceName()}/getCraftingItems`, JSON.stringify({}), function (crafts) {
      updateCraftingItems(crafts)

    });
  })
  // openCraftBook(gecicidata);
  $(document).keyup(function (e) {
    if (e.key === "Escape") {
      goBack()
    }
  });
  $(".start-craft").on("click", function (e) {
    if (!timeoutForCraft) {
      currentCraftData.amount = $(".weaponinputcount").val() ? $(".weaponinputcount").val() : 1
      if (currentLevel < currentCraftData.requiredLevel) {
        $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ text: "Your level is not enough to do this!" }));
      } else {
        timeoutForCraft = true
        setTimeout(function () {
          timeoutForCraft = false
        }, 2000)
        $.post(`https://${GetParentResourceName()}/craftItem`, JSON.stringify(currentCraftData));
      }
    } else {
      $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ text: "You need a rest a few second!" }));
    }
  })
  $(".start-item-craft").on("click", function (e) {
    if (!timeoutForCraft) {
      timeoutForCraft = true
      setTimeout(function () {
        timeoutForCraft = false
      }, 2000)
      currentCraftData.amount = $(".iteminputcount").val() ? $(".iteminputcount").val() : 1
      if (currentLevel < currentCraftData.requiredLevel) {
        $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ text: "Your level is not enough to do this!" }));
      } else {
  
        $.post(`https://${GetParentResourceName()}/craftItem`, JSON.stringify(currentCraftData));
      }
    } else {
      $.post(`https://${GetParentResourceName()}/notify`, JSON.stringify({ text: "You need a rest a few second!" }));
    }
  })
  function startCustomProgressBar(text, duration, callback) {
    $("#progressbar-text").text(text);
    $("#progress-fill").css({
        width: "100%",
        transition: `width ${duration}ms linear`
    });

    $(".progress").fadeIn(300);

    setTimeout(() => {
        $("#progress-fill").css("width", "0%");
    }, 10);

    setTimeout(() => {
        $(".progress").fadeOut(300);
        if (typeof callback === "function") callback();
    }, duration);
  }
  window.addEventListener('message', function (event) {
    switch (event.data.action) {
      case 'setFramework':
        if (event.data.framework === "RSG") {
          ImgPath = "rsg-inventory/html/images/";
        } else if (event.data.framework === "VORP") {
          ImgPath = "vorp_inventory/html/img/items/";
        }
        break;
      case 'openCraftBook':
        $(".homepage").css({
          'background-image': `url(${event.data.image})`
        });
        openCraftBook(event.data.array);
        break;

      case 'updateCraftingItems':
        updateCraftingItems(event.data.crafts);
        break;

      case 'updateXP':
        updateLevelAndXP(event.data.level,event.data.xp,event.data.neededxp,event.data.production)
        break;
      case 'startHandCraft':
        const duration = event.data.duration || 5000;
        const text = event.data.text || "Crafting...";
        const image = event.data.image || "/ui/assets/img/defaultimg.png";
    
        const $elements = $('.craftbook, .craft-page, .categorie-weapons');
    
        // Animasyon tekrar tetiklenebilmesi için class'ları sıfırla
        $elements.removeClass('animate-slide-down animate-slide-up');
    
        // Zorla yeniden çizim (reflow) – class değişikliği algılansın diye
        void $elements[0].offsetWidth;
    
        // Aşağı kaydır
        $elements.addClass('animate-slide-down');
    
        setTimeout(() => {
            $elements.removeClass('animate-slide-down').addClass('animate-slide-up');
        }, duration);
    
        $('#progressbar-img').attr('src', image);
    
        startCustomProgressBar(text, duration, function () {
            // callback opsiyonel
        });
        break;
    
      
        
    }
  });

});