function upToTop() {
	let button = $('.button__to-top');

	$(window).on('scroll', () => {
		//	Если значение больше 500px показываем кнопку, иначе скрываем
		if ($(this).scrollTop() >= 500) {
			button.fadeIn();
		} else {
			button.fadeOut();
		}
	});

	//	При нажатии отменяем действие по-умолчанию
	button.on('click', (e) => {
		e.preventDefault();
		$('html').animate({scrollTop: 0}, 600);
	})
}

upToTop();