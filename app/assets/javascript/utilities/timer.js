document.addEventListener('turbolinks:load', function() {
  var timer = document.querySelector('.timer');
  if (timer) {
    var time = timer.dataset.timer;

    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else {
        alert('У вас вышло время');
        document.querySelector('form').submit();
      }
      result = parseInt(time / 60) + ':' + time % 60;
      timer.innerHTML = result;
    }, 1000)
  };
});
