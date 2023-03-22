// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"

//= require jquery
//= require jquery_ujs



$(function () {
  var $slider4 = $('#js-slider-4');

  $slider4.slick({
    arrows: false, // 前・次のボタンを表示しない
    dots: true, // ドットナビゲーションを表示する
    appendDots: $('.dots-4'), // ドットナビゲーションの生成位置を変更
    fade: true, // スライド切り替えをフェード
    autoplay: false, //自動再生させない
    slidesToShow: 1, // 表示させるスライド数
  });

  /*--- プログレスバー設定 -----------------------*/
  var
    time = 3,
    $bar = $('#js-progressBar'),
    isPause,
    tick,
    percentTime;
  function startProgressbar() {
    resetProgressbar();
    percentTime = 0;
    isPause = false;
    tick = setInterval(interval, 10);
  }
  function interval() {
    if (isPause === false) {
      percentTime += 1 / (time + 0.1);
      $bar.css({
        width: percentTime + "%"
      });
      if (percentTime >= 100) {
        $slider4.slick('slickNext');
        startProgressbar();
      }
    }
  }
  function resetProgressbar() {
    $bar.css({
      width: 0 + '%'
    });
    clearTimeout(tick);
  }
  startProgressbar();

  // カーソルが乗ったら止める
  $slider4.on({
    mouseenter: function () { isPause = true; },
    mouseleave: function () { isPause = false; }
  });

  // ドットがクリックされたら再発火(スライド切り替え前のイベント)
  $slider4.on('beforeChange', function (slick, currentSlide, nextSlide) {
    startProgressbar();
  });
});


