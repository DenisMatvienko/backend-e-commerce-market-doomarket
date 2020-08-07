{
	let position = 0;
	const slidesToShow = 3;
	const slidesToScroll = 2;
	const container = document.querySelector('.slider-container__img');
	const track = document.querySelector('.slider-track__img');
	const btnPrev = document.querySelector('.btn-prev__img');
	const btnNext = document.querySelector('.btn-next__img');
	const items = document.querySelectorAll('.slider-item__img');
	const itemsCount = items.length;
	const itemWidth = container.clientWidth / slidesToShow;
	const movePosition = slidesToScroll * itemWidth;

	// Made the width of elements to count
	items.forEach((item) =>{
		item.style.minWidth = `${itemWidth}px`;
	});

	//	Next button
	//	itemsLeft - means the remaining count of items, Math.abs- absolutely value
	//	itemsLeft - start pos = 0, when we scrool - get some value, we need compensate value=0 -is slidesToShow * itemWidth
	//	when we / - in that momen understand how much items is scroll, after from summ items- itemsCount take away
	//	values and gives 'itemsLeft'- values which left
	btnNext.addEventListener('click', () => {
		const itemsLeft = itemsCount - (Math.abs(position) + slidesToShow * itemWidth) / itemWidth;

		position -= itemsLeft >= slidesToScroll ? movePosition :  itemsLeft * itemWidth;

		setPosition();
		checkBtns();		
	});	

	// Prev button
	btnPrev.addEventListener('click', () => {
		const itemsLeft = Math.abs(position) / itemWidth;

		position += itemsLeft >= slidesToScroll ? movePosition :  itemsLeft * itemWidth;

		setPosition();
		checkBtns();
	});

	//	Track css to move prev on 'position' px
	const setPosition = () => {
		track.style.transform = `translateX(${position}px)`;
	};

	//	Get circumstances when buttons is disabled. 
	//  When count prev-'negatively' when we scroll to right side,actually track move to left side,thats cause negatively
	//	When position <= count, the button is disabled
	const checkBtns = () => {
		btnPrev.disabled = position === 0;
		btnNext.disabled = position <= -(itemsCount - slidesToShow) * itemWidth;	
	};

	// Disable button, when first time run carousell
	checkBtns();
}