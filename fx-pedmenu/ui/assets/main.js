$(document).ready(function () {
  let isAdmin = false;
  let allPedsMap = {}; 
  let selectedTimeValue = null;
  let currentRequests = []; 

  $('.left-arrow').hover(
    function() {
      $(this).find('#arrowimg').attr('src', './assets/img/selection_arrow_left.png');
    }, 
    function() {
      $(this).find('#arrowimg').attr('src', './assets/img/selection_arrow_left-black.png');
    }
  );

  $('.right-arrow').hover(
    function() {
      $(this).find('#arrowimg').attr('src', './assets/img/selection_arrow_right.png');
    }, 
    function() {
      $(this).find('#arrowimg').attr('src', './assets/img/selection_arrow_right-black.png');
    }
  );
  

  function playClickSound() {
    var audio = document.getElementById("clickaudio");
    audio.volume = 0.10;
    audio.play();
  }

  function removeActive() {
    $(".peds").find(".ped-box.active").removeClass("active");
    $(".request-peds").find(".request-box.active").removeClass("active");
  }

  const noImage = "./assets/img/noimage.png";
  let lastPedName = null;
  let loadingInterval = null;

  function loadPedImage(pedName) {
    clearInterval(loadingInterval);
    $("#pedimg").hide();
    $(".loading").show();
    $(".loading span").text("0%");

    let progress = 0;
    const stepTime = 20;
    const maxProgress = 100;

    loadingInterval = setInterval(() => {
      progress += 1;
      $(".loading span").text(`${progress}%`);

      if (progress >= maxProgress) {
        clearInterval(loadingInterval);
        $("#pedimg").attr("src", noImage).show();
      }
    }, stepTime);

    $.post(`https://${GetParentResourceName()}/showPed`, JSON.stringify({ ped: pedName }), function (success) {
      clearInterval(loadingInterval);
      $(".loading").hide();

      if (!success) {
        $("#pedimg").attr("src", noImage).show();
      } else {
        $("#pedimg").hide();
      }
    });
  }

  $(document).off("click", ".request-box").on("click", ".request-box", function () {
    playClickSound();
    removeActive(); 
    $(this).addClass("active"); 

    const pedName = $(this).find(".request-ped").text();
    if (pedName && pedName !== lastPedName) {
      lastPedName = pedName;
      loadPedImage(pedName);
    }
  });

  $(document).off("click", ".ped-box").on("click", ".ped-box", function () {
    const pedName = $(this).find(".ped-name").text();

    if (pedName === lastPedName) return;
    lastPedName = pedName;
    playClickSound();

    removeActive();
    $(this).addClass("active");
    loadPedImage(pedName);
  });
    
  $(document).off("click", ".myped-box").on("click", ".myped-box", function () {
    const pedName = $(this).find(".ped-name").text();

    lastPedName = pedName;

    $(".myped-box.active").removeClass("active");
    $(this).addClass("active");
    playClickSound();
    loadPedImage(pedName);
  
    const isDefault = $(this).find("#defaultimg").length > 0;
    $(".setdefault").text(isDefault ? "REMOVE DEFAULT PED" : "SET DEFAULT PED");
  });
  

  $(document).off("click", ".mypeds-btn").on("click", ".mypeds-btn", function () {
    playClickSound();
    $(".peds-container, .request-container, .categories-cont, .admin-page, .home-page, .admin-btn, .pedrequest, .requestdesc, .mypeds-btn").hide();
    $(".home-page").show();

    $(".mypeds-container").fadeIn(500);
    $(".myped-controller").fadeIn(500);
    $(".refresh-character").fadeIn(300);
  });

  $(document).off("click", ".admin-btn").on("click", ".admin-btn", function () {
    playClickSound();
    $(".peds-container, .mypeds-container, .categories-cont, .home-page, .admin-btn, .myped-controller, .refresh-character").hide();

    $(".request-container").fadeIn(500);
    $(".admin-page").show();
    $(".mypeds-btn").show();
  });

  $(document).on("input", "#searchped", function () {
    const searchText = $(this).val().toLowerCase();
    $(".ped-box").each(function () {
      const pedName = $(this).find(".ped-name").text().toLowerCase();
      if (pedName.includes(searchText)) {
        $(this).show();
      } else {
        $(this).hide();
      }
    });
  });

  $(document).on("input", "#searchmypeds", function () {
    const searchText = $(this).val().toLowerCase();
    $(".myped-box").each(function () {
      const pedName = $(this).find(".ped-name").text().toLowerCase();
      $(this).toggle(pedName.includes(searchText));
    });
  });

  $(document).on("input", "#searchname", function () {
    const search = $(this).val().toLowerCase();
    $(".request-box").each(function () {
      const name = $(this).find(".request-player").text().toLowerCase();
      $(this).toggle(name.includes(search));
    });
  });

  let categoriesGenerated = false;
  
  function generateCategories(allpeds) {
    if (categoriesGenerated) return;
  
    $(".categories").empty();
  
    allpeds.forEach(cat => {
      const box = $(`
        <div class="categorie-box" data-category="${cat.name}">
            <div class="categorie-title">${cat.name}</div>
            <img id="categorie-img" src="${cat.categoriesImage}" alt="">
        </div>
      `);
      $(".categories").append(box);
    });
  
    categoriesGenerated = true;
  }
  
  function generatePeds(categoryName, allpeds) {
    $(".peds-container h1").text(categoryName); 
  
    const $peds = $(".peds");
    $peds.empty();
  
    const pedList = allpeds.find(cat => cat.name === categoryName)?.peds || [];
  
    pedList.forEach(pedName => {
      const pedBox = $(`
        <div class="ped-box">
          <div class="ped-name">${pedName}</div>
        </div>
      `);
      $peds.append(pedBox);
    });
  }
  
  let currentSpawnedPed = null;

  $(document).off("click", ".left-arrow").on("click", ".left-arrow", function () {
    const selectedBox = $(".myped-box.active");
    if (!selectedBox.length) {
      return;
    }
    $.post(`https://${GetParentResourceName()}/change`, JSON.stringify({
      label: "changeOutfit",
      type: "-"
    }));
  });
  
  $(document).off("click", ".right-arrow").on("click", ".right-arrow", function () {
    const selectedBox = $(".myped-box.active");
    if (!selectedBox.length) {
      return;
    }
    $.post(`https://${GetParentResourceName()}/change`, JSON.stringify({
      label: "changeOutfit",
      type: "+"
    }));
  });
  

  $(document).off("click", ".useped").on("click", ".useped", function () {
    const selectedBox = $(".myped-box.active");
    if (!selectedBox.length) {
      return;
    }

    const pedName = selectedBox.find(".ped-name").text();
    const outfitValue = parseInt($(".outfit-value").text()) || 1;
  
    currentSpawnedPed = pedName;
  
    $.post(`https://${GetParentResourceName()}/spawnPed`, JSON.stringify({
      pedName: pedName,
      outfit: outfitValue
    }));
  });
  
  $(document).off("click", ".refresh-character").on("click", ".refresh-character", function () {
    playClickSound();
    $.post(`https://${GetParentResourceName()}/refreshPlayer`, JSON.stringify({}));
  });


  $(document).off("click", ".pedrequest").on("click", ".pedrequest", function () {
    if (isAdmin) {
      $(".admin-btn").show();
    }
    playClickSound();
    
    const $selectedPed = $(".ped-box.active").find(".ped-name");
  
    if ($selectedPed.length === 0) {
      return;
    }
  
    const pedName = $selectedPed.text();
  
    $.post(`https://${GetParentResourceName()}/pedRequest`, JSON.stringify({
      ped: pedName
    }));
  });
  
  $(document).off("click", ".setdefault").on("click", ".setdefault", function () {
    playClickSound();
  
    const selectedBox = $(".myped-box.active");
    if (!selectedBox.length) {
      return;
    }
  
    const pedName = selectedBox.find(".ped-name").text();
    const isCurrentlyDefault = selectedBox.find("#defaultimg").length > 0;
    const outfitValue = parseInt($(".outfit-value").text()) || 1;

    $.post(`https://${GetParentResourceName()}/setDefaultPed`, JSON.stringify({
      ped: pedName,
      remove: isCurrentlyDefault,
      outfit: outfitValue
    }), function(response) {
      $(".myped-box #defaultimg").remove();
  
      if (!isCurrentlyDefault) {
        selectedBox.append('<img id="defaultimg" src="./assets/img/default.png">');
        $(".setdefault").text("REMOVE DEFAULT PED");
      } else {
        $(".setdefault").text("SET DEFAULT PED");
      }
    });
  });
  
  $(document).off("click", ".confirm-request").on("click", ".confirm-request", function () {
    const $btn = $(this);
    if ($btn.hasClass("disabled")) return;
    $btn.addClass("disabled");

    const selectedBox = $(".request-box.active");
    if (!selectedBox.length || !selectedTimeValue) return;

    const pedName = selectedBox.find(".request-ped").text();
    const charid = selectedBox.data("charid");

    $.post(`https://${GetParentResourceName()}/approvePedRequest`, JSON.stringify({
      ped: pedName,
      charid: charid,
      duration: selectedTimeValue,
      approved: true
    })).always(() => {
      $btn.removeClass("disabled");
    });
  });

  $(document).off("click", ".cancel-request").on("click", ".cancel-request", function () {
    const $btn = $(this);
    if ($btn.hasClass("disabled")) return;
    $btn.addClass("disabled");

    const selectedBox = $(".request-box.active");
    if (!selectedBox.length) return;

    const pedName = selectedBox.find(".request-ped").text();
    const charid = selectedBox.data("charid");

    $.post(`https://${GetParentResourceName()}/approvePedRequest`, JSON.stringify({
      ped: pedName,
      charid: charid,
      approved: false
    })).always(() => {
      $btn.removeClass("disabled");
    });
  });
  
  function handleEscape() {
    const isCategoriesOpen = $(".categories-cont").is(":visible");
  
    if (!isCategoriesOpen) {
      $(".peds-container, .mypeds-container, .request-container, .admin-page, .home-page, .myped-controller, .refresh-character").hide();
      $(".home-page").show();
      $(".requestdesc").show();
      $(".pedrequest").show();
      if (isAdmin) {
        $(".admin-btn").show();
      }
      $(".categories-cont").fadeIn(200);
      $(".mypeds-btn").fadeIn(200);
      currentCategory = null;
    } else {
      closeMenu();
    }
  }
  
  function openMenu(allpeds, admin) {
    isAdmin = admin;
    allPedsMap = {}; 
    allpeds.forEach(cat => {
      cat.peds.forEach(pedName => {
        allPedsMap[pedName] = cat.name;
      });
    });
    if (isAdmin) {
      $(".admin-btn").show();
      $(".requestdesc").html(`
        You are the admin <br> you can approve and reject ped requests from the admin page`);
      $(".requestdesc").css("top", "84%");
    } else {
      $(".admin-btn").hide();
      $(".requestdesc").css("top", "80%");
    }
    generateCategories(allpeds);
    $(".container").show();
    $(".book").fadeIn(300);
    $(".categories-cont").show();
    $(".home-page").show();

    $(document).on("keyup.menuEscape", function (e) {
        if (e.key === "Escape") {
          handleEscape();
        }
    });

    $(document).off("click.categoryClick").on("click.categoryClick", ".categorie-box", function () {
      playClickSound();
      const category = $(this).data("category");
      currentCategory = category;
      generatePeds(category, allpeds);
      $(".categories-cont").fadeOut(200);
      if (isAdmin) {
        $(".admin-btn").show();
      }
      $(".peds-container").fadeIn(500);
    });
  }

  function updateMyPedsUI(peds, lastPed) {
    const $container = $(".my-peds");
    $container.empty();
  
    if (!Array.isArray(peds)) return;
  
    let defaultAssigned = false;
  
    peds.forEach(ped => {
      let remaining = 0;
      if (ped.given_time && ped.duration) {
        const expiresAt = ped.given_time + (ped.duration * 86400);
        const secondsLeft = expiresAt - Math.floor(Date.now() / 1000);
        remaining = Math.max(0, Math.ceil(secondsLeft / 86400));
      }
  
      const isDefault = ped.default === true && !defaultAssigned;
      const isActive = lastPed && ped.ped === lastPed;
  
      if (isDefault) defaultAssigned = true;
  
      const $pedBox = $(`
        <div class="myped-box${isActive ? ' active' : ''}">
          <div class="ped-name">${ped.ped}</div>
          <div class="myped-remainingday">
            <span>${remaining} Day</span>
          </div>
          ${isDefault ? '<img id="defaultimg" src="./assets/img/default.png">' : ''}
        </div>
      `);
  
      $container.append($pedBox);
  
      if (isActive) {
        playClickSound();
        loadPedImage(ped.ped);
      }
    });
  }
  
  function updateRequestsUI(requests) {
    currentRequests = requests;

    if (!Array.isArray(requests)) return;

    requests.sort((a, b) => Number(b.request_date) - Number(a.request_date));

    $(".request-box").hide();

    requests.forEach(req => {
      const fullName = `${req.firstname} ${req.lastname}`;
      const date = req.request_date;
      const ped = req.ped;
      const category = allPedsMap[ped] || "Unknown";
      const charid = req.charid;

      let $existing = $(`.request-box[data-charid='${charid}']`).filter(function () {
        return $(this).find(".request-ped").text() === ped;
      });

      if ($existing.length === 0) {
        const requestBox = $(
          `<div class="request-box" data-charid="${charid}">
            <div class="request-player">${fullName}</div>
            <div class="request-date">${date}</div>
            <div class="request-category">${category}</div>
            <div class="request-ped">${ped}</div>
          </div>`
        );
        $(".request-peds").append(requestBox);
      } else {
        $existing.show();
      }
    });
  }
  
  function closeMenu() {
    $(".book").fadeOut(300);
    $(".container").fadeOut(200);
    $(document).off("keyup.menuEscape");
    currentCategory = null;
    $.post(`https://${GetParentResourceName()}/closeUI`, JSON.stringify({}));
  }
  
  window.addEventListener('message', function (event) {
    switch (event.data.action) {
      case 'open':
        openMenu(event.data.allpeds, event.data.isAdmin);

        if (Array.isArray(event.data.peds)) {
          updateMyPedsUI(event.data.peds, event.data.lastPed);
        }
        if (Array.isArray(event.data.requests)) {
          updateRequestsUI(event.data.requests); 
        }
        if (event.data.isAdmin && Array.isArray(event.data.requests)) {
          const requests = event.data.requests;
  
          requests.sort((a, b) => new Date(b.request_date) - new Date(a.request_date));
  
          const $container = $(".request-peds");
          $container.empty();
  
          requests.forEach(req => {
            const fullName = `${req.firstname} ${req.lastname}`;
            const date = req.request_date;
            const ped = req.ped;
            const charid = req.charid;
            const category = allPedsMap[ped] || "Unknown";
          
            const requestBox = $(`
              <div class="request-box" data-charid="${charid}">
                <div class="request-player">${fullName}</div>
                <div class="request-date">${date}</div>
                <div class="request-category">${category}</div>
                <div class="request-ped">${ped}</div>
              </div>
            `);
            $container.append(requestBox);
          });
        }

        if (event.data.timeSetting) {
          const $timeContainer = $(".time-cont");
          $timeContainer.empty();
        
          Object.values(event.data.timeSetting).forEach((day, index) => {
            const $box = $(`<div class="time-box">${day} DAY</div>`);
            
            if (index === 0) {
              $box.addClass("active");
              selectedTimeValue = day;
            }
          
            $timeContainer.append($box);
          });
        
          $(document).off("click", ".time-box").on("click", ".time-box", function () {
            $(".time-box").removeClass("active");
            $(this).addClass("active");
          
            selectedTimeValue = parseInt($(this).text());
          });
        }
        
        break;

      case "updateOutfitIndex":
        $(".outfit-value").text(event.data.index);
        break;
      case 'updateRequests':
        updateRequestsUI(event.data.requests); 
        break;
        
      case 'close':
        closeMenu();
        break;
    }
  });
  
});